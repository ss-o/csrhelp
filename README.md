# CSR Helper

[![license](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/ss-o/csrhelp/main/LICENSE)

***CSR Helper*** is a simple application based on [AngularJS Material](http://material.angularjs.org/) and [PKIjs](https://pkijs.org) that aims to make it easy for users to generate certificate requests (PKCS#10s) for requesting SSL certificates.

You can find this project hosted here: https://csrhelp.pages.dev

## Getting Started

To get you started you can simply clone `main` branch from the
[CSR Help](https://github.com/ss-o/csrhelp.git) repository and install the dependencies:

Clone the csrhelp repository using git:

```bash
git clone https://github.com/ss-o/csrhelp.git
cd csrhelp
```

#### Install Dependencies

We have preconfigured `npm` to automatically run `bower` so we can simply do:

```bash
npm install
```

## Directory Layout

```bash
  app/                  --> all of the source files for the application
  assets/app.css        --> default stylesheet
  src/                  --> all app specific modules
  users/                --> package for user features
  index.html            --> app layout file (the main html template file of the app)
  karma.conf.js         --> config file for running unit tests with Karma
  e2e-tests/            --> end-to-end tests
  protractor-conf.js    --> Protractor config file
  scenarios.js          --> end-to-end scenarios to be run by Protractor
```

## Updating dependencies

You can update the tool dependencies by running:

```bash
npm update
bower update
```
## About CSR Helper

The application helps users generate a certificate requests for:

*  **OpenSSL**
*  **Exchange** (2007 and 2010)
*  **Java Keytool**
*  **F5 Big-IP**
*  **IIS**


It supports both ECC and RSA certificate requests and will use use [WebCrypto](http://www.w3.org/TR/WebCryptoAPI/) and [PKIjs](https://pkijs.org) to directly generate keys and certificate requests if the browser supports it.

## Related

- **[angular](http://angularjs.org/)**
- **[angular material](https://material.angularjs.org/)**
- **[pkijs](https://pkijs.org)**
- **[git](http://git-scm.com/)**
- **[bower](http://bower.io)**
- **[npm](https://www.npmjs.org/)**

