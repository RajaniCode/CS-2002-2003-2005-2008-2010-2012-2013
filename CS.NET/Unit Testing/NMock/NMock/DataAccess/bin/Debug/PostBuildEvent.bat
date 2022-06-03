@echo off
copy "C:\Users\Rajani\Desktop\Quick Reference\Unit Testing\NMock\NMock\DataAccess\bin\Debug\DataAccess.dll" ..\..\..\UnitTests\bin\Debug\
copy "C:\Users\Rajani\Desktop\Quick Reference\Unit Testing\NMock\NMock\DataAccess\bin\Debug\DataAccess.pdb" ..\..\..\UnitTests\bin\Debug\
if errorlevel 1 goto CSharpReportError
goto CSharpEnd
:CSharpReportError
echo Project error: A tool returned an error code from the build event
exit 1
:CSharpEnd