<?php

defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @author Andi Malik Rizki Maula <andi.malik.notifications@gmail.com>
 */
class Pencapaian extends Public_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        redirect(site_url('capaian'));
    }

}
