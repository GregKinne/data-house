CREATE TABLE [stage].[weather_log]
(
    [record_dt]     DATETIME        NOT NULL,
    [city]          VARCHAR(255)    NOT NULL, 
    [state]         CHAR(2)         NOT NULL,
    [description]   VARCHAR(100)    NOT NULL,
    [temperature]   DECIMAL(18,2)   NOT NULL,
    [wind_speed]    DECIMAL(18,2)   NOT NULL,
    [humidity]      DECIMAL(18,2)   NOT NULL,
    [updated_ts]    DATETIME        NOT NULL    DEFAULT (GETDATE()),
    [updated_by]    VARCHAR(255)    NOT NULL    DEFAULT (ORIGINAL_LOGIN()) ,
    [updated_host]  VARCHAR(255)    NOT NULL    DEFAULT (HOST_NAME()),
    [created_ts]    DATETIME        NOT NULL    DEFAULT (GETDATE()),
    [created_by]    VARCHAR(255)    NOT NULL    DEFAULT (ORIGINAL_LOGIN()) ,
    [created_host]  VARCHAR(255)    NOT NULL    DEFAULT (HOST_NAME()),

    PRIMARY KEY     CLUSTERED       ([record_dt], [state], [city])
);
GO