# Decidim::UserExporter

Allow Decidim administrators to export user data from backoffice.

## Usage

UserExporter will be available as a Component for a Participatory
Space.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "decidim-user_exporter"
```

And then execute:

```bash
bundle
```

## Configure

By default, fields to export from `extended_data` are defined, same for the export format

You can redefine those options as following:

In your `config/initializers/decidim.rb`, add following config

```
Decidim.configure do |config|
  # Allows to define the column name in database, default : :extended_data
  config.extended_data_column = :metadata

  # Update fields to export from column extended_data : Default - [:country, :postal_code]
  config.export_user_fields = [:country, :postal_code]

  # Change the export format list : Default - %w(CSV JSON Excel)
  config.export_users_formats = %w(CSV).freeze
end
```

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
