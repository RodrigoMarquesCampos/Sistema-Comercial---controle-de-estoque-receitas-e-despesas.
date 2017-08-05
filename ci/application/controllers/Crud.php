<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Crud extends CI_Controller {
    
	public function index()
	{
		$dados = array(
                    'titulo' => 'CRUD com CodeIgniter',
                    'tela' => '',  
                );
                $this->load->view('crud',$dados);
	}
}
