# Survey App
[![Maintainability](https://api.codeclimate.com/v1/badges/bcf83cea410462f094b9/maintainability)](https://codeclimate.com/github/AlexTatarnikov/survey_app/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/bcf83cea410462f094b9/test_coverage)](https://codeclimate.com/github/AlexTatarnikov/survey_app/test_coverage)

A basic Survey App using rails 5.X framework with the following features where admin
creates a survey and share survey URL with users. After survey submission redirect to a survey
response page where user can see the survey questions with selected answers

#### Requirements:

* Ruby/Rails versions
    * ruby ~> '2.5.1'
    * rails ~> '5.2.1'

* System dependencies
    * postgresql 10.1

#### Application init

* `bin/setup`

#### HowTos

* How to run the test suite: `bundle exec rspec`
* Install all npm packages: `yarn install`
* Add new npm package: `yarn add $package`
* Regenerate API docs: `rake docs:generate`
* Run server: `rails server`

#### API Documentation

* You can check API documentation on your local machine http://localhost:3000/api/docs

#### Notes

* I decided to try [fast_jsonapi](https://github.com/Netflix/fast_jsonapi) instead of [active_model_serializers](https://github.com/rails-api/active_model_serializers) for this project,
  because it has really great performance in comparing to AMS. [Performance Document](https://github.com/Netflix/fast_jsonapi/blob/master/performance_methodology.md)

* All front-end is written on Vue and it fits great for the small projects like this.

* Instead of having User with role Guest or Admin, I've decoupled them into two separate models, Admin and User respectively. 
I prefer to use the roles system only if it is really required, avoiding too much complexity in the single User model.

*Version 14 October 2018*
