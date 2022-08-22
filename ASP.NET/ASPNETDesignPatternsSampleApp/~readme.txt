--------------------------------
ASP.NET Design Patterns Examples
--------------------------------

Note that parts of the sample will only run correctly on a system configured 
with SQL Server installed locally with the Northwind database.

You can change the connection strings in the <connectionStrings> section
of the Web.config file if you want to use a remote database.

You may also need modify the Web Reference in the DemoSite project to point
to the location of the DemoService Web Service. Alternatively, remove and
recreate the Web Reference specifying the DemoService Web Service. The setting
for the Web Service is stored in the Web.config file in the DemoSite folder. 
Make sure you use the name LocalDemoService.Service, as follows:

<appSettings>
  <add key="LocalDemoService.Service" 
       value="http://localhost/path_to_your_DemoService_folder/DemoService/Service.asmx"/>
</appSettings>

---------------------------
 