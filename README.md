# README

- [About App](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#about-app)
- [Check App](https://coding-challenge-autoscout24.herokuapp.com/)
- [Check App Locally](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#check-app-locally)
- [API Endpoints](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#endpoints)
- [Test App](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#test-app)


# About App:
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24README.md#readme)

* Ruby version

  ```ruby
  2.6.6
  ```
* System dependencies

  ```ruby
  bundle install
  ```

* Database creation

  ```ruby
  rails db:create db:migrate db:seed
  ```

* Server initialization

  ```ruby
  rails s
  ```

# Check APP
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

* Check APP on Heroku
  [Coding Challenge](https://coding-challenge-autoscout24.herokuapp.com/)
  

# Check App Locally
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

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


# API Endpoints
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)


# Test App
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

I created a series of tests to verify that all messages created are done under the right
conditions.

**How to test app:**
On the terminal (in the directory of the project) run:
- Locally
```ruby
rspec
```


You should be able to see 2 types of tests. The first one, **Messages API** will verify
all the basic CRUD actions.
- Creating 10 messages and ```GET``` all of them with a ```:success``` status.
- Creating 1 message and ```GET``` it with a ```:success``` status.
- Creating 1 message with a ```POST``` request.
- Updating 1 message, first Created with a ```POST``` request, then updating the same
message with a ```PATCH``` request
- And finally, deleting 1 message, first Created with a ```POST``` request, then deleted that
same message with a ```DELETE``` request.

In the second part **Check Validations**, all validations are tested:
- A Message instance is created where its ```UUID``` should match a REGEX for UUIDs
- A Message instance is created with different types of characters from ```all types of languages```
- A Message instance is created with an ```HTML Tag``` on its body. It checks that the validation error matches the validation of the model.
- A Message instance is created with more than ```255 characters```. It checks that the validation error matches the validation of the model.
- A Message instance is created with an ```e-mail``` and a ```link``` and it gets a 200 status.
- A Message instance is created. Then we GET that message and check that it has a ```counter``` not nil and to that its value is 1 due that it's the first time
that message is retrieved.
