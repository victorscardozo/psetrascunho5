

------------APAGAR CONTEÚDOS--------------



-- Apagar banco de dados uvv (se existente)
DROP DATABASE IF EXISTS uvv;



-- Apagar o esquema lojas (se existente)
DROP SCHEMA IF EXISTS lojas;



-- Apagar usuário victor (se existente)
DROP USER IF EXISTS victor;




---------------CRIAR CONTEÚDOS--------------------



-- Criar usuário com senha
CREATE ROLE victor WITH LOGIN PASSWORD 'computacao@raiz';




-- Criar o banco de dados
CREATE DATABASE uvv
       OWNER victor
       TEMPLATE template0
       ENCODING 'UTF8'
       LC_COLLATE 'pt_BR.UTF-8'
       LC_CTYPE 'pt_BR.UTF-8'
       ALLOW_CONNECTIONS true;

      
      
	  
--Conectar-se ao banco de dados uvv, com o usuário victor, utilizando a senha "computacao@raiz"
\c 'dbname=uvv user=victor password=computacao@raiz';      
      


-- Criar esquema
CREATE SCHEMA lojas AUTHORIZATION victor;


------------------------------------------------------











----------------------TABELAS----------------------------



--Criar tabela produtos
CREATE TABLE produtos (
                        produto_id                NUMERIC(38)    NOT NULL,
                        nome                      VARCHAR(255)   NOT NULL,
                        preco_unitario            NUMERIC(10,2),
                        detalhes BYTEA,
                        imagem BYTEA,
                        imagem_mime_type          VARCHAR(512),
                        imagem_arquivo            VARCHAR(512),
                        imagem_charset            VARCHAR(512),
                        imagem_ultima_atualizacao DATE,
                
                
                        CONSTRAINT produto_id     PRIMARY KEY (produto_id)    );
                
               
              
/* Adicionar a constraint "preco_unitario" na coluna preco_unitario da tabela produtos. (Checar se o preço unitário do produto é maior que 0). */
ALTER TABLE    produtos
ADD CONSTRAINT preco_unitario
CHECK          (preco_unitario>0);




																			--Comentários referentes à tabela produtos            
                                                                           COMMENT ON COLUMN produtos.produto_id                IS 'Número de identificação único do produto.';
                                                                           COMMENT ON COLUMN produtos.nome                      IS 'Nome do produto.';
                                                                           COMMENT ON COLUMN produtos.preco_unitario            IS 'Preço unitário do produto.';
                                                                           COMMENT ON COLUMN produtos.detalhes                  IS 'Detalhes sobre o produto.';
                                                                           COMMENT ON COLUMN produtos.imagem                    IS 'Imagem do produto.';
                                                                           COMMENT ON COLUMN produtos.imagem_mime_type          IS 'Tipo do mime da imagem do produto.';
                                                                           COMMENT ON COLUMN produtos.imagem_arquivo            IS 'Arquivo da imagem do produto.';
                                                                           COMMENT ON COLUMN produtos.imagem_charset            IS 'Charset da imagem do produto.';
                                                                           COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Data da última atualização da imagem do produto.';





----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Criar tabela lojas
CREATE TABLE lojas (
                     loja_id                 NUMERIC(38)   NOT NULL,
                     nome                    VARCHAR(255)  NOT NULL,
                     endereco_web            VARCHAR(100),
                     endereco_fisico         VARCHAR(512),
                     latitude                NUMERIC,
                     longitude               NUMERIC,
                     logo BYTEA,
                     logo_mime_type          VARCHAR(512),
                     logo_arquivo            VARCHAR(512),
                     logo_charset            VARCHAR(512),
                     logo_ultima_atualizacao DATE,
                
                
                     CONSTRAINT loja_id PRIMARY KEY (loja_id)    );

               
               
/* Adicionar a constraint "enderecos_lojas" nas colunas endereco_web e endereco_fisico da tabela loja. (Checa se pelo menos uma das colunas não está nula). */
ALTER TABLE lojas
ADD CONSTRAINT enderecos_lojas
CHECK ((endereco_web IS NOT NULL AND endereco_fisico IS NULL) OR (endereco_web IS NULL AND endereco_fisico IS NOT NULL));

               
               
                                                                           --Comentários referentes à tabela lojas               
                                                                           COMMENT ON COLUMN lojas.loja_id IS 'Número de identificação único da unidade de loja.';
                                                                           COMMENT ON COLUMN lojas.nome IS 'Refere-se ao nome da unidade de loja.';
                                                                           COMMENT ON COLUMN lojas.endereco_web IS 'Refere-se ao endereço web (site) da loja.';
                                                                           COMMENT ON COLUMN lojas.endereco_fisico IS 'Refere-se ao endereço físico da loja.';
                                                                           COMMENT ON COLUMN lojas.latitude IS 'Refere-se à latitude da loja';
                                                                           COMMENT ON COLUMN lojas.longitude IS 'Refere-se à longitude da loja.';
                                                                           COMMENT ON COLUMN lojas.logo IS 'Refere-se à logomarca da loja.';
                                                                           COMMENT ON COLUMN lojas.logo_mime_type IS 'Refere-se ao tipo de logo mime da loja.';
                                                                           COMMENT ON COLUMN lojas.logo_arquivo IS 'Arquivo da logomarca.';
                                                                           COMMENT ON COLUMN lojas.logo_charset IS 'Logomarca charset.';
                                                                           COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Refere-se à data da última atualização da logomarca.';

                                                                          
                                                                          
                                                                          
                                                                          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                          
                                                                          
                                                                          

