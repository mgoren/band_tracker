Band Tracker
=============

by Mike Goren

Band Tracker is a simple web app that uses a database, Sinatra, and Active Record. This app tracks bands and venues where they perform.

Installation
------------

Install Band Tracker by first cloning the repository.  
```
$ git clone http://github.com/mgoren/band_tracker.git
```

Start the database:
```
$ postgres
```

Create the databases, tables, and test environment by running the following:
```
$ rake db:create
$ rake db:schema:load
$ rake db:test:prepare
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Mike Goren
