namespace :esbuild do
  desc "Compile using esbuild with yarn build"
  task :compile do
    system "yarn install && yarn build"
  end
end

Rake::Task["assets:precompile"].enhance(["esbuild:compile"])
Rake::Task["test:prepare"].enhance(["esbuild:compile"])
