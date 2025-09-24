FROM ubuntu:22.04 AS build

WORKDIR /app

ENV PATH="$PATH:/root/.dotnet/tools"
ENV ACCEPT_EULA=Y 

RUN apt-get update
RUN apt-get install -y dotnet-sdk-8.0

## Install TSQLLint
RUN dotnet tool install --global TSQLLint

COPY ./ ./

## Run TSQLLint
RUN tsqllint . --config ./.tsqllint

## Install dotnet SqlProj SDKs
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates

## Create the new sql project
RUN dotnet new sqlproj -s SqlAzure --name hows-the-weather --force

## Build the project
RUN dotnet build hows-the-weather/hows-the-weather.csproj

## Add MSFT Keys
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update

# RUN apt-get install mssql-tools18 unixodbc-dev -y 
# ENV PATH="$PATH:/opt/mssql-tools18/bin"

## Install sqlpackage
RUN dotnet tool install --global microsoft.sqlpackage