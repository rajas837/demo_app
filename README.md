# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
#Generate Controller
* rails g/generate controller users template_name(index,new,show,edit)

#Generate model
* rails g/generate model user c.olumn_name(name,description)

# Modify column_name/add_column/delete_column: 
* rails g migration add_column_to_users address
* rails g migration rename_column_of_users_from_password_confirm_to_confirm_password
* rails g migration add_column_to_account user:belongs_to

# Run DB migration (creat db table)
* rake db:migrate

#List all the tables from DB
* ActiveRecord::Base.connection.tables

#sacffold
* rails generate scaffold user name:string mobile:number

#Install Postgres
* brew install postgresql
* gem install pg
* Restart --> brew services restart postgresql
* role does't exist --> createuser -s -r postgres
#Association
* has_one
* has_many
* has_one, through
    * @user = User.last
    * @user.history   [through account]
* has_many, through
    * @author = Author.last
    * @author.contents   [through articles]

* has_and_belongs_to_many
    * not understand

# Create Rest API
* rails g controller api/users --no-template

#Verify API through terminal using curl
* curl -X GET http://localhost:4000/api/users

* curl -X POST http://localhost:4000/api/users -d "user[name]=from_terminal&user[email]=terminal@gmail.com&user[password]=terminal&user[confirm_password]=terminal&user[mobile_no]=44444&,user[address]=bangalore"

#Add header
* curl -X POST http://localhost:4000/api/users -d "user[name]=from_terminal&user[email]=terminal@gmail.com&user[password]=terminal&user[confirm_password]=terminal&user[mobile_no]=44444&,user[address]=bangalore" -H "Accept: application.json"

#Update
* curl -X PATCH http://localhost:4000/api/users/26 -d "user[name]=from_terminal_updated"

#Delete
* curl -X DELETE http://localhost:4000/api/users/26

#Social media integration
* required 'omniauth-facebook' gem
* App ID: 634821683625371
* App Secret : 7950d03a04638e05c890a70066837194
* Site URL : http://localhost:4000/

#Payment Integration
* required 'braintree' and 'figaro' gem
* braintree sandbox accout details
* username : testaccount_braintree
* pass : Password@123
* environment : sandbox
* merchant id : g2t2hpph8q2mstn8
* public key : g8m4vfshjdzqcb2p
* private key : dac7c180c88d7ecfc9698740cac87ae7

#Alternate payment gateway
* instamojo

#Heroku
* username: rajasbe2012@gmail.com
* pass : demoapp@321

#Install heroku in app
* brew install heroku
#Production mode - if assets is not available
* bundle exec rake assets:precompile