-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Ago-2017 às 23:04
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almoxarifado`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `consumer`
--

CREATE TABLE `consumer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `consumer`
--

INSERT INTO `consumer` (`id`, `name`) VALUES
(1, 'Rita');

-- --------------------------------------------------------

--
-- Estrutura da tabela `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `group`
--

INSERT INTO `group` (`id`, `name`, `description`) VALUES
(1, 'Maçaneta', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `user` int(11) NOT NULL,
  `operation` tinyint(4) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `maxinvent` int(11) DEFAULT NULL,
  `mininvent` int(11) DEFAULT NULL,
  `catmat` varchar(100) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `value` decimal(19,9) NOT NULL DEFAULT '0.000000000',
  `quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `product`
--

INSERT INTO `product` (`id`, `name`, `group`, `unit`, `maxinvent`, `mininvent`, `catmat`, `observation`, `value`, `quantity`) VALUES
(1, 'arroz', 1, '10', 500, 1, '50', 'viena', '10.000000000', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `productimmediate`
--

CREATE TABLE `productimmediate` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `provider` int(11) DEFAULT NULL,
  `consumer` int(11) NOT NULL,
  `responsible` varchar(30) NOT NULL,
  `document` varchar(30) DEFAULT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` decimal(19,9) NOT NULL,
  `fiscnote` varchar(50) NOT NULL,
  `fiscnotedate` date NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `productinput`
--

CREATE TABLE `productinput` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `provider` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `value` decimal(19,9) NOT NULL,
  `empenho` varchar(255) DEFAULT NULL,
  `empenhodate` date DEFAULT NULL,
  `fiscnote` varchar(255) DEFAULT NULL,
  `fiscnotedate` date DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `productinput`
--

INSERT INTO `productinput` (`id`, `product`, `provider`, `date`, `quantity`, `value`, `empenho`, `empenhodate`, `fiscnote`, `fiscnotedate`, `obs`, `user`, `registered`) VALUES
(1, 1, 1, '2017-08-06', 10, '10.000000000', 'fsdhfj', '2017-08-06', '667', '2017-08-06', '', 2, '2017-08-06 18:54:04');

-- --------------------------------------------------------

--
-- Estrutura da tabela `productoutput`
--

CREATE TABLE `productoutput` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `consumer` int(11) NOT NULL,
  `responsible` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `value` decimal(19,9) NOT NULL,
  `quantity` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `user` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `productoutput`
--

INSERT INTO `productoutput` (`id`, `product`, `consumer`, `responsible`, `date`, `value`, `quantity`, `document`, `user`, `registered`) VALUES
(1, 1, 1, 'Rodrigo', '2017-08-06', '10.000000000', 3, '0', 2, '2017-08-06 18:54:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `provider`
--

CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `document` varchar(22) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone1resp` varchar(255) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `phone2resp` varchar(30) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `provider`
--

INSERT INTO `provider` (`id`, `name`, `document`, `email`, `phone1`, `phone1resp`, `phone2`, `phone2resp`, `address`) VALUES
(1, 'Dois Irmaos moto pecas', '11111111111111', 'digoleeke@gmail.com', '91023746', 'rodrigo', '', '', 'Rua 15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `lastlogin` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `name`, `login`, `password`, `level`, `lastlogin`, `active`) VALUES
(1, 'admin', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 3, NULL, 1),
(2, 'Rodrigo', 'digoleeke', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, NULL, 1),
(3, 'aa', 'aa', 'e0c9035898dd52fc65c41454cec9c4d2611bfb37', 1, NULL, 1),
(4, 'aa', 'aaa', 'e0c9035898dd52fc65c41454cec9c4d2611bfb37', 1, NULL, 1),
(5, 'rodrigo', 'digo', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1, NULL, 1),
(6, 'maria', 'maria', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `productimmediate`
--
ALTER TABLE `productimmediate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productimmediate_ibfk_1` (`product`),
  ADD KEY `productimmediate_ibfk_2` (`consumer`),
  ADD KEY `productimmediate_ibfk_3` (`provider`),
  ADD KEY `productimmediate_ibfk_4` (`user`);

--
-- Indexes for table `productinput`
--
ALTER TABLE `productinput`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `provider` (`provider`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `productoutput`
--
ALTER TABLE `productoutput`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `consumer` (`consumer`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `productimmediate`
--
ALTER TABLE `productimmediate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productinput`
--
ALTER TABLE `productinput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `productoutput`
--
ALTER TABLE `productoutput`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`group`) REFERENCES `group` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `productimmediate`
--
ALTER TABLE `productimmediate`
  ADD CONSTRAINT `productimmediate_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productimmediate_ibfk_2` FOREIGN KEY (`consumer`) REFERENCES `consumer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productimmediate_ibfk_3` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productimmediate_ibfk_4` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `productinput`
--
ALTER TABLE `productinput`
  ADD CONSTRAINT `productinput_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productinput_ibfk_2` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productinput_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `productoutput`
--
ALTER TABLE `productoutput`
  ADD CONSTRAINT `productoutput_ibfk_1` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productoutput_ibfk_2` FOREIGN KEY (`consumer`) REFERENCES `consumer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productoutput_ibfk_3` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
