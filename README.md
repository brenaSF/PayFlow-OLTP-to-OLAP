# PayFlow-OLTP-to-OLAP

Laboratório prático para entender a diferença entre **OLTP** (processamento transacional) e **OLAP** (processamento analítico), com um mini e-commerce.

## Objetivo

- Registrar pedidos em um banco **OLTP** (normalizado, com transações).
- Copiar os dados via **ETL** para um banco **OLAP** (modelo estrela).
- Responder perguntas de negócio no OLAP (ex.: receita por categoria e mês).
- Validar tudo com testes unitários e de integração.

## Visão geral da arquitetura

```
┌──────────┐   place_order()   ┌────────────┐    ETL     ┌────────────┐   SQL analítico   ┌──────────┐
│ Aplicação│ ────────────────► │ OLTP       │ ─────────► │ OLAP       │ ────────────────► │ Relatório│
│ (pedidos)│                   │ (SQLite 3FN)│ extrai,    │ (estrela)  │  GROUP BY, SUM    │          │
└──────────┘                   └────────────┘ transforma, └────────────┘                   └──────────┘
                                               carrega
```

## Como executar

```bash
python -m venv .venv
source .venv/bin/activate
pip install -e ".[dev]"
```

## Testes

```bash
pytest                      # todos
pytest tests/unit           # só unitários
pytest tests/integration    # só integração
```

- **Unitário:** isola uma peça (ex.: `place_order` faz rollback sem estoque).
- **Integração:** valida o fluxo completo OLTP → ETL → OLAP.
