# Design e desenvolvimento de bancos de dados     

## Pset -1

### Aluno: Victor Silva Cardozo

### Turma: CC1MB

### Professor: Abrantes Araújo Silva Filho

### Monitor: Suellen Miranda Amorim

- # Resumo

Implementamos um banco de dados para uma rede de lojas da uvv. O banco de dados conta com tabelas como: produtos, lojas, estoques, clientes, pedidos, envios, e outras. A inserção de dados no banco de dados ainda não foi realizada, porém, serão fornecidos dados para preencher as tabelas.

 

 - # Projeto Lógico

Construção do projeto lógico do Banco de Dados das Lojas por meio do aplicativo SQL Power Architect.
![](https://github.com/victorscardozo/uvv_bd1_cc1mb/blob/main/pset/Captura%20de%20tela%202023-05-28%20174432.png?raw=true])

 - # Conversão para código 
 Foi feita pelo aplicativo SQL Power Architect a transformação dessas tabelas para um >> [código SQL](https://github.com/victorscardozo/uvv_bd1_cc1mb/blob/main/pset/cc1mb_202305893_postgresql.sql) << que pode ser implementado no POSTGRESQL.
- # Comandos
Foram adicionados alguns comandos para criação de usuário, banco de dados e schema. Alguns comandos também para ajustar o search path, e trocar a conexão atual (postgres) para o usuário victor utilizando uma senha. 

 ![](https://github.com/victorscardozo/uvv_bd1_cc1mb/blob/main/pset/Captura%20de%20tela%202023-05-28%20224241.png?raw=true])
 - # Abrir o arquivo 
 ![](https://github.com/victorscardozo/uvv_bd1_cc1mb/blob/main/pset/Captura%20de%20tela%202023-05-28%20193135.png?raw=true])
 O comando acima utilizado no terminal do linux, abre o arquivo do código extraído do SQL Power Architect, utilizando o usuário postgres (arquivo nomeado como cc1mb_202305893_postgresql.sql).

### *Depois disso o código foi testado pelo terminal, e rodou corretamente.