<div class="one_full">
	<section class="title">
		<h4>Program</h4>
	</section>

	<section class="item">
		<div class="content">
			
			<fieldset id="filters">
				<legend>Filters</legend>
				
				<label for="query">Search</label> <input type="text" id="query" placeholder="Search..." />
				<button type="button" class="button" onclick="return dataList.search()">Search</button>
			</fieldset>
			
			<table>
				<thead>
					<tr>
						<th width="30">&nbsp;</th>
						<th>Title</th>
						<th>Desciption</th>
						<th>Status</th>
						<th>Created By</th>
						<th>Created On</th>
						<th>Updated By</th>
						<th>Updated On</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="data-list"></tbody>
			</table>
			
			<div id="rec-info" style="margin-top:10px"></div>
			<div id="pagination"></div>
		
		</div>
	</section>
</div>

<script>
var dataList = {
	params: {
		cmd: '',
		query: ''
	},
	url: '<?php echo site_url('admin/program') ?>',
	loadData: function() {
		this.params.cmd = 'load_data_list';
		
		$.ajax({
			url: this.url,
			data: this.params,
			dataType: 'json',
			beforeSend: function() {},
			success: function(json) {
				var html = '';
				for (var i = 0; i < json.data.length; i++) {
					html += '\
						<tr>\
							<td>' + json.data[i].number + '</td>\
							<td>' + json.data[i].title + '</td>\
							<td>' + emptyNull(json.data[i].short_desc) + '</td>\
							<td>' + (json.data[i].status == 1 ? 'Published' : 'Unpublished') + '</td>\
							<td>' + json.data[i].created_by + '</td>\
							<td>' + json.data[i].created_on + '</td>\
							<td>' + json.data[i].updated_by + '</td>\
							<td>' + json.data[i].updated_on + '</td>\
							<td width="150" nowrap="nowrap">\
								<a href="<?php echo site_url('/admin/program/edit') ?>/' + json.data[i].id + '" class="button">Edit</a>\
								<a href="<?php echo site_url('/admin/program/delete') ?>/' + json.data[i].id + '" class="button" onclick="return confirm(\'Are you sure you want to delete?\')">Delete</a>\
							</td>\
						</tr>\
					';
				}
				
				document.getElementById('data-list').innerHTML = html;
				document.getElementById('rec-info').innerHTML = json.rec_info;
				
				if (json.pagination) {
					document.getElementById('pagination').innerHTML = json.pagination;
					document.getElementById('pagination').setAttribute('class', 'pagination');
				} else {
					document.getElementById('pagination').innerHTML = '';
					document.getElementById('pagination').removeAttribute('class');
				}
			},
			complete: function() {}
		});
	},
	search: function() {
		this.params.cmd = 'load_data_list';
		this.params.query = document.getElementById('query').value;
		this.url = '<?php echo site_url('/admin/keanggotaan') ?>';
		this.loadData();
		document.getElementById('query').focus();
		
		return false;
	},
	delete: function(id) {
		if (confirm('Are you sure you want to delete?')) {
			this.params.cmd = 'DELETE';
			this.params.id = id;
			this.url = '<?php echo site_url('/site_info') ?>';
			$.ajax({
				url: this.url,
				data: this.params,
				dataType: 'json',
				success: function(json) {
					if (typeof json.loggedin != 'undefined' && !json.loggedin) {
						alert(json.message);
						window.location.href = json.redirect_url;
					}
					
					dataList.loadData();
				}
			});
		}
	},
	changePerPage: function() {
		this.url = '<?php echo site_url('/site_info') ?>';
		this.loadData();
	},
	order: function() {
		var sort = 'DESC';
		var sortClass = 'sort-desc';

		$('th a').live('click', function() {
			if (sort == 'DESC') {
				sort = 'ASC';
				sortClass = 'sort-asc';
			} else {
				sort = 'DESC';
				sortClass = 'sort-desc';
			}
			
			$('th a').removeClass('sort-asc');
			$('th a').removeClass('sort-desc');
			
			$(this).addClass(sortClass);
			
			listSites.params.cmd = 'LOAD_DATA';
			listSites.params.order = this.getAttribute('data-order');
			listSites.params.sort = sort;
			listSites.loadData();
		});
	},
	pagination: function() {
		$('#pagination a').live('click', function() {
			dataList.params.cmd = 'load_data_list';
			dataList.url = this.href;
			dataList.loadData();
			
			return false;
		});
	},
	init: function() {
		this.loadData();
		this.order();
		this.pagination();
		
		document.getElementById('query').onkeypress = function(e) {
			if (e.keyCode == 13) {
				dataList.search();
			}
		};
	}
};

function emptyNull(field) {
	if (field != null) {
		return field;
	} else {
		return '-';
	}
}

dataList.init();
</script>