<?php

$this->load->view('include/header');
$this->load->view('include/menu');
if($tela!="") $this->load->view('Telas/'.$tela);
$this->load->view('include/footer');