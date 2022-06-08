#!/bin/sh
if [ -f ".phpver" ]; then
    PHP_VER=$(cat .phpver)
    BREW_PHP_VERSIONS_CHECK=$(brew list --versions | grep "php.* $PHP_VER")
    if ! [ "$BREW_PHP_VERSIONS_CHECK" = "" ]; then
        brew unlink php > /dev/null 2>&1
        brew link "php@$PHP_VER" --force --overwrite > /dev/null 2>&1
    fi
fi
