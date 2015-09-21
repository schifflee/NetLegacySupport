@echo Off

REM Build

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild ..\NetLegacySupport.Action.Net20.sln /p:Configuration="Release" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false
%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild ..\NetLegacySupport.Action.Net35.sln /p:Configuration="Release" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false
%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild ..\NetLegacySupport.Action.Net40.sln /p:Configuration="Release" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

REM Package

rd /s/q bin
mkdir bin
mkdir bin\lib
mkdir bin\lib\net20
mkdir bin\lib\net35
mkdir bin\lib\net40

copy ..\output\NetLegacySupport.Action\bin\Net20\Release\* bin\lib\net20
copy ..\output\NetLegacySupport.Action\bin\Net35\Release\* bin\lib\net35
copy ..\output\NetLegacySupport.Action\bin\Net40\Release\* bin\lib\net40

call nuget.exe pack NetLegacySupport.Action.nuspec -BasePath bin