2# Modelagem DB

Modelagem de um banco de dados para instituição financeira.
O sistema deverá permitir o gerenciamento de clientes, solicitações de empréstimo, contratos financeiros, parcelas e pagamentos vinculados às operações de crédito realizadas pela instituição.

## Definições e Regras de Negócio

1. O sistema deve permitir o cadastro e gerenciamento de clientes.
2. Um cliente pode solicitar um ou mais empréstimos ao longo do tempo.
3. Cada solicitação de empréstimo deve possuir informações como valor solicitado, taxa de juros, prazo de pagamento, data da solicitação, data de liquidação, situação atual, observações e demais informações pertinentes. 
4. O sistema deverá permitir empréstimos associados a mais de um cliente simultaneamente, como em situações de coobrigação financeira ou solicitação conjunta de crédito, nas quais dois ou mais clientes compartilham responsabilidade sobre o mesmo empréstimo. 
5. Determinadas modalidades de empréstimo podem exigir a vinculação de fiadores como garantia adicional para aprovação da operação de crédito. 
6. Uma solicitação de empréstimo poderá possuir diferentes status, incluindo aprovado, rejeitado ou em análise.
7. ada empréstimo deve conter informações como número identificador, data de início, data de término, valor total financiado e valor total a ser pago.
8. Um empréstimo deverá gerar uma ou mais parcelas para pagamento.
9. Cada parcela deve possuir no mínimo número identificador, data de vencimento, valor da parcela, valor pago e situação de pagamento.
10. O sistema deverá permitir o registro de pagamentos realizados pelos clientes.
11. Cada pagamento deverá estar associado a uma única parcela.
12. O histórico de pagamentos deve permitir o acompanhamento da situação financeira do empréstimo como um todo.

## Entrega Final

|Item|Descrição|Artefato|OK|
|:--:|--|:--:|:--:|
|MER|Modelo Entidade-Relacionamento|Imagem|OK|
|DER|Diagrama Entidade-Relacionamento|Imagem|OK|
|DDL| Linguaguem de Definição de Dados|Texto|OK|
|Con.| Consultas SQL no Banco de Dados| Texto/Imagem|N|
|DB| Banco de Dados Final|MySQL|OK|

*30 registros em cada tabela de entidades (5 registros em tabelas de domínio/tipagem)*


## Consultas

##### Clientes com Empréstimos Ativos
Visão Geral de Clientes (nome, cpf, data de nascimento) que tem algum empréstimo em andamento.

##### Fila de Propostas em Análise
Liste o nome do cliente, o CPF, o valor solicitado e a data da solicitação para todas as propostas que estejam atualmente com o status Em Análise. Ordene o resultado da data mais antiga para a mais recente.

##### Relação de Empréstimos e Fiadores
Exiba todos os empréstimos cadastrados no sistema, mostrando o código do empréstimo (identificador
único), a descrição do tipo de empréstimo e o nome do fiador vinculado. Certifique-se de que os
empréstimos que não exigem ou não possuem fiador associado também apareçam no relatório.

##### Resumo Financeiro da Carteira Ativa
Deverá ser apresentado um resumo financeiro referente aos empréstimos em situação ativa no sistema.
O relatório deve consolidar indicadores estatísticos dos financiamentos vigentes, contemplando o valor
total, a média dos valores contratados, bem como os maiores e menores valores entre os contratos ativos

que ainda possuam saldo financeiro a receber. A análise deve considerar apenas contratos com
obrigações financeiras em aberto, de modo a refletir a exposição atual da carteira de crédito.

##### Quantitativo de Empréstimos por Status
Apresente o quantitativo de empréstimos distribuídos por seus respectivos status (Aprovado, Rejeitado,
Em Análise, etc.). O relatório deve exibir a descrição do status e a quantidade total de solicitações em
cada um deles.

##### Controle e Situação de Parcelas
Crie um relatório que exiba o nome do cliente, o número identificador do empréstimo, a data de início do
contrato, o número da parcela, a data de vencimento e a situação atual da parcela (ex: Aberta, Paga,
Cancelada, etc).

##### Acompanhamento de Adimplência
Crie um relatório para a equipe financeira acompanhar a adimplência. Liste o nome do cliente, o
identificador único do empréstimo, o número de parcelas e exiba a soma de todos os valores de
pagamentos já realizados para cada empréstimo, agrupando os dados de forma que cada linha
represente um único empréstimo.

##### Consulta Adicional
Crie uma consulta SQL adicional (com complexidade mínima de envolvimento de 3 tabelas), diferente das consultas obrigatórias acima.

#### To-do List Consultas
|Item|Descrição|OK|
|:--:|--|:--:|
|1|[Clientes com Empréstimos Ativos](https://github.com/BernardoLondero/BD#clientes-com-empr%C3%A9stimos-ativos)|OK|
|2|[Fila de Propostas em Análise](https://github.com/BernardoLondero/BD#fila-de-propostas-em-an%C3%A1lise)|OK|
|3|[Relação de Empréstimos e Fiadores](https://github.com/BernardoLondero/BD#rela%C3%A7%C3%A3o-de-empr%C3%A9stimos-e-fiadores)|N|
|4|[Resumo Financeiro da Carteira Ativa](https://github.com/BernardoLondero/BD#resumo-financeiro-da-carteira-ativa)|N|
|5|[Quantitativo de Empréstimos por Status](https://github.com/BernardoLondero/BD#quantitativo-de-empr%C3%A9stimos-por-status)|OK|
|6|[Controle e Situação de Parcelas](https://github.com/BernardoLondero/BD#controle-e-situa%C3%A7%C3%A3o-de-parcelas)|OK|
|7|[Acompanhamento de Adimplência](https://github.com/BernardoLondero/BD#acompanhamento-de-adimpl%C3%AAncia)|OK|
|8|[Consulta Adicional](https://github.com/BernardoLondero/BD#consulta-adicional)|N|

## Equipe
Este projeto foi desenvolvido colaborativamente por:
* [Bernardo Londero](https://github.com/BernardoLondero)
* [Arthur Fontoura](https://github.com/Arthur-Fontoura)
* [Gustavo Baptista](https://github.com/SakamotoGB)
