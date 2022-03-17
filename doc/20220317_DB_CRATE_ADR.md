# Title: [Choosing A DB Crate]

- Status: accepted
- Deciders: [@me]
- Date: 2022/03/17

## Context

- Which DB Crate
  - tokio-postgres
  - sqlx
  - diesel

## Decision

- Use sqlx

Crate | Compile-time safety | Query interface | Async
-- | -- | -- | --
tokio-postgres | No | SQL | Yes
sqlx | Yes | SQL | Yes
diesel | Yes | DSL | No