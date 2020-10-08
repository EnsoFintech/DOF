# DOF
A simple gem to interact with the Mexican DOF open data service

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dof'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dof

## Usage

Add a new initializer and add the following lines
```ruby
require "DOF"

DOF.config do |c|
  c.base_uri = "https://sidofqa.segob.gob.mx/dof/sidof/"
end
```

### Querying the current USD exchange rate

To get the current (daily) exchange rate call `USD_exchange_rate`

```ruby
DOF::Indicator.USD_exchange_rate
```

This will return an `RequestResponse` object with the following attributes:

```ruby
# An array of indicator objects
:indicators
# A request response confirmation
:response_code
# response status eg: 200/500
:response_status
# number of indicators found
:total_indicators
```

### Querying the current UDIS exchange rate

To get the current (daily) exchange rate call `UDIS_exchange_rate`

```ruby
DOF::Indicator.UDIS_exchange_rate
```

### Querying indicators by date range

You can call `USD_exchange_rate` and `UDIS_exchange_rate` with date params

```ruby
DOF::Indicator.USD_exchange_rate(date: initial_date, end_date: end_date)
```

The accepted date formats are:
* `String` in *mm/dd/YYYY* format
* `String` in *mm-dd-YYYY* format
* `String` in *mm.dd.YYYY* format
* `Date` type, eg: *Date.today*

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yellowme/DOF.
