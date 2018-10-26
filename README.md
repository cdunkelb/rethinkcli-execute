# rethinkcli-execute
basic bash script to execute rethink queries against DTR

Manually executing commands against the DTR rethinkDB carries the chance of corrupting the data. Make sure to take a backup before running any queries.

Usage:
rethink-execute.sh RETHINK_QUERY

Example:
rethink-execute.sh "r.db('dtr2').info()"

