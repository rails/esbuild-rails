# esbuild for Rails

Use [esbuild](https://esbuild.github.io) to bundle your JavaScript, then deliver it via the asset pipeline in Rails. This gem provides an installer to get you going with esbuild in a new Rails application, and a convention to use `app/assets/builds` to hold your bundled output as artifacts that are not checked into source control (the installer adds this directory to `.gitignore` by default).

You develop using this approach by running esbuild in watch mode in a terminal with `yarn build --watch` (and your Rails server in another, if you're not using something like [puma-dev](https://github.com/puma/puma-dev)). Whenever esbuild detects changes to any of the JavaScript files in your project, it'll bundle `app/javascript/application.js` into `app/assets/builds/javascript.js` (and all other entry points placed in the root of `app/javascript`). You can refer to the build output in your layout using the standard asset pipeline approach with `<%= javascript_include_tag "application" %>`.

When you deploy your application to production, esbuild attaches to the `assets:precompile` task to ensure that all your package dependencies from `package.json` have been installed via npm, and then runs `yarn build` to process all the entry points, as it would in development. The latter files are then picked up by the asset pipeline, digested, and copied into public/assets, as any other asset pipeline file.

That's it!

You can tailor the configuration of esbuild through the build script in `package.json`. Or if you want to get fancy with plugins, you can setup an [external configuration](https://esbuild.github.io/getting-started/#build-scripts) to run through node.


## Installation

You must already have node and yarn installed on your system. Then:

1. Add `esbuild-rails` to your Gemfile with `gem 'esbuild-rails'`
2. Run `./bin/bundle install`
3. Run `./bin/rails esbuild:install`

Or, in Rails 7+, you can preconfigure your new application to use esbuild with `rails new myapp -j esbuild`.


## The sister gem to rollupjs-rails

This gem is almost identical in setup and purpose to [`rollupjs-rails`](https://github.com/rails/rollupjs-rails), which follows the same conventions, but uses [rollup.js](https://rollupjs.org) instead.


## License

esbuild for Rails is released under the [MIT License](https://opensource.org/licenses/MIT).
