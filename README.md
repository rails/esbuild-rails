# esbuild for Rails

Use [esbuild](https://esbuild.github.io) to bundle your JavaScript and deliver it via the asset pipeline in Rails. This gem provides an installer to get you going with esbuild in a new Rails application, and a convention to use `app/assets/esbuilds` to hold your bundled output as artifacts that are not checked into source control (the installer adds this directory to `.gitignore` by default).

You develop using this approach by running esbuild in watch mode in a terminal with `npm run watch` (and your Rails server in another, if you're not using something like [puma-dev](https://github.com/puma/puma-dev). Whenever esbuild detects changes to any of the JavaScript files in your project, it'll bundle `app/javascript/application.js` into `app/assets/esbuilds/javascript.js`. You can refer to the build output in your layout using the standard asset pipeline approach with `<%= javascript_include_tag "application" %>`.

When you deploy your application to production, esbuild attaches to the `assets:precompile` task to ensure that all your package dependencies from `package.json` have been installed via npm, and then runs `npm run build` to process `app/javascript/application.js` into `app/assets/esbuilds/javascript.js`. The latter file is then picked up by the asset pipeline, digested, and copied into public/assets, as any other asset pipeline file.

That's it!

You can tailor the configuration of esbuild through the build script in `package.json`. Or if you want to get fancy with plugins, you can setup an [external configuration](https://esbuild.github.io/getting-started/#build-scripts) to run through node.


## Installation

1. Add `esbuild-rails` to your Gemfile with `gem 'esbuild-rails'`
2. Run `./bin/bundle install`
3. Run `./bin/rails esbuild:install`


## License

esbuild for Rails is released under the [MIT License](https://opensource.org/licenses/MIT).
