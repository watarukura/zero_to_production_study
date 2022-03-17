# zero_to_production_study

studing [Zero To Production In Rust](https://algoluca.gumroad.com/l/zero2prod)

## Require

- VS Code and devcontainer
- Docker

## Coding

- automatic lint and format and test
    - `cargo watch -x check -x fmt -x test`
- typo check
    - `typos`
- use commitizen
    - `git cz commit`

## Migration

- use sqlx

```shell
sqlx database create
sqlx migrate run
```