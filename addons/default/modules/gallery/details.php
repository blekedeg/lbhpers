<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Gallery module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Contact
 */
class Module_Gallery extends Module
{

	public $version = '1.0.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Gallery',
				'id' => 'Gallery'
			),
			'description' => array(
				'en' => 'Gallery module.',
				'id' => 'Modul Gallery',				
			),
			'frontend' => true,
			'backend' => true,
			'menu' => 'content',
			'sections' => array(
				'gallery' => array(
					'name' => 'Gallery',
					'uri' => 'admin/gallery',
					'shortcuts' => array(
						array(
							'name' => 'gallery:gallery_create_title',
							'uri' => 'admin/gallery/add',
							'class' => 'add',
						),
					)
				),
				'categories' => array(
					'name' => 'cat:list_title',
					'uri' => 'admin/gallery/categories',
					'shortcuts' => array(
						array(
							'name' => 'cat:create_title',
							'uri' => 'admin/gallery/categories/create',
							'class' => 'add',
						),
					),
				),
			)
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('gallery');
		$this->dbforge->drop_table('gallery_categories');

		$this->install_tables(array(
			'gallery_categories' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true, 'key' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
			),
		));

		$tables = array(
			'gallery' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => TRUE),
				'category_id' => array('type' => 'INT', 'constraint' => 11, 'default' => NULL, 'null' => TRUE),
				'title' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => NULL, 'null' => TRUE),
				'description' => array('type' => 'TEXT', 'default' => NULL, 'null' => TRUE),
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
        
        
		$drop1 = $this->db->query("DROP TABLE IF EXISTS ".$this->db->dbprefix('gallery')."; ");
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