FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

WORKDIR /app
ENV PATH="$PATH:/root/.dotnet/tools"
RUN dotnet tool install --global TSQLLint

COPY ./.tsqllint ./.tsqllint

## Run TSQLLint
RUN tsqllint . --config ./.tsqllint

## Install dotnet SqlProj SDKs
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates

## Create the new sql project
RUN dotnet new sqlproj --name hows-the-weather --force
