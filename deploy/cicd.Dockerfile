FROM ubuntu:22.04


## Install dotnet-sdk-6.0 and TSQLint
RUN apt-get install -y dotnet-sdk-6.0
RUN dotnet tool install --global TSQLLint

## Run TSQLLint
RUN tsqllint . --config .tsqllint

## Install dotnet SqlProj SDKs
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates

## Create the new sql project
RUN dotnet new sqlproj --name hows-the-weather --force

