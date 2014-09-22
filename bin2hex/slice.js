var fs = require("fs");
var inFile = process.argv[2];

var src = fs.readFileSync(inFile, "UTF-8").toString();

src = src.replace(/\r\n/g, "");
var dst = [];

var start = 0;
var end = 0;
var sliceLength = 32;

var slice

end = sliceLength;
while( (slice = src.slice(start, end)).length > 0 ) {
	dst.push(slice);
	start = end;
	end += sliceLength;
}


fs.writeFileSync(inFile + ".slice", dst.join("\n"), "UTF-8");