--Criar tabela estoques
CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)     );

               
                                                                           --Comentários referentes à tabela estoques              
                                                                           COMMENT ON COLUMN estoques.estoque_id IS 'Número de identificação único do estoque.';
                                                                           COMMENT ON COLUMN estoques.loja_id IS 'Número de identificação único da loja.';
                                                                           COMMENT ON COLUMN estoques.produto_id IS 'Número de identificação único do produto.';
                                                                           COMMENT ON COLUMN estoques.quantidade IS 'Quantidade de itens no estoque.';

                                                                          
                                                                          
                                                                          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                          
                                                                          
                                                                          
                                                                          

--Criar tabela clientes
CREATE TABLE clientes (
                client_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT client_id PRIMARY KEY (client_id)   );

               
                                                                           --Comentários referentes à tabela clientes
                                                                           COMMENT ON COLUMN clientes.client_id IS 'Número de identificação  único do cliente.';
                                                                           COMMENT ON COLUMN clientes.email IS 'Endereço de e-mail do cliente.';
                                                                           COMMENT ON COLUMN clientes.nome IS 'Nome do cliente.';
                                                                           COMMENT ON COLUMN clientes.telefone1 IS 'Principal telefone do cliente.';
                                                                           COMMENT ON COLUMN clientes.telefone2 IS 'Segunda opção de telefone do cliente.';
                                                                           COMMENT ON COLUMN clientes.telefone3 IS 'Terceira opção de telefone do cliente.';


                                                                          
                                                                          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                          
                                                                          
                                                                          
                                                                          
--Criar tabela pedidos
CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                client_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)    );

               
               
/* Adicionar a constraint "status_pedidos" na coluna status da tabela pedidos. (Checar se o status do pedido é "pendente", "em andamento", ou "concluído"). */
ALTER TABLE pedidos
ADD CONSTRAINT status_pedidos
CHECK (status IN ('Pendente', 'Em andamento', 'Concluído'));
 
               
                                                                           --Comentários referentes à tabela pedidos
                                                                           COMMENT ON COLUMN pedidos.pedido_id IS 'Número de identificação único do pedido.';
                                                                           COMMENT ON COLUMN pedidos.data_hora IS 'Data e horário nos quais o pedido foi realizado.';
                                                                           COMMENT ON COLUMN pedidos.client_id IS 'Número de identificação único do cliente.';
                                                                           COMMENT ON COLUMN pedidos.status IS 'Status de andamento do pedido.';
                                                                           COMMENT ON COLUMN pedidos.loja_id IS 'Número de identificação único da loja.';

                                                                          
                                                                          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                          
                                                                          
                                                                          
                                                                          
                                                                          
                                                                          

--Criar tabela envios
CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                client_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)     );

               
/* Adicionar a constraint status_envios na coluna status da tabela envios. (Checa se o status do envio é "aguardando envio", "à caminho" ou "entregue"). */
ALTER TABLE envios
ADD CONSTRAINT status_envios
CHECK (status IN ('Aguardando envio', 'À caminho', 'Entregue'));
               
               
                                                                           --Comentários referentes à tabela envios
                                                                           COMMENT ON COLUMN envios.envio_id IS 'Número de identificação único do envio.';
                                                                           COMMENT ON COLUMN envios.loja_id IS 'Número de identificação único da loja.';
                                                                           COMMENT ON COLUMN envios.client_id IS 'Número de identificação único do cliente.';
                                                                           COMMENT ON COLUMN envios.endereco_entrega IS 'Endereço do cliente destinatário da entrega.';
                                                                           COMMENT ON COLUMN envios.status IS 'Status de andamento do envio.';

                                                                          
                                                                          
                                                                          
                                                                          
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                                          
                                                                          
                                                                          
                                                                          
                                                                          
--Criar tabela pedidos_itens
CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_item_id PRIMARY KEY (pedido_id, produto_id)    );

               
                                                                           --Comentários referentes à tabela pedidos_itens
                                                                           COMMENT ON COLUMN pedidos_itens.pedido_id IS 'Número de identificação único do pedido.';
                                                                           COMMENT ON COLUMN pedidos_itens.produto_id IS 'Número de identificação único do produto.';
                                                                           COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Numero da linha do item.';
                                                                           COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Preço unitário do item no pedido.';
                                                                           COMMENT ON COLUMN pedidos_itens.quantidade IS 'Quantidade de itens no pedido.';
                                                                           COMMENT ON COLUMN pedidos_itens.envio_id IS 'Número de identificação unico do envio.';





----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



ALTER TABLE         pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY         (produto_id)
REFERENCES          produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY         (produto_id)
REFERENCES          produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY         (loja_id)
REFERENCES          lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY         (loja_id)
REFERENCES          lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY         (loja_id)
REFERENCES          lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY         (client_id)
REFERENCES          clientes (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY         (client_id)
REFERENCES          clientes (client_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY         (pedido_id)
REFERENCES          pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE         pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY         (envio_id)
REFERENCES          envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
