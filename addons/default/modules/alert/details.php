<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Alert module
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Alert
 */
class Module_Alert extends Module
{
	public $version = '2.0.0';

	public function info()
	{
		$info = array(
			'name' => array(
				'en' => 'Alert',
				'id' => 'Alert'
			),
			'description' => array(
				'en' => 'Alert entries.',
				'id' => 'Post entri Alert'
			),
			'frontend' => true,
			'backend' => true,
			'skip_xss' => true,
			'menu' => 'content',

			'roles' => array(
				'put_live', 'edit_live', 'delete_live'
			),

			'sections' => array(
				'posts' => array(
					'name' => 'alert:posts_title',
					'uri' => 'admin/alert',
					'shortcuts' => array(
						array(
							'name' => 'alert:create_title',
							'uri' => 'admin/alert/create',
							'class' => 'add',
						),
					),
				),
				/*'categories' => array(
					'name' => 'cat:list_title',
					'uri' => 'admin/alert/categories',
					'shortcuts' => array(
						array(
							'name' => 'cat:create_title',
							'uri' => 'admin/alert/categories/create',
							'class' => 'add',
						),
					),
				),*/
			),
		);
		
		/*if (function_exists('group_has_role'))
		{
			if(group_has_role('alert', 'admin_alert_fields'))
			{
				$info['sections']['fields'] = array(
							'name' 	=> 'global:custom_fields',
							'uri' 	=> 'admin/alert/fields',
								'shortcuts' => array(
									'create' => array(
										'name' 	=> 'streams:add_field',
										'uri' 	=> 'admin/alert/fields/create',
										'class' => 'add'
										)
									)
							);
			}
		}*/

		return $info;
	}

	public function install()
	{
		//$this->dbforge->drop_table('alert_categories');

		$this->load->driver('Streams');
		$this->streams->utilities->remove_namespace('alert');

		// Just in case.
		$this->dbforge->drop_table('alert');

		if ($this->db->table_exists('data_streams'))
		{
			$this->db->where('stream_namespace', 'alert')->delete('data_streams');
		}

		// Create the alert categories table.
		/*$this->install_tables(array(
			'alert_categories' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true, 'key' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
			),
		));*/

		$this->streams->streams->add_stream(
			'lang:alert:alert_title',
			'alert',
			'alert',
			null,
			null
		);

		// Add the intro field.
		// This can be later removed by an admin.
		$intro_field = array(
			'name'		=> 'lang:alert:intro_label',
			'slug'		=> 'intro',
			'namespace' => 'alert',
			'type'		=> 'wysiwyg',
			'assign'	=> 'alert',
			'extra'		=> array('editor_type' => 'simple', 'allow_tags' => 'y'),
			'required'	=> true
		);
		$this->streams->fields->add_field($intro_field);

		// Ad the rest of the alert fields the normal way.
		$alert_fields = array(
				'title' => array('type' => 'VARCHAR', 'constraint' => 200, 'null' => false, 'unique' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 200, 'null' => false),
				//'category_id' => array('type' => 'INT', 'constraint' => 11, 'key' => true),
				'body' => array('type' => 'TEXT'),
				'parsed' => array('type' => 'TEXT'),
				'keywords' => array('type' => 'VARCHAR', 'constraint' => 32, 'default' => ''),
				'author_id' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
				'created_on' => array('type' => 'INT', 'constraint' => 11),
				'updated_on' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
				//'comments_enabled' => array('type' => 'ENUM', 'constraint' => array('no','1 day','1 week','2 weeks','1 month', '3 months', 'always'), 'default' => '3 months'),
				'status' => array('type' => 'ENUM', 'constraint' => array('draft', 'live'), 'default' => 'draft'),
				'type' => array('type' => 'SET', 'constraint' => array('html', 'markdown', 'wysiwyg-advanced', 'wysiwyg-simple')),
				'preview_hash' => array('type' => 'CHAR', 'constraint' => 32, 'default' => ''),
				'image' => array('type' => 'VARCHAR', 'constraint' => 200, 'default' => '', null => TRUE),
		);
		return $this->dbforge->add_column('alert', $alert_fields);
	}

	public function uninstall()
	{
		// This is a core module, lets keep it around.
		return false;
	}

	public function upgrade($old_version)
	{
		return true;
	}
}
