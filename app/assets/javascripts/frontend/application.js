$(function(){
	var vimeoPlayerIframes = $('iframe.vimeo-player');
	var players = $.map(vimeoPlayerIframes, function(el) {
		return $f(el)
	})
	$.each(players, function(i, player){
		player.addEvent('ready', function() {
			player.addEvent('seek', VimeoHandlers.onSeek);
			player.addEvent('playProgress', VimeoHandlers.onPlayProgress);
		});
	});
});

var VimeoHandlers = {
	onPlayProgress: function(data, id) { console.log(data.seconds + 's played') },
	onSeek: function (data, id) { console.log(data.seconds + 's seek') }
}