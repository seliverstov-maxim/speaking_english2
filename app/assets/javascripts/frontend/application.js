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


	subtitle = SrtParse($('.subtitle code').html());
//	subtitle = _.groupBy(subtitle, 'start')
});

var VimeoHandlers = {
	onPlayProgress: function(data, id) {
		milisec = data.seconds * 1000
		sub_line = _.find(subtitle, function(e){ return(e.start < milisec && e.stop > milisec) })
		if(sub_line){
			$('.subtitle-output').html(sub_line.text)
		}
	},
	onSeek: function (data, id) { console.log(data.seconds + 's seek') }
}
