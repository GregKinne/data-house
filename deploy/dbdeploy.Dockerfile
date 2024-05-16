FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app

# Setup terraform
RUN apt-get update && apt-get install -y gnupg software-properties-common
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
        gpg --dearmor | \
        tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
        tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update
RUN apt-get install terraform -y
RUN terraform init

# Setup GCloud CLI
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt update
RUN apt-get install google-cloud-cli -y

# Setup the dotnet sqlproject in order to build the database model
RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates
RUN dotnet new sqlproj -s Sql150 --name dbmodel

# Setup the T-SQL linter
RUN dotnet tool install --global TSQLLint
ENV PATH="${PATH}:/root/.dotnet/tools"

# Setup the GCP Identity Aware Proxy to communicate with the DB
RUN curl -o cloud-sql-proxy https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.11.0/cloud-sql-proxy.linux.amd64
RUN chmod +x cloud-sql-proxy

# Move database object definition files to the container
COPY src/data-house /app

# Build the database project (create the .dacpac file used for deployment)
RUN dotnet build ./dbmodel/dbmodel.csproj  
