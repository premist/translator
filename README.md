translator
==========

[![Build Status](https://travis-ci.org/premist/translator.svg?branch=master)](https://travis-ci.org/premist/translator)

Example Rails 5 application to demonstrate deployment workflow with Docker and Google App Engine. Uses [Webpacker](https://github.com/rails/webpacker) and [Vue.js](https://vuejs.org/) for frontend stack.

![translator screenshot](https://user-images.githubusercontent.com/291078/29526478-ccb9bab0-86d0-11e7-8bd2-6924d6b8dbb4.png)

## Requirements
- Ruby 2.4.1
- Node.js
- Yarn

## Up and running
- Run `bundle install` to install Ruby dependencies.
- Run `yarn install` to run frontend dependencies.
- Run `cp .env.example .env` and fill .env with your configuration.
- Run server: `./bin/rails server`
- Run webpack build: `./bin/webpack-dev-server`

## Rubocop and RSpec
- Run `bundle exec rubocop` to perform static code analysis.
- Run `bundle exec rspec` to perform tests.
