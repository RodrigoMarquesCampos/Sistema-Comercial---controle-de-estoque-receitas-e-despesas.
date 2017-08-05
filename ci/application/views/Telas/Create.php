<?php

echo form_open('crud/create');
echo validation_errors('<p>','</p>');
echo form_label('Nome: ');
echo form_input(array('name'=>'nome'), set_value('nome'),'autofocus');
echo form_label('Login: ');
echo form_input(array('name'=>'login'), set_value('login'));
echo form_label('Senha: ');
echo form_input(array('name'=>'senha', 'type'=>'password'), set_value('senha'));
echo form_label('Repita a Senha: ');
echo form_input(array('name'=>'senha2', 'type'=> 'password'), set_value('senha2'));
echo form_submit(array('name'=>'cadastrar'), 'Cadastrar');
echo form_close();

