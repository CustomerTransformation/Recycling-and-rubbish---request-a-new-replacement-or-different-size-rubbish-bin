USE [ProdRubbishRecycling]
GO

/****** Object:  View [dbo].[BinReplacementUpgradeView]    Script Date: 03/10/2019 14:06:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[BinReplacementUpgradeView]
AS
SELECT 
CONVERT(VARCHAR(20), Date, 103) AS Date,
Reference,
[FullName]
,[EmailAddress]
,[Telephone]
,[Address]
,[Postcode]
,[Road]
,[FirstLineAddress]
,[UPRN]
,[ReasonApplication]
,[ReasonUpgrade]
,[SpecifyReason]
,CONVERT(VARCHAR(20), [DateResourceController], 103) AS DateResourceController
,[OutcomeRC]
,[CaseDueDate]
,[TeamAssigned]
,[OfficerAssigned]
,[BinSize]
,[CommentsRC]
,[ResourceController]
,CONVERT(VARCHAR(20), [DateWasteAssessment], 103) AS DateWasteAssessment
 ,[CustomerQualifies]
 ,[ReasonRejection]
,[CommentsWaste]
,[WasteOfficer]
,CONVERT(VARCHAR(20),[DateBiffa], 103) AS DateBiffa
,[BinDelivered]
 ,[ReasonNotDelivered]
,[CommentsBiffa]
,[BiffaOfficer]
  FROM [BinReplacementUpgrade]





GO

