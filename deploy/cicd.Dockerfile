FROM ubuntu:22.04 AS build

WORKDIR /app

ENV PATH="$PATH:/root/.dotnet/tools"
ENV ACCEPT_EULA=Y 

RUN apt-get install -y dotnet-sdk-6.0

## Install TSQLLint
RUN dotnet tool install --global TSQLLint

COPY ./.tsqllint ./.tsqllint

## Run TSQLLint
RUN tsqllint . --config ./.tsqllint

## Install dotnet SqlProj SDKs
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates

## Create the new sql project
RUN dotnet new sqlproj -s SqlAzure --name hows-the-weather --force

## Build the project
RUN dotnet build hows-the-weather/hows-the-weather.csproj

## Download MSFT Key and Add MSFT Repo
RUN apt-get install mssql-tools18 unixodbc-dev -y 
ENV PATH="$PATH:/opt/mssql-tools18/bin"

## Install sqlpackage
RUN dotnet tool install --global microsoft.sqlpackage