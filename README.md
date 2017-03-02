### Sleepbus
This is the sinatra backend as well as vinilla javascript frontend for the original sleepbus.co website. The site uses PostgreSQL coupled with Active Record for the database stack. ERB templating is heavily used throughout the site with the data coming directly from the routes, in the long term the site should be moved over to a frontend framework. There was a rush to get an MVP out so some of the code is messy as a result. 

### Quickstart
1.  `bundle install`
2.  `bundle exec rake db:create`
3.  `bundle exec rake db:migrate`
4. 	`bundle exec rake db:seed` to load preseed database for development (see /db/seed)
5.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```


