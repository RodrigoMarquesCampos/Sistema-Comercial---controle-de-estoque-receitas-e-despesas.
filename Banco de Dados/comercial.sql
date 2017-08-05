-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05-Ago-2017 às 05:02
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `comercial`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `pessoa_fk` int(11) NOT NULL,
  `cnpj` varchar(15) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_gera_transacao`
--

CREATE TABLE `pessoa_gera_transacao` (
  `pessoa_fk` int(11) NOT NULL,
  `transacao_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `pessoa_fk` int(11) NOT NULL,
  `qtde` int(11) DEFAULT NULL,
  `valor_venda` float DEFAULT NULL,
  `valor_compra` float DEFAULT NULL,
  `cod` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacao_gera_movimentacao`
--

CREATE TABLE `transacao_gera_movimentacao` (
  `movimentacao_fk` int(11) NOT NULL,
  `transacao_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacao_tem_produto`
--

CREATE TABLE `transacao_tem_produto` (
  `produto_fk` int(11) NOT NULL,
  `transacao_fk` int(11) NOT NULL,
  `qtde` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `produto_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `pessoa_fk` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`pessoa_fk`);

--
-- Indexes for table `movimentacoes`
--
ALTER TABLE `movimentacoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoa_gera_transacao`
--
ALTER TABLE `pessoa_gera_transacao`
  ADD PRIMARY KEY (`pessoa_fk`,`transacao_fk`),
  ADD KEY `transacao_fk` (`transacao_fk`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`,`pessoa_fk`),
  ADD KEY `pessoa_fk` (`pessoa_fk`);

--
-- Indexes for table `transacao_gera_movimentacao`
--
ALTER TABLE `transacao_gera_movimentacao`
  ADD PRIMARY KEY (`movimentacao_fk`,`transacao_fk`),
  ADD KEY `transacao_fk` (`transacao_fk`);

--
-- Indexes for table `transacao_tem_produto`
--
ALTER TABLE `transacao_tem_produto`
  ADD PRIMARY KEY (`produto_fk`,`transacao_fk`),
  ADD KEY `transacao_fk` (`transacao_fk`);

--
-- Indexes for table `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`,`produto_fk`),
  ADD KEY `produto_fk` (`produto_fk`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`pessoa_fk`,`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD CONSTRAINT `fornecedores_ibfk_1` FOREIGN KEY (`pessoa_fk`) REFERENCES `pessoas` (`id`);

--
-- Limitadores para a tabela `pessoa_gera_transacao`
--
ALTER TABLE `pessoa_gera_transacao`
  ADD CONSTRAINT `pessoa_gera_transacao_ibfk_1` FOREIGN KEY (`pessoa_fk`) REFERENCES `pessoas` (`id`),
  ADD CONSTRAINT `pessoa_gera_transacao_ibfk_2` FOREIGN KEY (`transacao_fk`) REFERENCES `transacoes` (`id`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`pessoa_fk`) REFERENCES `fornecedores` (`pessoa_fk`);

--
-- Limitadores para a tabela `transacao_gera_movimentacao`
--
ALTER TABLE `transacao_gera_movimentacao`
  ADD CONSTRAINT `transacao_gera_movimentacao_ibfk_1` FOREIGN KEY (`transacao_fk`) REFERENCES `transacoes` (`id`),
  ADD CONSTRAINT `transacao_gera_movimentacao_ibfk_2` FOREIGN KEY (`movimentacao_fk`) REFERENCES `movimentacoes` (`id`);

--
-- Limitadores para a tabela `transacao_tem_produto`
--
ALTER TABLE `transacao_tem_produto`
  ADD CONSTRAINT `transacao_tem_produto_ibfk_1` FOREIGN KEY (`produto_fk`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `transacao_tem_produto_ibfk_2` FOREIGN KEY (`transacao_fk`) REFERENCES `transacoes` (`id`);

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`produto_fk`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`pessoa_fk`) REFERENCES `pessoas` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
