# The Hitbtc test app

The simple app with integration of [hitbtc.com](http://www.hitbtc.com). The app connect to hitbtc API and get the ticker's info periodically.

You need to install docker and docker-compose. After it run:
1. `docker-compose run web rake db:create`
2. `docker-compose run web rake db:migrate`
3. `docker-compose run web rake db:seed`
4. `docker-compose up`.
