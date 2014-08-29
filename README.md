jirash
======

Shell access to JIRA using the REST API

## Configuration


```bash
   JIRA_KEY=PROJECT
   JIRA_URL="https://localhost:8080/jira/rest/api/latest"
   CURL_OPTS="-k -s"

   USERNAME=username
   PASSWORD=password
```

## Command Line

```bash
jirash [-h] [-i] <command> <arg1> <arg2> ... <argN>
```

## Options

* -h    display help
* -i    interactive mode

## Available commands

* list_versions
* list_components
* create_version <name>
* delete_version <name>
* create_component <name> <description>
* delete_component <name>
* get_issue <key>
* list_status <name>
* list_transitions <key>

## Dependencies

* curl (http://curl.haxx.se/)
* jq (http://stedolan.github.io/jq/)
