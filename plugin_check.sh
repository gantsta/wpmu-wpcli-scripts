#!/bin/bash
red='\033[0;31m'		# Red
green='\033[0;32m'		# Green
nc='\033[0m'			# No Color
sites=$(wp site list --field=url)
for url in $sites; do
	echo "Checking ${url}"
	wp plugin is-active $1 --url=${url}
	if [ $? -eq 0 ]
	then
		echo "${green}Plugin $1 activated on site ${url}${nc}"
	else
		echo "${red}Plugin $1 deactivated on site ${url}${nc}" >&2
	fi
done
