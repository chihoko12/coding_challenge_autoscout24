# README

- [About App](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#about-app)
- [App Usage - CRUD API Endpoints](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#endpoints)
- [Tests](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#testing-app)
- [Check App](https://coding-challenge-autoscout24.herokuapp.com/)

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

* Heroku

  [Coding Challenge](https://coding-challenge-autoscout24.herokuapp.com/)

# Install App Locally
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

**[GitHub Repo](https://github.com/chihoko12/coding_challenge_autoscout24)**

- Clone the repo with this command:
(Go to a directory where you will like to put this project, like for example ```~ && cd Desktop/``` )
```ruby
git clone git@github.com:chihoko12/coding_challenge_autoscout24.git
```
```ruby
cd coding_challenge_autoscout24
```

to run the app locally,
If you want to skip the [app installation locally](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#install-app-locally)
section.


- You can also download the app with the following link:
  - [Get App Here]https://github.com/chihoko12/coding_challenge_autoscout24/archive/master.zip)

  - Unzip file.
  - Open Console.
  - Change Directory to the project folder **coding_challenge_autoscout24**

### Install App:

This project is built in
  ```ruby
  ruby '2.6.5'
  ```

  * In order to check the ruby version installed in your machine run:
    ```ruby
    ruby -v
    ```

  If you are running another version of Ruby, we can easily change it with **rbenv**

  **rbenv Installation:**

  on the command line run:

  (Install **[BREW](https://brew.sh/)**, if you don't have it.)

  ```ruby
  brew install rbenv
  ```

  to check if it worked run:

  ```ruby
  rbenv --version
  ```

  **Install Ruby**

  Once rbenv is installed we have to install the Ruby version to be able to run
  this app locally. Run, on the terminal:

  To check Ruby versions available:
  ```ruby
  rbenv install --list
  ```

  Install Ruby 2.6.5:
  ```ruby
  rbenv install 2.6.5
  ```
  ```ruby
  rbenv global 2.6.5
  ```

  And voilá :confetti_ball: the ruby version we need is installed. You
  can go back to your preferred Ruby version by doing
  ```ruby
  rbenv install RUBY_VERSION
  ```
  ```ruby
  rbenv global RUBY_VERSION
  ```

* Make sure you are using the desired Ruby version to install.
  ```ruby
  ruby --version
  ```

* To see if you already have Bundler installed
  ```ruby
  bundler --version
  ```
  or
  ```ruby
  bundle --version
  ```

* This will install the bundler gem in Ruby 2.6.5
  ```ruby
  gem install bundler
  ```


* Don't forget to run
  ```ruby
  bundle install
  ```

If this doesn't work, you might need to install other tools or software
that some of the gems require. Follow the messages and install them.
Run **bundle** until everything is OK!


* **Set up Database**

The following command will create databases based on database.yml,
load schema.rb, and seed the data by running seeds.rb.

```ruby
  rails db:setup
```

Run ```bundle install``` & ```rails db:migrate``` in case there are pending migrations. But I believe
it won't be necessary.


You don't have PostgreSQL, no problem:

```ruby
brew install postgresql
```

You can always check before with **postgres -V** if it is installed or not.
Then run:

```ruby
brew services start postgresql
```

* Once everything is Ok! you should be able to start the server.

Run now ```rails s``` and by default, the
server for the API will be hosted on ```http://localhost:3000```

It should be running in ```localhost:3000``` to be able to fetch and send data
from Postman. Run

```ruby
rails s --p 3000
```
in case the default port is not 3000.

# APP PROCESS:
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

- I created a new rails app, API only, with postgreSQL for DB.

  ```ruby
  rails new coding_challenge_autoscount24 --database postgresql --api
  ```

# ENDPOINTS:
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)


# Testing App
[↑ Go To Top ↑](https://github.com/chihoko12/coding_challenge_autoscout24/README.md#readme)

I created a series of tests to verify that all messages created are done under the right
conditions.

**How to test app:**
On the terminal (in the directory of the project) run:
- Locally
```ruby
rspec
```

- Docker:

```ruby
docker-compose run web rspec
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
