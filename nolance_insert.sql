INSERT INTO tbl_categoria (nome, icone) values
('Automóveis', 'automoveis.png'),
('Eletrodomésticos', 'eletrodomesticos.png'),
('Antiguidades', 'antiguidades.png');

INSERT INTO tbl_subcategoria(nome, categoria_id) values 
('Carros', 1),
('Motos', 1),
('Ônibus', 1);

INSERT INTO tbl_comitente(nome, telefone, email) values 
('Postman da Silva', '967549234', 'postman@email.com'),
('Acme Filmes', '967549234', 'acme@email.com');

INSERT INTO tbl_pessoa_fisica(cpf, rg, comitente_id) values
('99877655432', '54456789', 1);

INSERT INTO tbl_pessoa_juridica(cnpj, razao_social, descricao, comitente_id) values
('9987765543222', 'Acme Filmes S.A.','Acme filmes.......' , 2);
                 