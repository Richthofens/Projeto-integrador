CREATE DATABASE controle_epi;


-- Tabela para armazenar informações dos usuários
CREATE TABLE epi (
    id int AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    codigo VARCHAR(30),
    lote VARCHAR(15),
    dataValidade DATE NOT NULL,
    quantidadeTotal INT NOT NULL,
    fornecedor VARCHAR(30)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,           -- Nome do funcionário
    cargo VARCHAR(40) NOT NULL,       -- Cargo
    setor VARCHAR(40) NOT NULL,     -- Setor
    epi_atribuido VARCHAR(30),            -- EPIs atribuídos (pode armazenar nomes ou IDs)
    data_treinamento DATE                    -- Data do treinamento
);