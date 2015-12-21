<?php defined('BASEPATH') OR exit('No direct script access allowed.');

if (!function_exists('indonesian_date'))
{

	/**
	 * Formats a database time into a Indonesian format on Waktu Indonesia Barat.
	 *
	 * @param string $db_time The database date.
	 * @return string The formatted date.
	 */
	function indonesian_date($db_time)
	{
		$date_str = strtotime($db_time);
		$day = array ("Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu"); 	
		$month = array ("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","November","Desember");
		$day = $day[date("w", $date_str)];
		$date = date("d",$date_str)." ".$month[date("m",$date_str)-1]." ".date("Y",$date_str);
		$date2 = date("d/m/Y", $date_str);
		$time = date("h:i", $date_str);

		return $day.", ".$date." ".$time." WIB";
	}

}