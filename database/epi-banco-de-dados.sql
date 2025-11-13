-- Tabela para armazenar informações dos usuários
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,           -- Nome do funcionário
    position VARCHAR(255) NOT NULL,       -- Cargo
    department VARCHAR(255) NOT NULL,     -- Setor
    assigned_epi VARCHAR(255),            -- EPIs atribuídos (pode armazenar nomes ou IDs)
    training_date DATE                    -- Data do treinamento
);

-- Tabela para armazenar o registro dos Equipamentos de Proteção Individual (EPIs)
CREATE TABLE epi (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255),
    batch VARCHAR(255),
    expiryDate DATE NOT NULL,
    totalQuantity INT NOT NULL,
    inUseQuantity INT NOT NULL,
    supplier VARCHAR(255),
    leadTimeDays INT,
    safetyStockLevel INT,
    historicalUsageData TEXT
);

-- Tabela para registrar o histórico de uso dos EPIs (entradas e saídas)
CREATE TABLE usage_history (
    id VARCHAR(255) PRIMARY KEY,
    epiId VARCHAR(255) NOT NULL,
    userId VARCHAR(255) NOT NULL,
    action ENUM('checkout', 'checkin') NOT NULL,
    quantity INT NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (epiId) REFERENCES epi(id),
    FOREIGN KEY (userId) REFERENCES users(id)
);

-- Inserindo alguns dados de exemplo na tabela 'users'
INSERT INTO users (id, name, email, role, avatar) VALUES
('1', 'Admin User', 'admin@example.com', 'admin', 'https://i.pravatar.cc/150?u=admin@example.com'),
('2', 'Collab User', 'collab@example.com', 'collaborator', 'https://i.pravatar.cc/150?u=collab@example.com');

-- Inserindo alguns dados de exemplo na tabela 'epi'
-- As datas de expiração são calculadas dinamicamente para referência
INSERT INTO epi (id, name, code, batch, expiryDate, totalQuantity, inUseQuantity, supplier, leadTimeDays, safetyStockLevel, historicalUsageData) VALUES
('EPI001', 'Capacete de Segurança', 'CS-001', 'LOTE-2023-A', DATE_ADD(CURDATE(), INTERVAL 25 DAY), 50, 10, 'Fornecedor A', 14, 5, 'Uso mensal médio de 20 unidades, com picos de 30 unidades em períodos de alta demanda.'),
('EPI002', 'Luvas de Proteção', 'LP-002', 'LOTE-2023-B', DATE_ADD(CURDATE(), INTERVAL 6 MONTH), 200, 50, 'Fornecedor B', 7, 20, 'Uso constante de aproximadamente 10 pares por semana.'),
('EPI003', 'Óculos de Segurança', 'OS-003', 'LOTE-2022-C', DATE_SUB(CURDATE(), INTERVAL 10 DAY), 30, 5, 'Fornecedor A', 10, 10, 'Baixo uso, cerca de 5 unidades por mês.'),
('EPI004', 'Protetor Auricular', 'PA-004', 'LOTE-2024-A', DATE_ADD(CURDATE(), INTERVAL 1 YEAR), 150, 25, 'Fornecedor C', 20, 15, 'Demanda sazonal, com maior uso nos meses de verão. Média de 30 por mês.'),
('EPI005', 'Botas de Segurança', 'BS-005', 'LOTE-2023-D', DATE_ADD(CURDATE(), INTERVAL 8 MONTH), 40, 35, 'Fornecedor B', 30, 5, 'Troca a cada 6 meses por equipe de 35 pessoas.');