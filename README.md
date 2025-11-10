# Locadora_De_Filmes
Nome: João Victor Seki, Nicolas Emanuel, Cauã Bolani

# 🎬 Locadora de Filmes / Streaming (CRUD SQL)

Este projeto apresenta um **banco de dados completo** de uma **locadora de filmes / serviço de streaming**, implementado em **MySQL**, com todas as operações básicas de **CRUD** — *Create, Read, Update e Delete*.

---

## 🧠 Objetivo

O objetivo do projeto é demonstrar o uso de comandos SQL fundamentais em um exemplo prático e organizado, abordando:

- Criação de banco de dados e tabelas  
- Inserção de registros (`CREATE`)  
- Consulta de dados (`READ`)  
- Atualização de informações (`UPDATE`)  
- Exclusão de registros (`DELETE`)  
- Relacionamentos entre tabelas com **chaves estrangeiras**

---

## 🧩 Estrutura do Banco de Dados

**Banco de dados:** `locadora_filmes`

### 🧱 Tabelas criadas:

#### 1. `usuarios`
Armazena informações dos clientes da plataforma.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | INT (PK, AI) | Identificador único |
| nome | VARCHAR(100) | Nome do usuário |
| email | VARCHAR(100) | E-mail (único) |
| plano | ENUM('Básico', 'Padrão', 'Premium') | Tipo de assinatura |

---

#### 2. `filmes`
Contém os filmes disponíveis na locadora.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | INT (PK, AI) | Identificador único |
| titulo | VARCHAR(150) | Nome do filme |
| genero | VARCHAR(50) | Gênero |
| ano | INT | Ano de lançamento |
| classificacao | ENUM('L','10','12','14','16','18') | Classificação indicativa |

---

#### 3. `assistidos`
Registra quais filmes foram assistidos por quais usuários.

| Coluna | Tipo | Descrição |
|--------|------|-----------|
| id | INT (PK, AI) | Identificador único |
| usuario_id | INT (FK) | Referência ao usuário |
| filme_id | INT (FK) | Referência ao filme |
| data_assistido | DATE | Data de visualização |
| avaliacao | INT | Avaliação (0 a 10) |

---

## ⚙️ Funcionalidades (CRUD)

### 🟢 **CREATE**
Inserção de usuários, filmes e histórico de filmes assistidos.

```sql
INSERT INTO usuarios (nome, email, plano) VALUES
('João Victor', 'joao@gmail.com', 'Premium'),
('Nicolas', 'nicolas@gmail.com', 'Padrão'),
('Cauã', 'caua@gmail.com', 'Básico');
