<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use Cartalyst\Sentinel\Native\Facades\Sentinel as Sentinel;
use Illuminate\Database\Capsule\Manager as Capsule;
class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$capsule = new Capsule;

		$capsule->addConnection([
			'driver'    => 'mysql',
			'host'      => 'localhost',
			'database'  => 'sentinel',
			'username'  => 'vagrant',
			'password'  => 'vagrant',
			'charset'   => 'utf8',
			'collation' => 'utf8_unicode_ci',
		]);

		$capsule->bootEloquent();

		$instance = new Sentinel();
		$sentinel = $instance->getSentinel(); /* @var $sentinel \Cartalyst\Sentinel\Sentinel */
		$sentinel->register([
			'email'    => 'test@example.com',
			'password' => 'foobar',
		]);
		$this->load->view('welcome_message');
	}

	public function main()
	{
		return $this->printtest();
	}
	public function printtest()
	{
		return 'printtest';
	}
}
