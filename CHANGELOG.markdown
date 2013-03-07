# CHANGELOG

## 0.0.3

- Update gemspec to support Rails 4.0.
- Fix generator to properly inject mount in routes.rb.
- Rework `link_for` method to properly return the correct link, regardless of links' order in the `links` table.

## 0.0.2

### Enhancements

- Add generator to simplify installation; use `rails generate docent:install` to mount engine, create initializer file, and copy migrations.

### Bug fixes

- Remove and ignore `Gemfile.lock` from gem to follow best practice.

## 0.0.1

- Initial release.