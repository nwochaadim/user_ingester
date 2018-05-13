# UserIngester

UserIngester is a Rails 5.1.6 application.

The core functionality of the app is to read csv_records from a provided url and then ingest this records into a db.

## Architecture

The UML diagram below illustrates the entire application's architecture

![Application Architecture](https://i.imgur.com/Lav3v9c.png)

## Setup

1. Get the code.

        % git clone https://github.com/nwochaadim/user_ingester

2. Cd into directory

        % cd user_ingester/

3. Set up the application

        % bin/setup

## Usage
The csv record importation is handled via a rake task which can be seen by running:

        % rake -T | grep import

To run this task, you may choose to provide an optional import url

        % rake users:import['optional import url']

## Testing

This project follows BDD/TDD best practices.

        % bin/rspec spec/

## Continuous Integration

CI is hosted with [CircleCI](https://circleci.com/gh/nwochaadim/user_ingester). The
build is run automatically whenever any branch is updated on Github.

## Dependencies
Refer to [Gemfile](https://github.com/nwochaadim/user_ingester/blob/master/Gemfile) for list of gem dependencies

[Postgresql](http://www.postgresqltutorial.com/install-postgresql/): The Project uses postgres as its database.
