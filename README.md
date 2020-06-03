## Репозиторий для курса "Микросервисы на Ruby" от школы ["Thinknetica"](https://thinknetica.com/)

Реализация микросервиса Ads на основе [исходного монолитного приложения](https://github.com/psylone/ads)

### Требования:
- Поскольку это микросервис, используйте любые библиотеки (gem-ы), кроме Rails или Hanami целиком. 
- Микросервис Ads должен обладать тем же функционалом по созданию и получению коллекции объявлений что и монолит (тот же API). 
- Вместо токена пользователя при создании объявления передавайте явный `user_id` гипотетического пользователя.

### Ads microservice

Для реализации использована связка [sinatra](https://github.com/sinatra/sinatra) + [sinja](https://github.com/mwpastore/sinja) + [sequel](https://github.com/jeremyevans/sequel)

### Установка и запуск приложения

- Склонируйте репозиторий:

```
git clone git@github.com:konoplev-roman/thinknetica_ads_microservice.git && cd thinknetica_ads_microservice
```

- Установите зависимости:

```
bundler install
```

- Создайте Postgres базу данных и выполните миграции:

```
createdb thinknetica_ads_microservice
sequel -m db/migrations postgres://postgres@localhost/thinknetica_ads_microservice
```

- Запустите приложение:

```
rackup
```

### API

#### Create

```
Request:

POST /ads
Accept: application/vnd.api+json
Content-Type: application/vnd.api+json

Body:

{
  "data": {
    "type": "ads",
    "attributes": {
      "title": "foo",
      "description": "bar",
      "city": "baz",
      "user_id": "1"
    }
  }
}

Response:

{
  "data": {
    "type": "ads",
    "id": "2",
    "attributes": {
      "title": "foo",
      "description": "bar",
      "city": "baz"
    },
    "links": {
      "self": "/ads/2"
    }
  },
  "jsonapi": {
    "version": "1.0"
  },
  "included": []
}
```

#### Index

```
Request:

GET /ads
Accept: application/vnd.api+json
Content-Type: application/vnd.api+json

Response:

{
  "data": [
    {
      "type": "ads",
      "id": "2",
      "attributes": {
        "title": "foo",
        "description": "bar",
        "city": "baz"
      },
      "links": {
        "self": "/ads/2"
      }
    }
  ],
  "jsonapi": {
    "version": "1.0"
  },
  "included": []
}
```
