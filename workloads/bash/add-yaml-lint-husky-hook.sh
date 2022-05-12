#!/bin/sh

# Add yaml-lint as a dependency
yarn add -D yaml-lint

# Add a lint script
npx json -I -f package.json -e "this.scripts.lint='yamllint *.{yaml,yml}'"

# Add husky as a dependency
yarn add -D husky

# Add yaml lint as a pre-commit hook by husky
npx json -I -f package.json -e "this.husky.hooks['pre-commit']='yarn lint'"