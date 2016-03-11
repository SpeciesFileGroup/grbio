# Grbio


Grbio is an unofficial set of utilties that wrap the CSV data available at http://grbio.org. The provide simple methods to download the data, and some methods to examine it.  They also include a template generator to turn the data into Rails models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grbio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grbio

## Usage

See also specs.

```
 require 'grbio'
 Grbio.download_resources   # => downloads to /tmp/*.csv

 Grbio::RailsMigration.all_migrations # => puts migration templates
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SpeciesFileGroup/grbio.


## License

The gem is available as open source under the terms of the [University of Illinois/NCSA Open Source License](http://opensource.org/licenses/MIT).

