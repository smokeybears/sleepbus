### Sleepbus
This is the sinatra backend as well as vinall javascript frontend for the sleepbus.co website. The site uses PostgreSQL coupled with active record for the database stack. erb templating is heavily used throughout the site with the data coming directly from the routes, depending on what the scope of the site becomes erb should be switched over to a frontend framework. 

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


