CREATE TABLE [data].[AirQuality](
	[city_name]             [varchar](255)      NOT NULL,
	[state_code]            [varchar](2)        NOT NULL,
	[country_code]          [varchar](2)        NOT NULL,
	[lat]                   [float](24)         NULL,
	[lon]                   [float](24)         NULL,
	[report_date]           [date]              NOT NULL,
	[air_quality_index]     [float](24)         NOT NULL,
	[dominant_pollutant]    [varchar](10)       NOT NULL,
	[generated_on]          [datetime]          NOT NULL,

    PRIMARY KEY CLUSTERED 
    (
        [city_name] ASC,
        [state_code] ASC,
        [country_code] ASC,
        [report_date] ASC
    )
);