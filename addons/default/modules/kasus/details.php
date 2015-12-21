<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Kasus module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Contact
 */
class Module_Kasus extends Module
{

	public $version = '1.0.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Kasus',
				'id' => 'Kasus'
			),
			'description' => array(
				'en' => 'Kasus module.',
				'id' => 'Modul Kasus',				
			),
			'frontend' => true,
			'backend' => true,
			'menu' => 'content',
			'sections' => array(
				'kasus' => array(
					'name' => 'Kasus',
					'uri' => 'admin/kasus',
					'shortcuts' => array(
						array(
							'name' => 'kasus:kasus_create_title',
							'uri' => 'admin/kasus/add',
							'class' => 'add',
						),
					)
				),
				'categories' => array(
					'name' => 'cat:list_title',
					'uri' => 'admin/kasus/categories',
					'shortcuts' => array(
						array(
							'name' => 'cat:create_title',
							'uri' => 'admin/kasus/categories/create',
							'class' => 'add',
						),
					),
				),
			)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('kasus_categories');
		$this->dbforge->drop_table('kasus');

		$this->load->driver('Streams');
		$this->streams->utilities->remove_namespace('kasus');

		if ($this->db->table_exists('data_streams'))
		{
			$this->db->where('stream_namespace', 'kasus')->delete('data_streams');
		}

		// Create the news categories table.
		$this->install_tables(array(
			'kasus_categories' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true, 'key' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
			),
		));

		$this->streams->streams->add_stream(
			'lang:kasus:kasus_title',
			'kasus',
			'kasus',
			null,
			null
		);

		// Add the rest of the kasus fields the normal way.
		$kasus_fields = array(
				//id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'category_id' => array('type' => 'INT', 'constraint' => 11, 'null' => true, 'default' => NULL),
				'title' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 200, 'null' => TRUE),
				'short_desc' => array('type' => 'TEXT', 'default' => NULL, 'null' => TRUE),
				'long_desc' => array('type' => 'TEXT', 'default' => NULL, 'null' => TRUE),
				'created_on' => array('type' => 'DATETIME', 'default' => NULL, 'null' => TRUE),
				//'created_by' => array('type' => 'INT', 'constraint' => 11, 'default' => 0, 'null' => TRUE),
				'updated_on' => array('type' => 'DATETIME', 'default' => NULL, 'null' => TRUE),
				'updated_by' => array('type' => 'INT', 'constraint' => 11, 'default' => NULL, 'null' => TRUE),
				'status' => array('type' => 'INT', 'constraint' => 1, 'default' => 1),
				'image' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => TRUE),
		);
		
		return $this->dbforge->add_column('kasus', $kasus_fields);
	}

	public function uninstall()
	{
		$ok = true;
        
        
		$drop1 = $this->db->query("DROP TABLE IF EXISTS ".$this->db->dbprefix('kasus')."; ");
        if($drop1 == false and $ok == true){
            $ok = false;
        }
        
		if($ok)
		{
			return TRUE;
		}
	}

	public function upgrade($old_version)
	{
		return true;
	}

}