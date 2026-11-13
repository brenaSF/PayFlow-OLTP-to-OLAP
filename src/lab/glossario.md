
## Glossário

### OLTP vs OLAP

| Característica | OLTP | OLAP |
|---|---|---|
| Objetivo | Operação do dia a dia | Análise e apoio à decisão |
| Operações típicas | INSERT / UPDATE / DELETE curtos | SELECT pesado com agregações |
| Modelo de dados | Normalizado (3FN) | Dimensional (estrela / floco de neve) |
| Registros por consulta | Poucos | Milhões |
| Dados | Atuais | Históricos |
| Garantia principal | ACID | Desempenho de leitura |
| Neste projeto | `src/lab/oltp.py` | `src/lab/olap.py` |

### Termos

#### OLTP (Online Transactional Processing)
- **Definição:** operações de consulta, atualização e inserção.
- **No projeto:** transações simuladas no sistema do banco, registro e atualização.

#### OLAP (Online Analytical Processing)
- **Definição:** fazer análises complexas multidimensionais em grande volume de dados, apoio a decisões estratégicas. 
- **No projeto:** visualização de agregações do sistema para análise crítica de vendas.

#### ACID
- **Atomicidade:** Tudo ou nada — ou todas as operações da transação são concluídas com sucesso, ou nenhuma é aplicada (rollback).
- **Consistência:** Garante que a transação leve o banco de um estado válido para outro estado válido, respeitando todas as regras, restrições (*constraints*) e chaves.
- **Isolamento:** Garante que transações simultâneas sejam executadas de forma independente, sem interferir nos dados intermediários umas das outras.
- **Durabilidade:** Uma vez confirmada (`COMMIT`), a alteração da transação é gravada permanentemente, sobrevivendo a quedas de energia ou falhas no sistema.

#### Transação
- **Definição:** unidade lógica que pode conter uma ou mais transações;
- **No projeto:** Criação de um pedido completo (inserção simultânea em `orders` e `order_items`) e atualização de status no ambiente OLTP.

#### Normalização (3FN)
- **Definição:** : tabelas na 2FN, em que atributos não-chave não tem dependência transitiva, há única PK.
- **No projeto:** tabelas `customers`, `products`, `orders`, `order_items`

#### ETL (Extract, Transform, Load)
- **Extract:** : extração bruta de dados das fontes de dados;
- **Transform:** : transformação dos dados para serem armazenados no banco de dados;
- **Load:** carregamento de dados já transformado, para serem analisados.
- **No projeto:** `src/lab/etl.py`

#### Data Warehouse
- **Definição:** repositório de dados que armazena dados estruturados, orientado a assuntos, integrado, histórico e não volátil, otimizado para consultas analíticas e Business Intelligence (BI). 

#### Modelo estrela
- **Definição:** 
- **No projeto:** `fact_sales` + `dim_date`, `dim_product`, `dim_customer`

#### Tabela fato
- **Definição:**
- **No projeto:** `fact_sales`

#### Tabela dimensão
- **Definição:** _
- **No projeto:** `dim_date`, `dim_product`, `dim_customer`

#### Granularidade
- **Definição:** 
- **Granularidade da `fact_sales`:** _(ex.: uma linha por item de pedido)_

#### Operações OLAP
- **Drill-down:** ex.: ano → mês
- **Roll-up:** _— ex.: mês → ano
- **Slice:**  — filtro em uma dimensão
- **Dice:** — filtro em várias dimensões




## Aprendizados

### Day 1: 
- 3 pontos aprendidos : termos oltp, olap 
- 1 dúvida : como implementar o modelo estrela


