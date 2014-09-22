var fs = require("fs");
var inFile = process.argv[2];
fs.writeFileSync(inFile + ".binary.png", new Buffer(fs.readFileSync(inFile).toString(), "hex"));
