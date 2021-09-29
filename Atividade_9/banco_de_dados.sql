-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Set-2021 às 01:18
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_de_dados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `Nome` varchar(50) NOT NULL,
  `Sigla` varchar(3) NOT NULL,
  `Codigo` varchar(3) NOT NULL,
  `Coordenador` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`Nome`, `Sigla`, `Codigo`, `Coordenador`) VALUES
('Tec. Telemática', 'DTT', '121', '121031'),
('Tec. Construção de Edifícios', 'DCE', '122', '122047'),
('Eng. Computação', 'DEC', '125', '125331');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE `dependente` (
  `Nome` varchar(50) NOT NULL,
  `RG` varchar(10) NOT NULL,
  `Matricula_Professor` varchar(20) NOT NULL,
  `DATA_NASCIMENTO` date DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`Nome`, `RG`, `Matricula_Professor`, `DATA_NASCIMENTO`, `Sexo`) VALUES
('Joao Pedro', '4375000', '121003', '2001-01-16', 'M'),
('Laisa', '5467833', '121003', '1970-02-19', 'F'),
('Paulo', '9876588', '121003', '1960-12-11', 'M'),
('Maria', '1243233', '121031', '1980-01-24', 'F'),
('Joao', '5412343', '121031', '1966-06-29', 'M'),
('Marcos', '5322343', '122045', '2003-06-29', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `MatricProf` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`MatricProf`, `Email`) VALUES
('121003', 'PedroProf@gmail.com'),
('121031', 'JoseMariaProf@gmail.com'),
('122045', 'BentroProf@gmail.com'),
('122047', 'AnaClaraProf@gmail.com'),
('125331', 'MariaLuizaProf@gmail.com'),
('125332', 'JoanaMariaProf@gmail.com'),
('125335', 'JoaoCarlosProf@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `Nome` varchar(50) NOT NULL,
  `SNome` varchar(50) NOT NULL,
  `Matricula` varchar(20) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(8,2) DEFAULT NULL CHECK (`Salario` > 0),
  `Matric_Coord_Area` varchar(20) DEFAULT NULL,
  `Depto` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `professor`
--

INSERT INTO `professor` (`Nome`, `SNome`, `Matricula`, `DataNasc`, `Sexo`, `Salario`, `Matric_Coord_Area`, `Depto`) VALUES
('Pedro', 'Pereira da Silva', '121003', '1982-03-25', 'M', '4000.00', NULL, '121'),
('José Maria', 'Campos', '121031', '1978-04-01', 'M', '7000.00', '121003', '121'),
('Bento', 'Diniz Costa', '122045', '1980-11-27', 'M', '4000.00', NULL, '122'),
('Ana Clara', 'Araujo Santos', '122047', '1994-12-30', 'F', '7200.00', '122045', '122'),
('Maria Luiza', 'Machado', '125331', '1974-08-16', 'F', '6800.00', '125332', '125'),
('Joana Maria', 'Pereira', '125332', '1990-06-12', 'F', '4500.00', NULL, '125'),
('João Carlos', 'Matos Cavalcante', '125335', '1976-07-22', 'M', '3700.00', '125332', '125');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `Nome` varchar(50) NOT NULL,
  `Codigo` varchar(10) NOT NULL,
  `Depto` varchar(3) DEFAULT NULL,
  `Duracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`Nome`, `Codigo`, `Depto`, `Duracao`) VALUES
('Projeto Telemática 1', '11', '121', 10),
('Projeto Telemática 2', '12', '121', 5),
('Projeto Telemática 3', '21', '121', 3),
('Projeto Construção de Edifícios 1', '22', '122', 15),
('Projeto Construção de Edifícios 2', '23', '122', 12),
('Projeto Computação 1', '30', '125', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `MatricProf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`MatricProf`, `telefone`) VALUES
('121003', '988243761'),
('121031', '912345678'),
('122045', '923456789'),
('122047', '919876543'),
('125331', '915467893'),
('125332', '995678432'),
('125335', '999786545');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

CREATE TABLE `trabalha_em` (
  `MatricProf` varchar(20) NOT NULL,
  `CodProj` varchar(5) NOT NULL,
  `Horas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `trabalha_em`
--

INSERT INTO `trabalha_em` (`MatricProf`, `CodProj`, `Horas`) VALUES
('121003', '12', '15:00:00'),
('121031', '11', '10:00:00'),
('122045', '21', '11:00:00'),
('122045', '22', '20:00:00'),
('122047', '23', '14:00:00'),
('125335', '30', '03:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Coordenador` (`Coordenador`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`Matricula_Professor`,`RG`);

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`MatricProf`,`Email`);

--
-- Índices para tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`MatricProf`,`telefone`);

--
-- Índices para tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`MatricProf`,`CodProj`),
  ADD KEY `CodProj` (`CodProj`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`Coordenador`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`Matricula_Professor`) REFERENCES `professor` (`Matricula`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `projeto`
--
ALTER TABLE `projeto`
  ADD CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `departamento` (`Codigo`);

--
-- Limitadores para a tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `professor` (`Matricula`),
  ADD CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`CodProj`) REFERENCES `projeto` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
