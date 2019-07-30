#!/bin/bash
# Generates a React project with all the linting and formatting configuration. Ready to start coding.
# The final step is eslint --init, the only step you need to input your preferences.


# Get user name of the project
echo Name of your project?
read name

echo // ====================== //
echo // CREATING REACT PROJECT //
echo // ====================== //
# Create react project with $name
yarn create react-app $name && cd ./$name

echo // ======================== //
echo //  Installing dependencies //
echo // ======================== //

# Install packages
yarn add eslint prettier -D
yarn add prettier-eslint-cli -D
yarn add eslint-plugin-prettier eslint-config-prettier -D
yarn add husky lint-staged -D
yarn add @commitlint/cli -D
yarn add @commitlint/config-conventional -D
yarn add babel-eslint -D
echo // =================== //
echo //  .prettierrc config //
echo // =================== //

# Create .prettierrc

echo "{
  'printWidth': 100,
  'singleQuote': true
}" > .prettierrc

echo // =================== //
echo // package.json config //
echo // =================== //

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


jq '."lint-staged" += {
      "*.js": [
       "yarn run lint:fix",
       "git add"
      ]
  }' package.json > temp.txt && mv temp.txt package.json

echo // ================= //
echo // commitlint config //
echo // ================= //

# Create commitlint.config.js
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js


echo // ================ //
echo // .eslintrc config //
echo // ================ //
# create .eslintrc
eslint --init

# Add rules to .eslintrc
jq '.rules += {
"react/jsx-filename-extension": [
      1,
      {
        "extensions": [
          ".js",
          ".jsx"
        ]
      }
    ],
  }' .eslintrc.json > tmp.txt && mv tmp.txt .eslintrc.json

# Add babel-eslint to "parser" in .eslintrc
jq '.parser += "babel-eslint"' .eslintrc.json > temp.txt && mv temp.txt .eslintrc.json

echo // ====================== //
echo // .env config //
echo // ====================== //


echo "SKIP_PREFLIGHT_CHECK=true" > .env
