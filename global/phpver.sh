#!/bin/sh
if [ -f ".phpver" ]; then
	PHPVER=$(cat .phpver)
	BREW_PHP_VERSIONS_CHECK=$(brew list --versions | grep "php.*$PHPVER")
	if ! [ "$BREW_PHP_VERSIONS_CHECK" = "" ]; then
		brew unlink php > /dev/null 2>&1
		# Only from 7.4 - 8.1 cuz those are the ones I use, if you want to feel free to add more.
		# Also I don't use the variable cuz it seems to have issues in ubuntu.
		if [ "$PHPVER" = "8.1" ]; then
			brew link php@8.1 > /dev/null 2>&1
		elif [ "$PHPVER" = "8.0" ]; then
			brew link php@8.0 > /dev/null 2>&1
		elif [ "$PHPVER" = "7.4" ]; then
			brew link php@7.4 > /dev/null 2>&1
		fi
	fi
fi
