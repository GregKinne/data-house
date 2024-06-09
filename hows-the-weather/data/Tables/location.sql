CREATE TABLE [data].[Location](
	[city_name]         [varchar](255)  NOT NULL,
	[state_code]        [varchar](2)    NOT NULL,
	[country_code]      [varchar](2)    NOT NULL,
	[lat]               [float](24)     NOT NULL,
	[lon]               [float](24)     NOT NULL
);