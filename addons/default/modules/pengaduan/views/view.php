<div id="player"></div>

{{ post }}

<div class="post">

	<h3>{{ title }}</h3>
	<div class="date-post">{{ date }}</div>

	<div class="body">
		<span>{{ description }}</span>
	</div>

</div>

<script src="js/flashembed.min.js"></script>
<script>
flashembed('player', {
	src:'swf/FlowPlayerDark.swf',
	width: 664, 
	height: 400
}, {
 	config: {   
		autoPlay: false,
		autoBuffering: true,
		initialScale: 'scale',
		videoFile: '{{ video }}'
 	}}
);
</script>

{{ /post }}