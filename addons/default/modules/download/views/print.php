<h4 class="print-title">Keanggotaan</h4>

<div style="overflow:auto">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th width="30">No.</th>
				<th>Nama Anggota</th>
				<th>Instansi</th>
				<th>Provinsi</th>
				<th>Kabupaten/Kota</th>
				<th>Jabatan</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$i = 1;
			foreach ($post['keanggotaan'] as $data) {
			?>
			<tr>
				<td style="text-align:center"><?php echo $i ?></td>
				<td><?php echo $data['nama_anggota'] ?></td>
				<td><?php echo $data['instansi'] ?></td>
				<td><?php echo $data['provinsi'] ?></td>
				<td><?php echo $data['kabupaten'] ?></td>
				<td><?php echo $data['jabatan'] ?></td>
			</tr>
			<?php
				$i++;
			}
			?>
		</tbody>
	</table>
</div>