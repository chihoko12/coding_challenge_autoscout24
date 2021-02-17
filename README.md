## README

- [About App](#about-app)
- [Check App](#check-app)
- [Check App Locally](#check-app-locally)
- [API Endpoint](#api-endpoint)


## About App
[↑ Go To Top ↑](#readme)

* Ruby version  ``` ruby 2.6.6 ```
* System dependencies  ``` ruby bundle install ```
* Database creation  ``` ruby rails db:create db:migrate db:seed ```
* Server initialization ``` ruby rails s ```

## Check APP
[↑ Go To Top ↑](#readme)

* Check APP on Heroku   [Coding Challenge](https://coding-challenge-autoscout24.herokuapp.com/)
  

## Check App Locally
[↑ Go To Top ↑](#readme)

* **Install the APP locally**
 
**[GitHub Repo](https://github.com/chihoko12/coding_challenge_autoscout24)**

- Clone the repo:
```ruby
git clone git@github.com:chihoko12/coding_challenge_autoscout24.git
```
```ruby
cd coding_challenge_autoscout24
```

- Or you can download the app with the following link:
  - [Get App Here](https://github.com/chihoko12/coding_challenge_autoscout24/archive/master.zip)


* **Run the APP locally**

When you have ruby and rbenv, you can run and test the app locally. 

The following command will create databases based on database.yml,
load schema.rb, and seed the data by running seeds.rb.

```ruby
  rails db:setup
```

Run ```bundle install``` & ```rails db:migrate``` 

This app uses PostgreSQL as database. If you don't have it, you need to install it:

```ruby
brew install postgresql
brew services start postgresql
```

* Start the server.
```rails s```

in case the default port is not 3000.
```ruby
rails s --p 3000
```

* Open the browser.
```http://localhost:3000```


## API Endpoint

listings GET
```
api/v1/listings
```

contacts GET
```
api/v1/contacts
```
