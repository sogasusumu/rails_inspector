# RailsInspector
RailsApplicationの以下の定義を取得するPluginです。

- routesに定義されたController及びAction
- ApplicationRecordを継承したClasses

## Usage
routesに定義されたController及びActionを取得する
```ruby
RailsInspector.controller_with_actions
# => [{ controller: 'posts', action: 'index' }, ...]
```

ApplicationRecordを継承したClassesを取得する
```ruby
RailsInspector.models
# => ['post', 'comment', ...]
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_inspector'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_inspector
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
