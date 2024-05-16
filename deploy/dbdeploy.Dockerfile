FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app

# Setup the dotnet sqlproject in order to build the database model
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates

# Setup the T-SQL linter
RUN dotnet tool install --global TSQLLint
ENV PATH="${PATH}:/root/.dotnet/tools"

# Setup the GCP Identity Aware Proxy to communicate with the DB
RUN curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.11.0/cloud-sql-proxy.linux.amd64
RUN chmod +x cloud-sql-proxy

# Move database object definition files to the container
COPY dbmodel /app
