jirash
======

Shell access to JIRA using the REST API


Configuration

```
   JIRA_KEY=PROJECT
   JIRA_URL="https://localhost:8080/jira/rest/api/latest"
   CURL_OPTS="-k -s"

   USERNAME=username
   PASSWORD=password
```

Available commands

* list_versions
* list_components
* create_version <name>
* delete_version <name>
* create_component <name> <description>
* delete_component <name>
* get_issue <name>
* list_status <name>

