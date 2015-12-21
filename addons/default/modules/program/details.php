<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Program module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Contact
 */
class Module_Program extends Module
{

	public $version = '1.0.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Program',
				'id' => 'Program'
			),
			'description' => array(
				'en' => 'Program module.',
				'id' => 'Modul Program',				
			),
			'frontend' => true,
			'backend' => true,
			'menu' => 'content',
			'sections' => array(
				'program' => array(
					'name' => 'Program',
					'uri' => 'admin/program',
					'shortcuts' => array(
						array(
							'name' => 'program:program_create_title',
							'uri' => 'admin/program/add',
							'class' => 'add',
						),
					)
				),
				'categories' => array(
					'name' => 'cat:list_title',
					'uri' => 'admin/program/categories',
					'shortcuts' => array(
						array(
							'name' => 'cat:create_title',
							'uri' => 'admin/program/categories/create',
							'class' => 'add',
						),
					),
				),
			)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('program_categories');
		$this->dbforge->drop_table('program');

		$this->load->driver('Streams');
		$this->streams->utilities->remove_namespace('programs');

		if ($this->db->table_exists('data_streams'))
		{
			$this->db->where('stream_namespace', 'programs')->delete('data_streams');
		}

		// Create the news categories table.
		$this->install_tables(array(
			'program_categories' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true, 'key' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
			),
		));

		$this->streams->streams->add_stream(
			'lang:program:program_title',
			'program',
			'programs',
			null,
			null
		);

		// Add the rest of the program fields the normal way.
		$program_fields = array(
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
		
		return $this->dbforge->add_column('program', $program_fields);
	}

	public function uninstall()
	{
		$ok = true;
        
        
		$drop1 = $this->db->query("DROP TABLE IF EXISTS ".$this->db->dbprefix('program')."; ");
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