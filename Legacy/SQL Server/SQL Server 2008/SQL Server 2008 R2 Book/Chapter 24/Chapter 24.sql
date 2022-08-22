--Listing 24.1: 
CREATE RESOURCE POOL samplePool
WITH (MAX_CPU_PERCENT = 50,
MAX_MEMORY_PERCENT = 50)

--Listing 24.2: 
CREATE WORKLOAD GROUP sampleWorkload
WITH (IMPORTANCE = HIGH)
USING samplePool

--Listing 24.3: 
CREATE FUNCTION sampleClassFunction()
RETURNS SYSNAME
WITH SCHEMABINDING
AS
BEGIN
DECLARE @wkldgroup SYSNAME
IF (APP_NAME() = 'Resource Governance')
SET @wkldgroup = 'sampleWorkload'
ELSE
RETURN NULL
RETURN @wkldgroup
END

--Listing 24.4: 
ALTER RESOURCE GOVERNOR
WITH (CLASSIFIER_FUNCTION = dbo.sampleClassfunction)
ALTER RESOURCE GOVERNOR RECONFIGURE

--Listing 24.5: 
SELECT * FROM sys.dm_os_performance_counters
WHERE object_name IN
('SQLServer:Workload Group Stats', 'SQLServer:Resource Pool Stats')
AND instance_name = 'default'

--Listing 24.6: 
SELECT * FROM sys.dm_resource_governor_workload_groups
SELECT * FROM sys.dm_resource_governor_resource_pools
SELECt * FROM sys.dm_resource_governor_configuration

--Listing 24.7: 
SELECT * FROM sys.resource_governor_workload_groups
SELECT * FROM sys.resource_governor_resource_pools
SELECt * FROM sys.resource_governor_configuration


