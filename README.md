# Super Waffle

[![Codacy](https://app.codacy.com/project/badge/Grade/97829679e0314337b1a8c8280be94c4c)](https://www.codacy.com/manual/paskudnyprogramista/super_waffle)
[![CircleCI](https://img.shields.io/circleci/build/gh/paskudnyprogramista/super_waffle/master?label=CircleCI&token=9d8a708476e57cf5a6e862a178e68def07c652db)](https://app.circleci.com/pipelines/github/paskudnyprogramista/super_waffle?branch=master)

Happy RESTfull API made with :heart:!

## Prerequisites

### Dependencies

To install dependencies:

`$ bundle install`

### Database

To setup you database:

`$ bundle exec rails db:setup`

## Server

To start your app:

`$ bundle exec rails s`

## Test

Te test your app:

`$ bundle exec rspec`

## Synchronization with JSONPlaceholder API

In order to start synchronization between Super Waffle and JSONPlaecholder, you need to add following cron jobs to your crontab:

```bash
*/30 * * * * /bin/bash -l -c 'cd /super_waffle && RAILS_ENV=<environment> bundle exec rake background_jobs:schedule_jsonplaceholder_users_sync'
```

```bash
*/60 * * * * /bin/bash -l -c 'cd /super_waffle && RAILS_ENV=<environment> bundle exec rake background_jobs:schedule_jsonplaceholder_posts_sync'
```

```bash
*/90 * * * * /bin/bash -l -c 'cd /super_waffle && RAILS_ENV=<environment> bundle exec rake background_jobs:schedule_jsonplaceholder_comments_sync'
```

Above examples will be run every 1 hour, but you can change that if you choose to.

## Continuous Integration

Automated tests are run by [CircleCI](https://circleci.com)

## Code review and code analytics

Code is being monitored and reviewed by [Codacy](https://www.codacy.com)

## Logging and error tracking

App is being monitored by [Sentry](https://sentry.io)
