# Ruby App (Log Parser)

Simple OO based ruby script to parse log file and display formatted data!!!

# Files

**parser.rb** for executing script in order to pass logs and get results.

**webserver.log** log file to perform operations on.

**log_formatter.rb** class utilizes different modules to parse, sort, count, and display log stats.

**log/validator.rb** class responsible to check if file exists.

**log/sorted_counter.rb** class responsible to count page visits and sort them based on the most views to least views.

**log/exhibitor.rb** class responsible to display parsed results on the screen.

**Gemfile** contains ***rspec*** for testing specs.

# Usage

    chmod +x parser.rb
    ./parser.rb webserver.log

To test specs, run the following:

    gem install bundler -v '2.1.4'
    bundle install
    bundle exec rspec
