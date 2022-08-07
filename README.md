[![NPM](https://img.shields.io/npm/v/qfpm.svg)](https://www.npmjs.com/package/qfpm)
[![Downloads/week](https://img.shields.io/npm/dw/qfpm.svg)](https://npmjs.org/package/qfpm)
![QFPM Tests](https://github.com/gussamer/qfpm/actions/workflows/qfpmtest.yml/badge.svg)
[![qfpm](https://snyk.io/advisor/npm-package/qfpm/badge.svg)](https://snyk.io/advisor/npm-package/qfpm)
[![License](https://img.shields.io/badge/ISC-blue.svg)](https://raw.githubusercontent.com/gussamer/qfpm/master/LICENSE)
# QFPM

## QRFDev Package Manager

### A blend of NPM and SFDX into a Salesforce package dependancy management tool set

The package mangement methodology intended with qfpm is meant to aid with the dependancy management side of salesforce packages. Currently this could be implmented with a private npm service to benefit from the npm dependancy resolution applied to a teams salesforce metadata libraries as they are broken down into packages with a dependancy hierarchy. QFPM could be extended to support the management of sfdx package2 building and installation with dependencies, as well converted to sfdx plugin, if I ever get around to doing it.  

## Updates

- The removal of the bin/qfpm script dependancy complete, automated removal doesn't seem to work so feel free to delete them after upgrading

- Conversion to using native npm bin definition seems stable and opens up better linux support

- WSL support seems to be working though with a big salesforce asterisk down in the AT4DX example

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

This example demonstates facilitating two layers of dependancies required to get started with the fflib apex common sample code library. The sample code requries the fflib apex commons library which intern is dependant on the fflib apex mocks library. With example npm packages for both the commons and mocks published publicly to npm, qfpm is able to install all dependancies via soap to avoid source tracking and then push the sample code for work tracked in the scratch org. 

1. Navigate to the [fflib sample code](https://github.com/apex-enterprise-patterns/fflib-apex-common-samplecode)
1. Clone the repo locally
    ```bash
    git clone https://github.com/apex-enterprise-patterns/fflib-apex-common-samplecode.git
    ```
1. cd into repo
    ```bash
    cd fflib-apex-common-samplecode
    ```
1. init npm to create package.json
    ```bash
    npm init -y
    ```
1. install the qfpm tools
    ```bash
    npm install --save qfpm
    ```
1. install the the fflib commons
    ```bash
    npm install --save npm-fflib-common
    ```
1. setup scratch org and install all
    ```bash
    npm run setup
    ```


#### Setup AT4DX sample code with dependancies

This example expands on the previous fflib sample code to satisfy the requirments of the at4dx sample code. As before the multi layered fflib commons and mocks are required by the at4dx requirement which also has a parallel dependancy of force-di. All of which are installed via soap into a scratch org with the at4dx sample code pushed for tracking.

1. Navigate to the [at4dx sample code](https://github.com/apex-enterprise-patterns/at4dx-samplecode)
1. Clone the repo locally
    ```bash
    git clone https://github.com/apex-enterprise-patterns/at4dx-samplecode.git
    ```
1. cd into repo
    ```bash
    cd at4dx-samplecode
    ```
1. init npm to create package.json
    ```bash
    npm init -y
    ```
1. install the qfpm tools
    ```bash
    npm install --save qfpm
    ```
1. install the at4dx libraries
    ```bash
    npm install --save npm-at4dx
    ```
1. setup scratch org and install all*
    ```bash
    npm run setup
    ```

*sfdx on WSL(maybe linux in general) seems to have an issue thinking the README.md inside the sfdx source dirs is a custom metadata type, so I removed them in the npm package as they just said put stuff here. You can run this command after cloning to delete all the offending README.md files in this repo as a work around.

  ```bash
  for x in $(find ./sfdx-source/ -name README.md); do rm -f $x; done
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