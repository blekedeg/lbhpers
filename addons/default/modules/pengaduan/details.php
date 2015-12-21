<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Videos module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Contact
 */
class Module_Pengaduan extends Module
{

	public $version = '1.0.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Pengaduan',
				'id' => 'Pengaduan'
			),
			'description' => array(
				'en' => 'Pengaduan module.',
				'id' => 'Modul Video',				
			),
			'frontend' => true,
			'backend' => true,
			'menu' => 'content',
			'sections' => array(
				'pengaduan' => array(
					'name' => 'Pengaduan',
					'uri' => 'admin/pengduan',
					'shortcuts' => array(
						array(
							'name' => 'pengaduan:pengaduan_create_title',
							'uri' => 'admin/pengaduan/add',
							'class' => 'add',
						),
					)
				)
			)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('pengaduan');

		$tables = array(
			'pengaduan' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => TRUE),
				'name' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL, 'null' => TRUE),
				'email' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL, 'null' => TRUE),
				'subject' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL, 'null' => TRUE),
				'description' => array('type' => 'TEXT', 'default' => NULL, 'null' => TRUE),
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
        
        
		$drop1 = $this->db->query("DROP TABLE IF EXISTS ".$this->db->dbprefix('pengaduan')."; ");
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