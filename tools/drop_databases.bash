#!/bin/bash

# set -euo pipefail

## see https://kags.me.ke/post/how-to-drop-multiple-databases-in-postgresql/#:~:text=At%20the%20prompt%2C%20type%20your,%25'%20AND%20datistemplate%3Dfalse.

script_dir=$(cd $(dirname $0); pwd)
cd "$script_dir"

LANG=C psql -p 5432 -h postgres -U postgres -c "\l" \
  | grep "test-" \
  | cut -d '|' -f 1 \
  | while read dbname; do
      yes password \
        | LANG=C psql -p 5432 -h postgres -U postgres -c 'DROP DATABASE "'"$dbname"'";'
    done

exit 0
