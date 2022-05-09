# Ruby App (Log Parser)

Simple OO based ruby script to parse log file and display formatted data!!!



# Dependency

**Ruby 2.7.5** rvm install 2.7.5

**Bundler 2.3.12** gem install bundler -v '2.3.12'

**Bundle** bundle install



# Usage

**Set Permissions** chmod +x parser.rb

**Execute with invalid log file** ./parser.rb unknown.log

**Execute with invalid log file type** ./parser.rb webserver.txt

**Execute with empty log file** ./parser.rb webserver_empty.log

**Execute with valid log file** ./parser.rb webserver.log

**Sort in ascending order** ./parser.rb webserver.log asc

**Sort in descending order** ./parser.rb webserver.log desc



# Test Cases

**Run the specs** bundle exec rspec



# Rubocop

**Run rubocop** rubocop



# Files

**parser.rb** for executing script in order to pass logs and get results.

**log_formatter.rb** class utilizes different modules to parse, sort, count, and display log stats.

**log/validator.rb** class responsible to check if file exists.

**log/sorted_counter.rb** class responsible to count page visits and sort them based on the most views to least views.

**log/exhibitor.rb** class responsible to display parsed results on the screen.

**webserver.txt** text file to check invalid file type validator.

**webserver_empty.log** log file to check empty log file validator.

**webserver.log** log file to perform operations on.

**Gemfile** contains gems needed to run and test scripts.



# Improvements

**Fixtures** can use fixtures for the specs.
