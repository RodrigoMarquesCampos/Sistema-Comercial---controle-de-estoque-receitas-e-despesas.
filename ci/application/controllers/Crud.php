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
        
        	public function create()
	{
                //validacao form
                    
                $this->form_validation->set_rules('nome','NOME','trim|required|alpha|max_length[50]|ucwords');
                //|is_unique[comercial.login] verifica se é unico
                $this->form_validation->set_rules('login','Login','trim|required|max_length[30]|strtolower');
                $this->form_validation->set_rules('senha','Senha','trim|required|strtolower');
                $this->form_validation->set_message('matches','O campo %s está diferente fo campo %s');
                $this->form_validation->set_rules('senha2','Repita a Senha','trim|required|strtolower|matches[senha]');
                
                
                if($this->form_validation->run()==TRUE):
                    echo 'validacao ok, inserir no bd';
                endif;
                
		$dados = array(
                    'titulo' => 'CRUD &araquo; Create',
                    'tela' => 'create',  
                );
                $this->load->view('crud',$dados);
	}
        
        	public function retrieve()
	{
		$dados = array(
                    'titulo' => 'CRUD &araquo; Retrieve',
                    'tela' => 'retrieve',  
                );
                $this->load->view('crud',$dados);
	}
        
        	public function update()
	{
		$dados = array(
                    'titulo' => 'CRUD &araquo; Update',
                    'tela' => 'update',  
                );
                $this->load->view('crud',$dados);
	}
        
        	public function delete()
	{
		$dados = array(
                    'titulo' => 'CRUD &araquo; Delete',
                    'tela' => 'delete',  
                );
                $this->load->view('crud',$dados);
	}
        
        
        
        
        
}
