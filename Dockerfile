FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
COPY . .
EXPOSE 8080
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENTRYPOINT ["dotnet","/WebApiTeste.dll", "--server.urls","<http://+:90>"]
