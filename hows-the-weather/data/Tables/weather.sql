CREATE TABLE [data].[Weather]
(
	[report_date]   [date]          	NOT NULL,
	[location_id]	[int]				NOT NULL,
	[temperature]   [float](24)     	NOT NULL,
	[wind_speed]    [float](24)     	NOT NULL,
	[humidity]      [float](24)     	NOT NULL,
	[generated_on]  [datetime]      	NOT NULL,

	INDEX 			    [ix_location_id] 	    NONCLUSTERED 	([location_id]),
	CONSTRAINT			[fk_wt_location_id]     FOREIGN KEY		([location_id])	REFERENCES [data].[Location](location_id),

    PRIMARY KEY CLUSTERED 
    (
        [report_date] ASC,
        [location_id] ASC
    )
);