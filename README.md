# Grape API Example

This is a simple api example using `grape`, `grape-swagger`, `grape-swagger-rails` and `grape-entity`

## Usage

``` ruby
bundle install
```

add your self mysql config to `./config/database.yml`

``` ruby
rails db:create
```

``` ruby
rails db:migrate
```

``` ruby
rails db:seed
```

``` ruby
rails s
```

Then visit `http://localhost:3000/api_doc`