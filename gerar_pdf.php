<?php
	include ('pdf/mpdf.php');
	
	$servidor = "localhost";
	$usuario = "root";
	$senha = "";
	$dbname = "almoxarifado";
	
	//Criar a conexão
	$conn = mysqli_connect($servidor, $usuario, $senha, $dbname);
	if(!$conn){
		die("Falha na conexao: " . mysqli_connect_error());
	}else{
		//echo "Conexao realizada com sucesso";
	}
	
	
	$result = "SELECT * FROM product";
	$resultado = mysqli_query($conn, $result);	
	$row = mysqli_fetch_assoc($resultado);
	
	$pagina = 
		"<html>
			<body>
				<h1>Informação dos produtos</h1>
				Produto: ".$row['name']."<br>
				Id: ".$row['id']."<br>
				Quantidade: ".$row['quantity']."<br>
				Valor: ".$row['value']."<br>
			</body>
		</html>
		";

$arquivo = "getProdutos.pdf";

$mpdf = new mPDF();
$mpdf->WriteHTML($pagina);

$mpdf->Output($arquivo, 'I');

// I - Abre no navegador
// F - Salva o arquivo no servido
// D - Salva o arquivo no computador do usuário
?>
