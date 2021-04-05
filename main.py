from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
import urllib.request
from flask_mail import Mail
import json
import os
import math
import smtplib


with open('config.json', 'r') as c:
    params = json.load(c)['params']

local_server = True

app = Flask(__name__)
app.secret_key='super-security-key'
mail_settings = {
    "MAIL_SERVER": 'smtp.gmail.com',
    "MAIL_PORT": 465,
    "MAIL_USE_TLS": False,
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": params["gmail_username"],
    "MAIL_PASSWORD": params["gmail_password"]
}
app.config.update(mail_settings)
mail = Mail(app)
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    message = db.Column(db.String(120), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    country = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    # Sno, name, email, phone_num, mes, date
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(29), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    name = db.Column(db.String(50), nullable=False)
    subtitle = db.Column(db.String(80), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(20), nullable=True)


@app.route("/")
@app.route("/home")
def home():
    return render_template("index.html", params=params)


@app.route("/about")
def about():
    return render_template("about.html", params=params)


@app.route("/contact", methods=["GET", "POST"])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        country = request.form.get('country')
        message = request.form.get('message')
        entry = Contacts(name=name, email=email, phone_num=phone, country=country, message=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message("Invincible's from "+str(name), sender=str(email), recipients = [params["gmail_username"]],
                          body="Message: "+str(message)+"\n" "Phone no: "+str(phone)+"\n" "Country : "+str(country)+
                               "\n" "E-mail Address: "+email)
    return render_template("contact.html", params=params)


@app.route("/blog/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html", params=params, post=post)


# @app.route("/blog")
# def blog():
#     posts = Posts.query.filter_by().all()
#     last = math.ceil(len(posts) / int(params['no_of_posts']))
#     # [0: params['no_of_posts']]
#     # pagination logic
#     page = request.args.get('page')
#     if (not str(page).isnumeric()):
#         page = 1
#     page = int(page)
#     posts = posts[(page - 1) * int(params['no_of_posts']): (page - 1) * int(params['no_of_posts']) + int(
#         params['no_of_posts'])]
#     # first page
#     if (page == 1):
#         prev = "#"
#         next = "/blog/?page=" + str(page + 1)
#     # Last page
#     elif (page == last):
#         prev = "/blog/?page=" + str(page - 1)
#         next = "#"
#     else:
#         prev = "/blog/?page=" + str(page - 1)
#         next = "/blog/?page=" + str(page + 1)
@app.route("/blog", methods=['GET'], defaults={"page" : 1})
@app.route('/blog/<int:page>', methods=['GET'])
def view(page=1):
    per_page = params['no_of_posts']
    posts = Posts.query.order_by(Posts.sno.desc()).paginate(page, per_page, error_out=False)
#         # return render_template('view.html', posts=posts)
    return render_template('blog.html', params=params, posts=posts)


@app.route("/work")
def work():
    return render_template("work.html", params=params)


# @app.route("/login")
# def login():
#     return render_template("login.html", params=params)
@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_username']:
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method=='POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_username'] and userpass == params['admin_password']):
            #set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts= posts)
    return render_template('login.html', params=params)



@app.route("/blog/delete/<string:sno>", methods=["GET", "POST"])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/blog/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_username']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            name = request.form.get('name')
            date = datetime.now()
            if sno == '0':
                post = Posts(title=box_title, slug=slug, content=content, name=name, subtitle=tline, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.name = name
                post.subtitle = tline
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/blog/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post, sno=sno)


app.run(debug=True)
