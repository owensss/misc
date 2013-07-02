var thread_pattern=/http:\/\/bbs\.52pcgame\.com\/thread\-([0-9]+)(.*)\.html/;
var forum_pattern=/http:\/\/bbs\.52pcgame\.com\/forum-([0-9]+)(.*).html/;

var links = document.links;
for (var i = 0; i < links.length; ++i) {
	// replace mainpage
	links[i].href = links[i].href.replace("\"http://bbs.52pcgame.com\"", "\"http://121.199.23.180/bbs\"");
	// replace thread
	links[i].href = links[i].href.replace(thread_pattern, function(match, p1, offset, string) {
		return "http://121.199.23.180/bbs/forum.php?mod=viewthread&tid="+p1;
	}
	);
	// replace forum
	links[i].href = links[i].href.replace(forum_pattern, function(match, p1) {
		return "http://121.199.23.180/bbs/forum.php?mod=forumdisplay&tid="+p1;
	}
	);

}

