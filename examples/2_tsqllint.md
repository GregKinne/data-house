# tsqllint

**What is tsqllint?**

`TSQLLint is a tool for describing, identifying, and reporting the presence of anti-patterns in TSQL scripts.`

[Github Repository](https://github.com/tsqllint/tsqllint)
SSMS Plugin Available!

**What Does it have to offer me, a database administrator/developer?**
- A chance to give warnings or fail actions based on the presences of anti-patterns in tsql
- Enforcement of opinions at a user workstation or automation pipeline

## Show Me

**Building a model of the files in a directory**
```bash
tsqllint . --config .tsqllint
```

**An Example of Catching Select Star Queries**
```bash
#Update the ms_build_view.sql
tsqllint . --config .tsqllint
```

**Taking a look at an example configuration**
```json
{
    "rules": {
        "case-sensitive-variables": "warning",
        "conditional-begin-end": "warning",
        "count-star": "warning",
        "cross-database-transaction": "warning",
        "data-compression": "off",
        "data-type-length": "warning",
        "delete-where": "warning",
        "disallow-cursors": "warning",
        "duplicate-empty-line" : "off",
        "duplicate-go" : "warning",
        "full-text": "warning",
        "information-schema": "warning",
        "keyword-capitalization": "warning",
        "linked-server": "warning",
        "multi-table-alias": "warning",
        "named-constraint": "warning",
        "non-sargable": "warning",
        "object-property": "warning",
        "print-statement": "warning",
        "schema-qualify": "warning",
        "select-star": "warning",
        "semicolon-termination": "warning",
        "set-variable": "warning",
        "unicode-string" : "warning",
        "update-where" : "warning",
        "upper-lower": "warning"
    },
    "compatibility-level": 150
}
```


so - How can we use this to our advantage?