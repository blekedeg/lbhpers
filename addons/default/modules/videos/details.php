<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Videos module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Contact
 */
class Module_Videos extends Module
{

	public $version = '1.0.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Videos',
				'id' => 'Video'
			),
			'description' => array(
				'en' => 'Videos module.',
				'id' => 'Modul Video',				
			),
			'frontend' => true,
			'backend' => true,
			'menu' => 'content',
			'sections' => array(
				'videos' => array(
					'name' => 'Videos',
					'uri' => 'admin/videos',
					'shortcuts' => array(
						array(
							'name' => 'videos:video_create_title',
							'uri' => 'admin/videos/add',
							'class' => 'add',
						),
					)
				)
			)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('videos');

		$tables = array(
			'videos' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => TRUE),
				'title' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL, 'null' => TRUE),
				'description' => array('type' => 'TEXT', 'default' => NULL, 'null' => TRUE),
				'file' => array('type' => 'VARCHAR', 'constraint' => 200, 'default' => NULL, 'null' => TRUE),
				'image' => array('type' => 'VARCHAR', 'constraint' => 200, 'default' => NULL, 'null' => TRUE),
				'status' => array('type' => 'INT', 'constraint' => 1, 'default' => 1, 'null' => TRUE),
				'created_on' => array('type' => 'DATETIME', 'default' => NULL, 'null' => TRUE),
				'created_by' => array('type' => 'INT', 'constraint' => 10, 'default' => NULL, 'null' => TRUE),
				'updated_on' => array('type' => 'DATETIME', 'default' => NULL, 'null' => TRUE),
				'updated_by' => array('type' => 'INT', 'constraint' => 10, 'default' => NULL, 'null' => TRUE),
			),
		);

		if ( ! $this->install_tables($tables))
		{
			return false;
		}

		return TRUE;
	}

	public function uninstall()
	{
		$ok = TRUE;
        
        
		$drop1 = $this->db->query("DROP TABLE IF EXISTS ".$this->db->dbprefix('videos')."; ");
        if( $drop1 == false and $ok == true) {
            $ok = FALSE;
        }
        
		if($ok) {
			return TRUE;
		}
	}

	public function upgrade($old_version)
	{
		return true;
	}

}