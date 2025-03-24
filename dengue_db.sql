-- Criação do banco de dados
CREATE DATABASE dengue_map;

-- Conectar ao banco criado (em ambiente local)
-- (Se estiver usando um terminal psql: \c dengue_map)

-- Criação da tabela de usuários
-- CREATE TABLE usuario (
--    id SERIAL PRIMARY KEY,
--    nome VARCHAR(100) NOT NULL,
--    email VARCHAR(100) UNIQUE NOT NULL,
--    senha VARCHAR(255) NOT NULL,
--    tipo_usuario VARCHAR(20) CHECK (tipo_usuario IN ('municipe', 'gestor')) NOT NULL
--);

-- Criação da tabela de relatos de casos de dengue
CREATE TABLE relato_caso (
    id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuario(id),
    data_relato DATE NOT NULL,
    endereco TEXT NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pendente', 'confirmado')) DEFAULT 'pendente'
);

-- (Opcional) Criação de tabela para log de ações administrativas
--CREATE TABLE admin_log (
--    id SERIAL PRIMARY KEY,
--    usuario_id INT REFERENCES usuario(id),
--    acao_realizada TEXT NOT NULL,
--    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
--);
