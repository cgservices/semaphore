# Semaphore
Counting semaphore implementation for Ruby 1.9.3  
based on semaphore.rb,v 1.2 2003/03/15 20:10:10 by Fukumoto.

## Install
### In your Gemfile

    source 'rubygems.org'
    gem 'semaphore'

### Manual install
    gem install semaphore

## Usage
    Semaphore.new(n) #create a n semaphore

    s.synchronize do
      ...
    end

See test/test_semaphore.rb for example

## Contributing to semaphore
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

## Copyright

Copyright (c) 2012 CG Services. See LICENSE.txt for
further details.

