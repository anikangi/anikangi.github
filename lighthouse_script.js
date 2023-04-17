const lighthouse = require("lighthouse");
const chromeLauncher = require("chrome-launcher");
const fs = require("fs");

const url = "https://anikangi.github.io/";
const flags = {
  output: "json",
  onlyCategories: ["performance", "accessibility", "best-practices", "seo"],
};

async function runLighthouse() {
  const chrome = await chromeLauncher.launch();
  flags.port = chrome.port;

  const results = await lighthouse(url, flags);

  fs.writeFileSync(
    "lighthouse-report.json",
    JSON.stringify(results.lhr, null, 2)
  );

  await chrome.kill();
}

runLighthouse();
