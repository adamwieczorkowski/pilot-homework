# pilot-homework

## Contractor app
in contractor directory run:
* `docker network create pilot_network`
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

## Demo
https://user-images.githubusercontent.com/7962777/123812339-4b302b80-d8f4-11eb-812b-5c93d46988ef.mov
