# zero_to_production_study

studing [Zero To Production In Rust](https://algoluca.gumroad.com/l/zero2prod)

## Require

- VS Code and devcontainer
- Docker

## Coding

- automatic lint and format and test
  - `cargo watch -x clippy -x fmt -x test`
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

## Diff

- use postgres on devcontaner
  - postgres host is "postgres"
    - not "127.0.0.1"

## CI

- use postgres:latest container with test and lint
  - see <https://gist.github.com/LukeMathWalker/85894aa1ccfe23b25437f953ab551638>
