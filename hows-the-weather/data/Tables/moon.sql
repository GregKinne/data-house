CREATE TABLE [data].[Moon](
	[report_date]       [date]          NOT NULL,
	[moonrise_ts]       [datetime]      NULL,
	[moonrise_az]       [float](24)     NULL,
	[moonset_ts]        [datetime]      NULL,
	[moonset_az]        [float](24)     NULL,
	[high_moon_ts]      [datetime]      NULL,
	[high_moon_dce]     [float](24)     NULL,
	[moonphase_deg]     [float](24)     NOT NULL,
	[moonphase_desc]    [varchar](20)   NOT NULL,
	[city_name]         [varchar](255)  NOT NULL,
	[state_code]        [varchar](2)    NOT NULL,
	[country_code]      [varchar](2)    NOT NULL,
	[lat]               [float](24)     NOT NULL,
	[lon]               [float](24)     NOT NULL,
	[generated_on]      [datetime]      NOT NULL,

    PRIMARY KEY CLUSTERED 
    (
        [city_name] ASC,
        [state_code] ASC,
        [country_code] ASC,
        [report_date] ASC
    )
);