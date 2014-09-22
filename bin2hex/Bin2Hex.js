var fs = require("fs");
var inFile = process.argv[2];
fs.writeFileSync(inFile + ".hex", fs.readFileSync(inFile).toString("hex"), "UTF-8");
