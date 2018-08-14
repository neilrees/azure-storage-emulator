# escape=`

FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# SQL Server 2012 LocalDB
ADD https://download.microsoft.com/download/F/6/7/F673709C-D371-4A64-8BF9-C1DD73F60990/ENU/x64/SqlLocalDB.msi SqlLocalDB.msi
RUN Start-Process -FilePath msiexec -ArgumentList /q, /i, SqlLocalDB.msi, IACCEPTSQLLOCALDBLICENSETERMS=YES -Wait;
RUN "& 'C:\Program Files\Microsoft SQL Server\110\Tools\Binn\SqlLocalDB.exe' create azure -s"

# Azure Storage Emulator
ADD https://go.microsoft.com/fwlink/?linkid=717179&clcid=0x409 MicrosoftAzureStorageEmulator.msi
RUN Start-Process -FilePath msiexec -ArgumentList /q, /i, MicrosoftAzureStorageEmulator.msi -Wait;
RUN "& 'C:\Program Files (x86)\Microsoft SDKs\Azure\Storage Emulator\AzureStorageEmulator.exe' init /server '(localdb)\azure'"
EXPOSE 10000 10001 10002

# Configure and launch
COPY start.ps1 .
CMD .\start

