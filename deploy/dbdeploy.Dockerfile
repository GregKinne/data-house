FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

WORKDIR /app

# Add msft Key
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc

# Add msft repo
RUN curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | tee /etc/apt/sources.list.d/mssql-release.list

# Updaate repos
RUN apt-get update

# Install sqlcmd
RUN ACCEPT_EULA=Y apt-get install mssql-tools18 unixodbc-dev -y 

# Add sqlcmd to path
RUN export PATH="$PATH:/opt/mssql-tools18/bin"

# Setup the dotnet sqlproject in order to build the database model
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates
RUN dotnet new sqlproj -s SqlAzure --name dbmodel

# Setup the database model deployment tooling
RUN dotnet tool install --global microsoft.sqlpackage

# Setup the T-SQL linter
RUN dotnet tool install --global TSQLLint

# Put the dotnet tooling in our PATH 
ENV PATH="${PATH}:/root/.dotnet/tools"

# Move database object definition files to the container
COPY dbmodel /app

# Build the database project (create the .dacpac file used for deployment)
# RUN dotnet build ./dbmodel/dbmodel.csproj