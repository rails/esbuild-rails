const watch = process.argv.includes("--watch") && {
  onRebuild(error) {
    if (error) console.error("[watch] build failed", error);
    else console.log("[watch] build finished");
  },
};

require("esbuild")
  .build({
    entryPoints: ["app/javascript/application.js"],
    bundle: true,
    outfile: "app/assets/esbuilds/application.js",
    watch: watch,
  })
  .catch(() => process.exit(1));
