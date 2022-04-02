# zero_to_production_study

studing [Zero To Production In Rust](https://algoluca.gumroad.com/l/zero2prod)

## Require

- VS Code and devcontainer
- Docker

## Coding

- start
  - `lefthook run setup`
- automatic lint and format and test
  - `cargo watch -x clippy -x fmt -x test`
  - use .ignore for ignore files for watch
- use aqua for install dev utils
  - typos
  - actionlint
- typo check
  - `typos`
  - use _typos.toml
- use commitizen
  - `git cz commit`
- pre-commit hook with lefthook
- setup with lefthook
  - `lefthook run setup`
    - db create and migrate run
    - aqua install
    - test databases clear
    - fish config
- use circleci/postgres:13.5-bullseye-ram container

## Migration

- use sqlx

```shell
sqlx database create
sqlx migrate run
```

## Diff

- use mold on devcontainer with Rust
  - see <https://purton.tech/blog/faster-rust-incremental-builds/>
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
