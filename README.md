## README

- [About App](#about-app)
- [Check App](#check-app)
- [Check App Locally](#check-app-locally)
- [API Endpoint](#api-endpoint)


## About App
[↑ Go To Top ↑](#readme)

* What this APP offers: 
1. Average Listing Selling Price per Seller Type
2. Distribution (in percent) of available cars by Make
3. Average price of the 30% most contacted listings
4. The Top 5 most contacted listings per Month

* Language: Ruby version  ``` ruby 2.6.6 ```
* Web Frameworks: Ruby on Rails
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
