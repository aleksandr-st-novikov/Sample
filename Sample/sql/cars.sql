CREATE TABLE [dbo].[Cars] (
    [Id]    INT            IDENTITY (1, 1) NOT NULL,
    [Model] NVARCHAR (150) NOT NULL,
    [Year]  DATE           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);