## 2.0.0, released 2013-04-07
* Distribute validation jobs using sidekiq
* Remove console logger

## 1.2.1, released 2013-04-05
* Revert printing 'x' on validation failure

## 1.2.0, released 2013-04-04
* FileSystem logger is now default
* Print an 'x' for each record validation failure when using FileSystem logger
* Output number of seconds for task completion

## 1.1.3, released 2013-04-01
* Remove extra period in output to remove batch confusion
* Set default batch size to 1000

## 1.1.2, released 2013-03-29
* Enable the logger, but set the log level to block SQL output

## 1.1.1, released 2013-03-28
* Don't show the SQL output for every query

## 1.1.0, released 2013-03-28
* CHANGE: Don't check base models if we have decendants
* Parameter for the batch size
* Sort models to be validated
* Fix progress reporting output
* Show total model record count
* Show model table name

## 1.0.0, released 2013-03-27
* Add rake task to generate config file
* Allow filtering of unwanted models
* Allow filtering of unwanted prefixes
* Don't check models without validation
* Don't check child models of STI

## 0.1.0, released 2013-03-26
* Rake task now takes parameters differently
* Classes now use instances, not class methods
* Add new logger class to allow for custom logging

## 0.0.3, released 2013-03-25
* Use table_exists? in place of table name
* Add progress indicator during run

## 0.0.2, released 2013-03-25
* Change to dependency on rails

## 0.0.1, released 2013-03-24
* Initial release
