CREATE TABLE [dbo].[Parts] (
    [Id]    INT           IDENTITY (1, 1) NOT NULL,
    [CarId] INT           NOT NULL,
    [Name]  NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);