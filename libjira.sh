#!/bin/bash

source librest.sh

VERSION="{\"description\": null, \"name\": \"%s\", \"archived\": false, \"released\": false, \"releaseDate\": null, \"userReleaseDate\": null, \"project\": \"${JIRA_KEY}\"}"
COMPONENT="{\"name\": \"%s\", \"description\": \"%s\", \"leadUserName\": \"${USERNAME}\", \"assigneeType\": \"COMPONENT_LEAD\", \"isAssigneeTypeValid\": false, \"project\": \"${JIRA_KEY}\"}"
SEARCH="{\"jql\": \"%s\",\"startAt\": 0,\"maxResults\": 15,\"fields\": [\"summary\",\"status\",\"assignee\",\"reporter\",\"priority\"]}"

# $1 name
# $2 description
function create_component() {
	do_post "component" "`json_tmpl "${COMPONENT}" "${1}" "${2}"`" | jq
}

# $1 name
function delete_version() {
	do_delete "component/${1}" | jq
}

# $1 name
function create_version() {
	do_post "version" "`json_tmpl "${VERSION}" "${1}"`" | jq
}

# $1 name
function delete_version() {
	do_delete "version/${1}"
}

function list_versions() {
	do_get "project/${JIRA_KEY}/versions" | jq "[ .[] | { id: .id, name: .name } ]"
}

function list_components() {
	do_get "project/${JIRA_KEY}/components" | jq "[ .[] | { id: .id, name: .name } ]"
}

# $1 name
function get_issue() {
	do_get "issue/${1}" | jq
}

function list_status() {
	do_get "status" | jq "[ .[] | { id: .id, name: .name } ]"
}

# $1 jql
function search() {
	do_post "search" "`json_tmpl "${SEARCH}" "project = ${JIRA_KEY} AND ${1}"`" | jq "[ .issues[] | { key: .key, summary: .fields.summary, status: .fields.status.name, priority: .fields.priority.name, assignee: .fields.assignee.name, reporter: .fields.reporter.name } ]"
}

# $1 issue
function list_transitions() {
	do_get "issue/${1}/transitions" | jq "[ .transitions[] | { id: .id, name: .name } ]"
}
