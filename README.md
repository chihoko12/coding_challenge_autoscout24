## README

- [About App](#about-app)
- [Check App](#check-app)
- [How to run App locally](#how-to-run-app-locally)
- [How to test App locally](#hot-to-test-app-locally)
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


## Check APP
[↑ Go To Top ↑](#readme)

* Check APP on Heroku -->  [Coding Challenge](https://coding-challenge-autoscout24.herokuapp.com/)


## How to run App locally
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

Create databases. ```ruby rails setup ```
Run ```bundle install```

This app uses PostgreSQL as database. If you don't have it, you need to install it:
```ruby
brew install postgresql
brew services start postgresql
```

* Start the server. ```rails s```

in case the default port is not 3000. ```ruby rails s --p 3000 ```

* Open the browser.
```http://localhost:3000```

## How to test App locally
Test is made based on Rspec.

```ruby
bundle exec rspec
```


## API Endpoint

listings GET
```
api/v1/listings
```

contacts GET
```
api/v1/contacts
```
