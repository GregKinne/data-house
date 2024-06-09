CREATE TABLE [data].[Location](
	[city_name]         [varchar](255)  					NOT NULL,
	[state_code]        [varchar](2)    					NOT NULL,
	[country_code]      [varchar](2)    					NOT NULL,
	[lat]               [float](24)     					NOT NULL,
	[lon]               [float](24)     					NOT NULL,
	[location_id]		[int]				IDENTITY(1,1)	NOT NULL,

	INDEX 				[ix_location_id] 	NONCLUSTERED 	([location_id]),
	CONSTRAINT 			[ix_location] 		UNIQUE		 	([city_name], [state_code], [country_code]),

    PRIMARY KEY CLUSTERED 
    (
        [location_id] ASC
    )
);