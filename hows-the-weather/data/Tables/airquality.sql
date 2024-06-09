CREATE TABLE [data].[AirQuality](
	[location_id]			[int]				NOT NULL,
	[report_date]           [date]              NOT NULL,
	[air_quality_index]     [float](24)         NOT NULL,
	[dominant_pollutant]    [varchar](10)       NOT NULL,
	[generated_on]          [datetime]          NOT NULL,

	INDEX 					[ix_location_id] 		NONCLUSTERED 	([location_id]),
	CONSTRAINT			    [fk_aq_location_id]		FOREIGN KEY		([location_id])	REFERENCES [data].[Location](location_id),

    PRIMARY KEY CLUSTERED 
    (
        [report_date] ASC,
        [location_id] ASC
    )
);