# escape=`
#FROM microsoft/dotnet:sdk-nanoserver
FROM microsoft/dotnet:2.0-sdk

WORKDIR MusicStore
COPY samples/MusicStore/MusicStore.csproj samples/MusicStore/MusicStore.csproj
COPY NuGet.config .
COPY version.props .
COPY build/*.props build/
RUN dotnet restore --runtime ubuntu.16.04-arm .\samples\MusicStore

COPY samples samples
RUN dotnet build --framework netcoreapp1.1 --runtime ubuntu.16.04-arm .\samples\MusicStore

EXPOSE 5000
ENV ASPNETCORE_URLS http://0.0.0.0:5000

WORKDIR /MusicStore/samples/MusicStore
CMD dotnet run --framework netcoreapp1.1
