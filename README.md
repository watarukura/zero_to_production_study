# zero_to_production_study

studing [Zero To Production In Rust](https://algoluca.gumroad.com/l/zero2prod)

## Require

- VS Code and devcontainer
- Docker

## Coding

- automatic lint and format and test
  - `cargo watch -x clippy -x fmt -x test`
  - use .ignore for ignore files
- use aqua for install dev utils
  - typos
  - actionlint
- typo check
  - `typos`
  - use _typos.toml
- use commitizen
  - `git cz commit`
- pre-commit hook with lefthook

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
  - use circleci/postgres:9.6-bullseye-ram
    - on memory
    - docker stop and clear state
- use [gcr.io/distroless/static](https://github.com/GoogleContainerTools/distroless/blob/main/base/README.md)
  - size down & secure image
- use [aqua](https://aquaproj.github.io/docs/tutorial-basics/quick-start)

## CI

- use postgres:latest container with test and lint
  - see <https://gist.github.com/LukeMathWalker/85894aa1ccfe23b25437f953ab551638>
