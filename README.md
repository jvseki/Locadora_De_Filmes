# Locadora_De_Filmes
Nome: João Victor Seki, Nicolas Emanuel, Cauã Bolani
# 🎬 Locadora de Filmes / Streaming (CRUD SQL)

Este projeto apresenta um **banco de dados completo** de uma **locadora de filmes / serviço de streaming**, desenvolvido em **MySQL**, implementando todas as operações do modelo **CRUD** (*Create, Read, Update e Delete*).

---

## 🧠 Objetivo

O objetivo deste projeto é demonstrar a criação e manipulação de um banco de dados relacional, aplicando conceitos de:
- Modelagem de dados (entidades e relacionamentos)
- Criação de tabelas com chaves primárias e estrangeiras
- Comandos SQL básicos (CRUD)
- Consultas com `JOIN`, `GROUP BY` e `ORDER BY`

---

## 🗺️ Diagrama do Banco de Dados

O diagrama abaixo representa o modelo relacional utilizado neste projeto.  
Ele mostra as três tabelas principais (`usuarios`, `filmes` e `assistidos`) e seus relacionamentos por chaves estrangeiras:

![Diagrama do Banco de Dados]
<img width="837" height="338" alt="image" src="https://github.com/user-attachments/assets/afb926ba-38af-41d2-ad89-de4fcfc3617a" />


### 🔗 Relacionamentos:
- **usuarios** ↔ **assistidos** → relação 1:N  
  (um usuário pode assistir vários filmes)
- **filmes** ↔ **assistidos** → relação 1:N  
  (um filme pode ser assistido por vários usuários)
- A tabela **assistidos** funciona como uma **tabela intermediária (N:N)** entre `usuarios` e `filmes`.

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
Inserção de usuários, filmes e registros de filmes assistidos.

```sql
INSERT INTO usuarios (nome, email, plano) VALUES
('João Victor', 'joao@gmail.com', 'Premium'),
('Nicolas', 'nicolas@gmail.com', 'Padrão'),
('Cauã', 'caua@.gmailcom', 'Básico');
