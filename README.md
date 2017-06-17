# RDTestApp

The application that show users that accessed the partners sites

## Dependecies

* ruby 2.3.4
* bundler
* rails 5.1.1
* sqlite

## Prepare

Clone this repository and execute the comands in your terminal:

```
bundle install
rails db:create db:migrate
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

