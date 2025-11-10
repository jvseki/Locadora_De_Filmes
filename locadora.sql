-- ==========================================
-- LOCADORA DE FILMES / STREAMING
-- Script completo e seguro
-- ==========================================

-- Desativa modo seguro temporariamente (para UPDATE/DELETE sem chave primária)
SET SQL_SAFE_UPDATES = 0;

-- ==========================================
-- BANCO DE DADOS
-- ==========================================

DROP DATABASE IF EXISTS locadora_filmes;
CREATE DATABASE IF NOT EXISTS locadora_filmes;
USE locadora_filmes;

-- ==========================================
-- TABELAS
-- ==========================================

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    plano ENUM('Básico', 'Padrão', 'Premium') DEFAULT 'Básico'
);

CREATE TABLE IF NOT EXISTS filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50),
    ano INT,
    classificacao ENUM('L', '10', '12', '14', '16', '18') DEFAULT 'L'
);

CREATE TABLE IF NOT EXISTS assistidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    filme_id INT,
    data_assistido DATE DEFAULT (CURRENT_DATE),
    avaliacao INT CHECK (avaliacao BETWEEN 0 AND 10),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (filme_id) REFERENCES filmes(id) ON DELETE CASCADE
);

-- ==========================================
-- CREATE (Inserir dados)
-- ==========================================

INSERT INTO usuarios (nome, email, plano) VALUES
('João Victor', 'joao@example.com', 'Premium'),
('Gabriella', 'gabi@example.com', 'Padrão'),
('Cauã', 'caua@example.com', 'Básico')
ON DUPLICATE KEY UPDATE nome = VALUES(nome);

INSERT INTO filmes (titulo, genero, ano, classificacao) VALUES
('Interestelar', 'Ficção Científica', 2014, '12'),
('Vingadores: Ultimato', 'Ação', 2019, '12'),
('A Origem', 'Suspense', 2010, '14'),
('Toy Story', 'Animação', 1995, 'L')
ON DUPLICATE KEY UPDATE titulo = VALUES(titulo);

INSERT INTO assistidos (usuario_id, filme_id, avaliacao) VALUES
(1, 1, 10),
(1, 3, 9),
(2, 2, 8),
(3, 4, 7);

-- ==========================================
-- READ (Consultar dados)
-- ==========================================

-- Todos os usuários
SELECT * FROM usuarios;

-- Todos os filmes
SELECT * FROM filmes;

-- Filmes assistidos com nome do usuário
SELECT a.id, u.nome AS usuario, f.titulo AS filme, a.avaliacao, a.data_assistido
FROM assistidos a
JOIN usuarios u ON a.usuario_id = u.id
JOIN filmes f ON a.filme_id = f.id;

-- Top 3 filmes mais bem avaliados
SELECT f.titulo, AVG(a.avaliacao) AS media_avaliacao
FROM assistidos a
JOIN filmes f ON a.filme_id = f.id
GROUP BY f.titulo
ORDER BY media_avaliacao DESC
LIMIT 3;

-- ==========================================
-- UPDATE (Atualizar dados)
-- ==========================================

-- Atualizar plano de um usuário pelo nome
UPDATE usuarios
SET plano = 'Premium'
WHERE nome = 'Cauã';

-- Corrigir título de um filme
UPDATE filmes
SET titulo = 'Toy Story (1995)'
WHERE titulo = 'Toy Story';

-- Atualizar avaliação de um filme assistido
UPDATE assistidos
SET avaliacao = 10
WHERE id = 4;

-- ==========================================
-- DELETE (Excluir dados)
-- ==========================================

-- Deletar um registro de filme assistido
DELETE FROM assistidos WHERE id = 2;

-- Deletar um filme
DELETE FROM filmes WHERE id = 3;

-- Deletar um usuário (e automaticamente os assistidos dele)
DELETE FROM usuarios WHERE nome = 'Cauã';

-- ==========================================
-- CONSULTA FINAL
-- ==========================================

SELECT a.id, u.nome AS usuario, f.titulo AS filme, a.avaliacao, a.data_assistido
FROM assistidos a
JOIN usuarios u ON a.usuario_id = u.id
JOIN filmes f ON a.filme_id = f.id;

-- ==========================================
-- Reativa modo seguro se quiser
-- ==========================================
SET SQL_SAFE_UPDATES = 1;
