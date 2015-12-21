<div id="ytplayer"></div>

{{ post }}

<div class="post">

	<h3>{{ title }}</h3>
	<div class="date-post">{{ date }}</div>

	<div class="body">
		<span>{{ description }}</span>
	</div>

</div>

<!-- 
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
 -->

 <script>
// Load the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// Replace the 'ytplayer' element with an <iframe> and
// YouTube player after the API code downloads.
var player;
function onYouTubePlayerAPIReady() {
	player = new YT.Player('ytplayer', {
      	videoId: '{{ video_id }}',
      	height: '400',
      	width: '664',
      	playerVars: {
      		autoplay: 1,
      		controls: 1
  		}
	});
}
</script>

{{ /post }}