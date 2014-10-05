var SrtParse = function(input) {
	normalize_input = input.replace(/ +/gm,' ').trim();
	normalize_input = normalize_input.replace(/^\s/gm, '');
	var blocks = _.compact(normalize_input.split(/^\d+\n/gm));
	lines = _.map(blocks, function(el) {
		el = el.trim();
		var lines = el.split(/(?:\r\n|\r|\n)/gm)
		lines = _.map(lines, function(e){ return e.trim() })
		return _.compact(lines);
	});

	out = _.map(lines, function(el) {
		var time = el[0].match(/\d{2}:\d{2}:\d{2},\d{3}/g);
		var total_start = moment('00:00:00,000', 'HH:mm:ss,SSS');
		return {
			start: moment(time[0], "HH:mm:ss,SSS").diff(total_start),
			stop: moment(time[1], "HH:mm:ss,SSS").diff(total_start),
			source: el,
			text: el.slice(1).join('')
		};
	});
	return out;
}

