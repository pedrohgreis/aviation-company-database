---
nome: FlyBase
integrante1: Gabriel Martins - 202221901019
integrante2: Marcos Medina - 202221901032
integrante3: Maria Vittória - 202221901035
integrante4: Pedro Henrique Gomes - 202221901040
--- 

# PROBLEMA

O objetivo é criar um banco de dados para a FlyBase, uma empresa de aviação criada pelo nosso grupo.

Sabemos que, em uma empresa de aviação, sempre há muitas pessoas na base de dados. Nosso grande objetivo é organizar um banco de dados seguindo todas as formas normais, garantindo que ele seja consistente e completo.

 Contexto do Projeto
O projeto flyBase consiste no desenvolvimento de um banco de dados para uma companhia aérea. Seu objetivo prático é centralizar e gerenciar as informações essenciais da operação: voos, reservas, frota de aeronaves, clientes e funcionários. A estrutura do banco de dados foi projetada para garantir a integridade e a consistência dos dados, servindo como a base para um sistema de gestão completo.

# Requisitos Funcionais
O banco de dados deve suportar as seguintes operações:

Gestão de Operações:

Cadastrar e gerenciar a frota de aeronaves, as cidades de destino e os cargos dos funcionários.

Agendar voos definindo rota, avião e tripulação associada.

Monitorar e atualizar o status de cada voo em tempo real (ex: Agendado, Em Voo, Concluído).

Gestão de Pessoas e Reservas:

Manter um cadastro unificado de pessoas, diferenciando Clientes (com plano de fidelidade, passaporte) e Funcionários (com cargo, data de admissão).

Permitir que clientes realizem reservas de assentos únicos em voos específicos.

# Restrições que devem ser tratadas pelo banco de dados.
1. Integridade de Entidade (Chave Primária - PRIMARY KEY) garante que cada registro (linha) em uma tabela seja único e identificável, não podendo ser nulo.
A coluna pessoa(id) garante que não existam duas pessoas com o mesmo número de identificação. Na tabela Reserva, a chave composta (idVoo, id_cliente) garante que um mesmo cliente não possa ter duas reservas idênticas no mesmo voo.

Importância: É a base do modelo relacional. Impede a duplicidade de registros e é essencial para criar relacionamentos entre as tabelas.

2. Integridade Referencial (Chave Estrangeira - FOREIGN KEY) cria um vínculo entre duas tabelas, garantindo que um valor em uma coluna só possa existir se ele já existir na tabela referenciada.
 A coluna Voo(id_Aviao) deve obrigatoriamente conter um ID que exista na tabela Aviao. Isso impede que um voo seja agendado para uma aeronave que não faz parte da frota.

Importância: Evita "dados órfãos" e mantém a consistência lógica do banco. Impede, por exemplo, que uma Cidade seja apagada se ainda existirem voos agendados para ela.

3. Unicidade (Constraint UNIQUE) assegura que todos os valores em uma coluna (ou conjunto de colunas) sejam únicos, mesmo que não seja a chave primária.

A coluna cliente(email) possui uma restrição UNIQUE. O banco de dados rejeitará a criação de um novo cliente com um email que já está em uso, garantindo que cada conta seja exclusiva.

Importância: Aplica regras de negócio críticas que não são cobertas pela chave primária, como login único, número de passaporte único, etc.

4. Integridade de Domínio (Tipos de Dados, ENUM, CHECK) restringe o tipo, formato ou o conjunto de valores que uma coluna pode aceitar.

A coluna cargo(salario) é do tipo DECIMAL(10,2), forçando que o valor seja numérico e com duas casas decimais, impedindo a inserção de textos como "dez mil".

A coluna cliente(plano) é um ENUM('BASICO', 'PREMIUM', 'VIP'), o que restringe os valores a apenas essas três opções, evitando planos inválidos como "OURO".

Importância: Previne a entrada de dados corrompidos ou sem sentido, garantindo a qualidade e a previsibilidade das informações armazenadas.

5. Restrição de Não Nulidade (NOT NULL) obriga que uma coluna sempre tenha um valor; ela não pode ser deixada em branco (nula).

A coluna pessoa(primeiro_nome) é NOT NULL, pois toda pessoa deve ter um nome. As colunas Voo(id_cidade_origem) e Voo(id_cidade_destino) também são, pois não existe voo sem origem ou destino.

Importância: Garante que os dados essenciais para o funcionamento do sistema estejam sempre presentes, evitando registros incompletos e inutilizáveis.

# Como Executar o Projeto

# Passo 1: Construir e Iniciar o Ambiente
Na pasta principal do projeto, execute o seguinte comando no terminal (Git Bash recomendado). Este script irá construir a imagem Docker, iniciar o contêiner e criar toda a estrutura do banco de dados (tabelas, views e triggers).

Bash

./run.sh

# Passo 2: Acessar o Banco de Dados
Após a execução do script, o contêiner do banco de dados estará rodando. Para acessá-lo:
Abra um novo terminal e entre no shell do contêiner:

docker exec -it meubanco2 bash

Dentro do contêiner, conecte-se ao MySQL, já entrando no banco de dados flyBase:

mysql -u root -padmin flyBase

# Passo 3: Popular o Banco com Dados
Uma vez dentro do cliente MySQL, execute o comando abaixo para popular as tabelas.


SOURCE /scripts/insercao_de_dados.sql;


# Passo 4: Testar os Triggers (Demonstrações)
Os scripts a seguir executam demonstrações específicas para testar os triggers implementados, mostrando o estado do banco de dados "antes" e "depois" da ativação de cada um.

Teste do Trigger de Histórico de Voos:
SOURCE /scripts/triggers/tg_LogDeStatusDoVooDEMO.sql;


Teste do Trigger de Capacidade de Voo:
SOURCE /scripts/triggers/tr_checa_capacidade_de_voo_DEMO.sql;