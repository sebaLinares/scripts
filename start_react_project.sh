#!/bin/bash

# Get user name of the project
echo Name of your project?
read name

# Create react project with $name
yarn create react-app $name

# Install packages
yarn add eslint prettier -D
yarn add eslint-plugin-prettier eslint-config-prettier -D
yarn add husky lint-staged
yarn add @commitlint/cli
yarn add @commitlint/config-conventional

# Create .prettierrc

echo "{
  'printWidth': 100,
  'singleQuote': true
}" > .prettierrc

# Add lint scripts to package.json
jq '.scripts +=
  {
    "lint": {
    "eslint '**.*.js'",
    "lint:fix": "prettier-eslint '**/*.js' --write"}
  }' package.json > temp.txt && mv temp.txt package.json


# Add husky script to package.json
jq '.husky += {
    "hooks": {
      "pre-commit": "lint-staged",
      "commit-msg": "commitment -E HUSKY_GIT-PARAMS"
    }
  }' package.json > temp.txt && mv temp.txt package.json


jq '.lint-staged += {
      "*.js": [
       "yarn run lint:fix",
       "git add"
      ]
  }' package.json > temp.txt && mv temp.txt package.json

# create .eslintrc
eslint --init
