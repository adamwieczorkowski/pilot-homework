# pilot-homework

## Contractor app
in contractor directory run:
* `docker-compose up --build`
* `docker-compose run --rm web bin/rails db:create bin/rails db:migrate`
* `docker-compose run --rm web bin/rails webpacker:install`

After that, open `localhost:3000` in your browser


## Manager app
in manager directory run:
* `docker-compose up --build`
* `docker-compose run --rm web bin/rails db:create bin/rails db:migrate`
* `docker-compose run --rm web bin/rails webpacker:install`

After that, open `localhost:3001` in your browser
