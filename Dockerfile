FROM mcr.microsoft.com/dotnet/sdk:8.0 as builder
WORKDIR /src
RUN dotnet new webapi -n WetterApi -o . && \
    dotnet publish -o app

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
COPY --from=builder /src/app/* .
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENTRYPOINT ["dotnet","/WetterApi.dll"]
