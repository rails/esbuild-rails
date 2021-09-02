namespace :esbuild do
  desc "Compile using esbuild with npm run build"
  task :compile do
    system "npm install && npm run build"
  end
end

Rake::Task["assets:precompile"].enhance(["esbuild:compile"])
