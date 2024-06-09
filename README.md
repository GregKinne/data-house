# data-house

Build & Deploy MSFT SQL variant database code with strong guarantees on quality 

## What does CI/CD mean for a database?

### Build
- TSQLLinting - ensuring basic hygiene and style standards are met
- msbuild - ensuring object references and syntax are correct

### Deploy
- sqlpackage.exe - deploying the database model from the msbuild generated artifact
- sqlcmd - deploying post configuration scripts

## pre-commit configuration
tsqllint and msbuild are run as part of the pre-commit configuration. This ensures correct syntax, style and object references before the attempted dev deployment on a PR attempt.
