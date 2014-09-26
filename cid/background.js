function start() {
	alert("hello world");
}

chrome.browserAction.onClicked.addListener(start);
