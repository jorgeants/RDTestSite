# RDTestApp

The application that show users that accessed the partners sites

## Dependecies

* Ruby version 2.3.4
* Bundler
* PostgreSQL version 9.2 or above

## Prepare

Clone this repository and execute the comands in your terminal:

```
bundle install

rails db:create db:migrate

rails db:create db:migrate RAILS_ENV=test
```

## Up the server

For run the application and view in your browser, run this:

```
rails s
```

## Tests

This application use [Rspec](http://rspec.info) and [Capybara](http://teamcapybara.github.io/capybara/) for tests.
Run with the command:

```
rspec spec
```

