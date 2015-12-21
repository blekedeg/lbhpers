{{ if posts }}

	{{ posts }}
	
	<div class="page-header" style="border-bottom:none">
		<h1><a href="{{ url }}">{{ title }}</a></h1>
		
		{{ if category }}
		<div class="category">
			<a href="{{ url:site }}news/category/{{ category:slug }}">{{ category:title }}</a>
		</div>
		{{ endif }}
		
		<time class="date-post">{{ date }}</time>
	</div>

	<div class="content-body">
		
		<div class="row">
			<div class="col-md-4"><img src="{{ thumb }}" /></div>
			<div class="col-md-8">
				{{ preview }}
			
				<div><a href="{{ url }}">{{ helper:lang line="news:read_more_label" }}</a></div>
			</div>
		</div>
		
	</div>
	
	<div class="clearfix"></div>
	<hr />
	
	{{ /posts }}

	{{ pagination }}
	
	<div class="clearfix"></div>

{{ else }}
	
	{{ helper:lang line="news:currently_no_posts" }}

{{ endif }}