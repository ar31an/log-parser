# Ruby App (Log Parser)

Simple OO based ruby script to parse log file and display formatted data!!!

# Files

**custom_parser.rb** module contains all the logic used to parse and format the log file.
**log_formatter.rb** class utilizes the parser module by using the ***include*** keyword.
**log_formatter2.rb** class utilizes the parser module by using the ***extend*** keyword.
**parser.rb** and **parser2.rb** for executing scripts on class and instance level.
**webserver.log** log file to perform operations on.
**Gemfile** contains ***rspec*** for testing specs.

# Usage

    chmod +x parser.rb parser2.rb
    ./parser.rb webserver.log
    ./parser2.rb webserver.log

To test specs, run the following:

    gem install bundler -v '2.1.4'
    bundle install
    bundle exec rspec
