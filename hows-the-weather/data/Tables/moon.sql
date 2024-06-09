CREATE TABLE [data].[Moon](
	[report_date]       [date]          	NOT NULL,
	[moonrise_ts]       [datetime]      	NULL,
	[moonrise_az]       [float](24)     	NULL,
	[moonset_ts]        [datetime]      	NULL,
	[moonset_az]        [float](24)     	NULL,
	[high_moon_ts]      [datetime]      	NULL,
	[high_moon_dce]     [float](24)     	NULL,
	[moonphase_deg]     [float](24)     	NOT NULL,
	[moonphase_desc]    [varchar](20)   	NOT NULL,
	[location_id]		[int]				NOT NULL,
	[generated_on]      [datetime]      	NOT NULL,

	INDEX 				[ix_location_id] 		NONCLUSTERED 	([location_id]),
	CONSTRAINT			[fk__mn_location_id]	FOREIGN KEY		([location_id])	REFERENCES [data].[Location](location_id),

    PRIMARY KEY CLUSTERED 
    (
        [report_date] ASC,
        [location_id] ASC
    )
);