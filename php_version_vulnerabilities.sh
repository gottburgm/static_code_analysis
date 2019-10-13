#!/bin/bash

PHP_VERSION=""
DATA_DIRECTORY="./data"
VULNERABILITIES_FILE="${DATA_DIRECTORY}/php_versions_vulnerabilities.json"
VULNERABILITIES_REMOTE_FILE="https://raw.githubusercontent.com/psecio/versionscan/master/src/Psecio/Versionscan/checks.json"
PERL_SCRIPT="lib/php_version_vulnerabilities.pl"

if [ ! -z "$1" ]
then
    if [ "$1" == "INSTALL" ] || [ "$1" == "install" ]
    then
        if [ ! -d "${DATA_DIRECTORY}" ]
        then
            mkdir -p "${DATA_DIRECTORY}"
        fi
        if [ ! -f "${VULNERABILITIES_FILE}" ]
        then
            wget ${VULNERABILITIES_REMOTE_FILE} -O ${VULNERABILITIES_FILE}
        fi
        cpan -i Data::Dump
        cpan -i JSON::Parse
        cpan -i Version::Compare
        cpan -i JSON::Parse
        cpan -i JSON::XS
        cpan -i Data::Dump
        cpan -i Term::Table
        cpan -i Term::ReadKey

        echo "Done ."
    elif [ -x "$1" ]
    then
        PHP_VERSION=$(eval $1 --version | grep -oP 'PHP [\d\.]+' | sed 's#PHP ##g')
    else
        PHP_VERSION=$(echo "$1" | grep -oP '[\d\.]+')
    fi

    if [ ! -z "${PHP_VERSION}" ]
    then
        if [ -f "${PERL_SCRIPT}" ] && [ -e "${PERL_SCRIPT}" ]
        then
            echo "[PHP] Checking version: ${PHP_VERSION} ..."
            perl ${PERL_SCRIPT} "${VULNERABILITIES_FILE}" "${PHP_VERSION}"
        fi
    else
        echo "[ERROR] Wrong argument ."
    fi
else
    echo "Usage: $0 install                    : Install dependencies"
    echo "       $0 <PHP_VERSION/PHP_BINARY>   : Display vulnerabilities affecting provided version"
fi
