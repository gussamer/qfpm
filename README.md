# QFPM

## QRFDev Package Manager

### Installs the NPM SFDX Package Dependancy Resolution Proof of Concept scripts
======================================

## Install

1. Open Git Bash on Windows
1. Navigate to folder you want your project
1. Create a SFDX project with
    ```bash
    sfdx force:project:create -n newsfdxproject
    ```
1. Move into the project folder with
    ```bash
    cd newsfdxproject
    ```
1. Install the qfpm tools with*
    ```bash
    npm install qfpm --save --only=prod
    ```
1. Run setup to create scratch org and deploy dependancies
    ```bash
    npm run setup
    ```

 \* qfpm has no external dependancies all warnings are due to packages salesforce uses in their default project package.json

## Use

### Example

#### Setup FFLIB commons sample code with dependancies

1. Navigate to the [fflib sample code](https://github.com/apex-enterprise-patterns/fflib-apex-common-samplecode)
1. Clone the repo locally
    ```bash
    git clone https://github.com/apex-enterprise-patterns/fflib-apex-common-samplecode.git
    ```
1. cd into repo
    ```bash
    cd fflib-apex-common-samplecode
    ```
1. init npm and hit enter through all questions
    ```bash
    npm init
    ```
1. install the qfpm tools
    ```bash
    npm install --save qfpm
    ```
1. install the the fflib commons
    ```bash
    npm install --save npm-fflib-common
    ```


#### Setup AT4DX sample code with dependancies

1. Navigate to the [at4dx sample code](https://github.com/apex-enterprise-patterns/at4dx-samplecode)
1. Clone the repo locally
    ```bash
    git clone https://github.com/apex-enterprise-patterns/at4dx-samplecode.git
    ```
1. cd into repo
    ```bash
    cd at4dx-samplecode
    ```
1. init npm and hit enter through all questions
    ```bash
    npm init
    ```
1. install the qfpm tools
    ```bash
    npm install --save qfpm
    ```
1. install the the fflib commons
    ```bash
    npm install --save npm-at4dx
    ```

### Commands

1. Build source into metadata format

    - executes sfdx source convert

    ```bash
    npm run build
    ```

1. Clean up scratch org

    - marks projects scratch org for deletion

    ```bash
    npm run clean
    ```

1. Deploy whole project directly as metadata format

    - executes sfdx source deploy
    - bypasses source tracking

    ```bash
    npm run deploy
    ```

1. Push source to scratch org

    - executes sfdx source push

    ```bash
    npm run push
    ```

1. Scratch a new org

    - creates new scratch org from config
    - checks if org already exists

    ```bash
    npm run scratch
    ```

1. Setup current project for development

    - setups up a scratch org
    - deploys all dependancies to scratch org

    ```bash
    npm run setup
    ```

1. Test project

    - runs all tests in scratch org

    ```bash
    npm run test
    ```