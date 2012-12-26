# Docent: Contextual support for Rails applications

Docent is a friendly guide who points your application's users to the proper support documentation, as hosted in some external knowledge base like Desk.com, Zendesk, Confluence, and so on. It does so based on a table of URLs with controller-action combos, then supplies the link based on that view in your application.

Docent is a proof-of-concept, based on something I baked into a Rails 2-point-something app back in 2008 and recently realized I could use again. It operates as a mountable Rails engine and is still pretty raw right now.

## Setup

1. Add Docent to your Gemfile and install with Bundler.

2. Mount the engine in your application:

        mount Docent::Engine => "/docent"

3. Add the Docent-specific tables to your database:

        rake docent:install:migrations
        rake db:migrate

4. Create an initializer in `config/initializers/docent.rb`. This establishes a default link (top level of your knowledge base, support form, whatever) for views without support documents in Docent; it also provides a username and password for authentication via HTTP Basic:

        Docent.default_link = 'http://yourhelpsite.com/docs'
        Docent.username = 'docent_admin'
        Docent.password = 'secret'

## Usage

1. Load Docent's admin panel at `http://yourapp.com/docent`

2. Enter links to support documents. You can enter links specific to a controller#action combination, as well as catch-all links to controllers. Docent looks for links in the following order:

  1. The controller#action combination (e.g., `posts#new`)
  2. The controller only
  3. The default, set above in the initializer

3. Provide links to your application's users by adding the following in your application's layout file:

        <%= link_to_docent %>

  By default, Docent labels the link *Help*; you can add your own and any options you could otherwise pass to Rails' `link_to` helper:

        <%= link_to_docent 'Support', {target: 'new' } %>

## To Do

- add a generator to do most of the setup automatically
- replace HTTP basic authentication with something integrated with the host application
- add support for self-hosted documents (I'd link to be able to post documents directly from ScreenSteps into Docent via XMLRPC, for example).

## Contributing

I'd love to see your ideas and improvements. Fork the project on GitHub, make your changes (with specs!), and submit a pull request. **A note on specs:** I used Capybara feature specs to build Docent; the specs related to end-user access to links currently relies on a non-Rack::Test driver due to the need to check for redirection to an external site. I stuck with Selenium to minimize dependencies, at the expense of speed.

Docent is released under the [MIT License][mit]. See MIT-LICENSE for further details.

[mit]: http://www.opensource.org/licenses/MIT

## Thanks

Having not messed with mountable engines in Rails much in the past, I took inspiration from [StatBoard](https://github.com/vigetlabs/stat_board) by Viget Labs (in particular the initializer setup and testing setup).