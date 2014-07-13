#!/bin/bash

source rest.conf

function json_tmpl() {
	echo "`printf "$1" "$2" "$3"`"
}

function do_post() {
	curl $CURL_OPTS -u $USERNAME:$PASSWORD -X POST -H "Content-Type: application/json" -d "$2" "$JIRA_URL/$1"
	echo
}

function do_get() {
	curl $CURL_OPTS -u $USERNAME:$PASSWORD -X GET -H "Content-Type: application/json" "$JIRA_URL/$1"
	echo
}

function do_delete() {
	curl $CURL_OPTS -u $USERNAME:$PASSWORD -X DELETE -H "Content-Type: application/json" "$JIRA_URL/$1"
	echo
}
