# Project Title
Personal scripts


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
Prerequisites are needed for some of the scripts:
- MacOS
- Yarn
- jq

```bash
brew install jq
```

Give permissions to the script you downloads
```bash
chmod u+x name_of_the_script.sh
```
Add the folder where you save the scripts to your path
```bash
# In ~/.zshrc
export PATH=$PATH:<path_to_your_scripts_folder>

# In your terminal
source .zshrc
```

### Using scripts

Download the script you want to use and execute it in your terminal. You can find the description of each script in the first lines of the file.

```bash
# Running start_react_project script
start_react_project.sh
```

## Available scripts
1. start_react_project.sh

## Built With

* [jq](https://stedolan.github.io/jq/) - command-line JSON processor

## Contributing

Be my gues to start an issue or make a pull request with your contributions

## Authors

* **Sebastián Linares**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
