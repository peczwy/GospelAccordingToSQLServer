IF EXISTS (SELECT * FROM sys.indexes WHERE name = @name AND object_id = OBJECT_ID('[@schema].[@table]'))
BEGIN
	DROP INDEX @name ON @schema.@table;
END

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = @name AND object_id = OBJECT_ID('[@schema].[@table]'))
BEGIN
	CREATE INDEX @name ON @schema.@table(@columns)
	-- Additional columns at LEAF-LEVEL. Sorting is not important at this level. Data is duplicated.
	-- INCLUDES([a],[b],[c])
	-- Additional filtering used for subsetting the index
	-- WHERE
END