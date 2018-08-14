# azure-storage-emulator

An updated version of https://hub.docker.com/r/microsoft/azure-storage-emulator/ using the latest 5.7.0.0 release of the storage emulator.

If you use the latest version of the offical storage emulator image, which contains version 5.3.0.0, with `WindowsAzure.Storage 9.2.0` or higher it produces the error:

`The REST version of this request is not supported by this release of the Storage Emulator. Please upgrade the storage emulator to the latest version. Refer to the following URL for more information: http://go.microsoft.com/fwlink/?LinkId=392237`

Once this issue is closed https://github.com/Azure/azure-storage-net/issues/708 this repository and image is hopefully obsolete.

## Available on Docker Hub
https://hub.docker.com/r/neilrees/azure-storage-emulator/
