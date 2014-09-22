var fs = require("fs");
var inFile = process.argv[2];

var src = fs.readFileSync(inFile, "UTF-8").toString();
fs.writeFileSync(inFile + ".merge", src.replace(/\r\n/g, ""), "UTF-8");
