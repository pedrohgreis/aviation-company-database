---
nome: FlyBase
integrante1: Gabriel Martins
integrante2: Marcos Medina
integrante3: Maria Vittória
integrante4: Pedro Henrique Gomes
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