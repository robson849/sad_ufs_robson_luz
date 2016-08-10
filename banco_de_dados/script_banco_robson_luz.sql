CREATE TABLE Usuário (
  id_usuario SERIAL  NOT NULL ,
  login VARCHAR   NOT NULL ,
  senha VARCHAR   NOT NULL   ,
PRIMARY KEY(id_usuario));




CREATE TABLE Categoria (
  id_categoria SERIAL  NOT NULL ,
  nome VARCHAR      ,
PRIMARY KEY(id_categoria));




CREATE TABLE Produto (
  id_produto SERIAL  NOT NULL ,
  id_categoria INTEGER   NOT NULL ,
  nome VARCHAR    ,
  valor DOUBLE    ,
  descricao VARCHAR      ,
PRIMARY KEY(id_produto)  ,
  FOREIGN KEY(id_categoria)
    REFERENCES Categoria(id_categoria));


CREATE INDEX Produto_FKIndex1 ON Produto (id_categoria);


CREATE INDEX IFK_Rel_19 ON Produto (id_categoria);


CREATE TABLE Cliente (
  id_cliente SERIAL  NOT NULL ,
  id_usuario INTEGER   NOT NULL ,
  nome VARCHAR    ,
  cpf VARCHAR    ,
  telefone VARCHAR    ,
  email VARCHAR    ,
  data_nascimento DATE      ,
PRIMARY KEY(id_cliente)  ,
  FOREIGN KEY(id_usuario)
    REFERENCES Usuário(id_usuario));


CREATE INDEX Cliente_FKIndex2 ON Cliente (id_usuario);


CREATE INDEX IFK_Rel_09 ON Cliente (id_usuario);


CREATE TABLE Endereço (
  id_endereco SERIAL  NOT NULL ,
  id_cliente INTEGER   NOT NULL ,
  logradouro VARCHAR    ,
  cep VARCHAR    ,
  estado VARCHAR(2)    ,
  cidade VARCHAR      ,
PRIMARY KEY(id_endereco)  ,
  FOREIGN KEY(id_cliente)
    REFERENCES Cliente(id_cliente));


CREATE INDEX Endereço_FKIndex1 ON Endereço (id_cliente);


CREATE INDEX IFK_Rel_21 ON Endereço (id_cliente);


CREATE TABLE Pedido (
  id_pedido SERIAL  NOT NULL ,
  id_cliente INTEGER   NOT NULL ,
  data_pedido DATE      ,
PRIMARY KEY(id_pedido)  ,
  FOREIGN KEY(id_cliente)
    REFERENCES Cliente(id_cliente));


CREATE INDEX Pedido_FKIndex1 ON Pedido (id_cliente);


CREATE INDEX IFK_Rel_20 ON Pedido (id_cliente);


CREATE TABLE ContaBancaria (
  id_conta_bancaria SERIAL  NOT NULL ,
  id_cliente INTEGER   NOT NULL ,
  nome_portador VARCHAR    ,
  banco VARCHAR    ,
  num_cartao INTEGER    ,
  agencia VARCHAR    ,
  num_conta VARCHAR    ,
  vencimento VARCHAR      ,
PRIMARY KEY(id_conta_bancaria)  ,
  FOREIGN KEY(id_cliente)
    REFERENCES Cliente(id_cliente));


CREATE INDEX ContaBancaria_FKIndex1 ON ContaBancaria (id_cliente);


CREATE INDEX IFK_Rel_22 ON ContaBancaria (id_cliente);


CREATE TABLE pedido_produto (
  id_pedido INTEGER   NOT NULL ,
  id_produto INTEGER   NOT NULL   ,
PRIMARY KEY(id_pedido, id_produto)    ,
  FOREIGN KEY(id_pedido)
    REFERENCES Pedido(id_pedido),
  FOREIGN KEY(id_produto)
    REFERENCES Produto(id_produto));


CREATE INDEX Pedido_has_Produto_FKIndex1 ON pedido_produto (id_pedido);
CREATE INDEX Pedido_has_Produto_FKIndex2 ON pedido_produto (id_produto);


CREATE INDEX IFK_Rel_15 ON pedido_produto (id_pedido);
CREATE INDEX IFK_Rel_16 ON pedido_produto (id_produto);



