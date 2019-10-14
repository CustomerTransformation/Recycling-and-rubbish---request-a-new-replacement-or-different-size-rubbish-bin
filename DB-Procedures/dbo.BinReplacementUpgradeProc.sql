USE [ProdRubbishRecycling]
GO

/****** Object:  StoredProcedure [dbo].[BinReplacementUpgradeProc]    Script Date: 14/10/2019 10:51:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Daniela Dutu
-- Create date: 16/07/2019
-- Description:	Writes values to the table BinReplacementUpgrade from the form
-- =============================================
CREATE PROCEDURE [dbo].[BinReplacementUpgradeProc] 
	-- Add the parameters for the stored procedure here
  
	@Reference varchar(20) ,
	@FullName varchar(100) ,
	@EmailAddress varchar(100) ,
	@Telephone varchar (50) ,
	@Address varchar(100) ,
	@Postcode varchar (8) ,
	@Road varchar(100) ,
	@FirstLineAddress varchar(100),
	@UPRN varchar (20) ,
	@ReasonApplication varchar(50) ,
	@ReasonUpgrade varchar(50) ,
	@SpecifyReason varchar(max) ,
    @DateResourceController varchar(max) ,
	@OutcomeRC varchar(max) ,
	@CaseDueDate varchar(max) ,
	@TeamAssigned varchar(max) ,
	@OfficerAssigned varchar(max) ,
	@BinSize varchar(max),
	@AmountBags varchar(max),
	@CommentsRC varchar(max) ,
	@ResourceController varchar(max) ,
	@DateWasteAssessment varchar(max) ,
	@CustomerQualifies varchar(max) ,
	@ReasonRejection varchar(max) ,
	@CommentsWaste varchar(max) ,
	@WasteOfficer varchar(max) ,
	@DateBiffa varchar(max) ,
	@BinDelivered varchar(max) ,
	@ReasonNotDelivered varchar(max) ,
	@CommentsBiffa varchar(max) ,
	@BiffaOfficer varchar(max),
	@OldBinPicked varchar(max),
	@ReasonNotPicked varchar(max) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Date date
	SET @Date= GETDATE()
	


	IF exists (SELECT Reference FROM BinReplacementUpgrade WHERE Reference = @Reference)
	BEGIN
			
		IF isnull(@WasteOfficer,'') != ''
			BEGIN
			UPDATE BinReplacementUpgrade
	--LTRIM gets rid of the space in front, in case the column is blank
	
		SET 
			DateWasteAssessment = LTRIM(ISNULL(DateWasteAssessment,'') + ' ' + ISNULL(@DateWasteAssessment,'')),
			CustomerQualifies= LTRIM(ISNULL(CustomerQualifies,'') + ' ' + ISNULL(@CustomerQualifies,'')),
			BinSize = LTRIM(ISNULL(BinSize, '') + ' ' + ISNULL(@BinSize,'')),
		    AmountBags = LTRIM(ISNULL(AmountBags, '') + ' ' + ISNULL(@AmountBags,'')),
			ReasonRejection = LTRIM(ISNULL(ReasonRejection,'') + ' ' + ISNULL(@ReasonRejection,'')),
			CommentsWaste = LTRIM(ISNULL(CommentsWaste,'') + ' ' + ISNULL(@CommentsWaste,'')),
			WasteOfficer = LTRIM(ISNULL(WasteOfficer,'') + ' ' + ISNULL(@WasteOfficer,''))
			WHERE Reference = @Reference
			END

		IF isnull(@BIffaOfficer,'') != ''
			BEGIN
			UPDATE BinReplacementUpgrade

	
		SET 
			DateBiffa = LTRIM(ISNULL(DateBiffa ,'') + ' ' + ISNULL(@DateBiffa ,'')),
			BinDelivered = ISNULL(@BinDelivered,''), --this needs to be either yes or no, so that I can display outstanding jobs for Biffa where Bindelivered is no; if I have multiple values in there, I cannot do that
			ReasonNotDelivered = LTRIM(ISNULL(ReasonNotDelivered,'') + ' ' + ISNULL(@ReasonNotDelivered,'')),
			CommentsBiffa = LTRIM(ISNULL(CommentsBiffa ,'') + ' ' + ISNULL(@CommentsBiffa,'')),
			BiffaOfficer = LTRIM(ISNULL(BiffaOfficer,'') + ' ' + ISNULL(@BiffaOfficer,'')),
			OldBinPicked = LTRIM(ISNULL(OldBinPicked,'') + ' ' + ISNULL(@OldBinPicked,'')),
			ReasonNotPicked = LTRIM(ISNULL(ReasonNotPicked,'') + ' ' + ISNULL(@ReasonNotPicked,''))
			WHERE Reference = @Reference
			END
			
					
		IF isnull(@ResourceController,'') != ''
		BEGIN
		UPDATE BinReplacementUpgrade
		SET	
		BinSize = LTRIM(ISNULL(BinSize, '') + ' ' + ISNULL(@BinSize,'')),
		AmountBags = LTRIM(ISNULL(AmountBags, '') + ' ' + ISNULL(@AmountBags,'')),
		CommentsRC = LTRIM(ISNULL(CommentsRC, '') + ' ' + ISNULL(@CommentsRC,'')),
		DateResourceController= LTRIM(ISNULL(DateResourceController, '')+ ' ' + ISNULL (@dateResourceController,'')),
		OutcomeRC = LTRIM(ISNULL(OutcomeRC, '') + ' ' +  ISNULL(@OutcomeRC,'')),
		ResourceController = LTRIM(ISNULL(ResourceController, '')+ ' ' + ISNULL(@ResourceController,'')),
		TeamAssigned = LTRIM(ISNULL(TeamAssigned, '')+ ' ' + ISNULL(@TeamAssigned,'')),
		OfficerAssigned  = LTRIM(ISNULL(OfficerAssigned ,'') + ' ' +  ISNULL(@OfficerAssigned , '')),
		CaseDueDate = LTRIM(ISNULL(CaseDueDate, '')+ ' ' + ISNULL(@CaseDueDate,''))
		WHERE Reference = @Reference
			END
	END	
	ELSE
	BEGIN
	INSERT INTO BinReplacementUpgrade (
	 [Date],
	[Reference]  ,
	[FullName]  ,
	[EmailAddress]  ,
	[Telephone]   ,
	[Address]  ,
	[Postcode],
	[Road]  ,
	[FirstLineAddress]   ,
	[UPRN]   ,
	[ReasonApplication]  ,
	[ReasonUpgrade]  ,
	[SpecifyReason]  ,
    [DateResourceController]  ,
	[OutcomeRC]  ,
	[CaseDueDate]  ,
	[TeamAssigned]  ,
	[OfficerAssigned]  ,
	[BinSize],
	[AmountBags],
	[CommentsRC]  ,
	[ResourceController]
	 )

	VALUES (
	@Date,
	@Reference  ,
	@FullName  ,
	@EmailAddress  ,
	@Telephone   ,
	@Address  ,
	@Postcode   ,
	@Road  ,
	@FirstLineAddress   ,
	@UPRN   ,
	@ReasonApplication  ,
	@ReasonUpgrade  ,
	@SpecifyReason  ,
	CASE 
	WHEN @ResourceController is NULL or @ResourceController = ''
	THEN ''
	ELSE
	@DateResourceController
	END,
	@OutcomeRC  ,
	@CaseDueDate  ,
	@TeamAssigned  ,
	@OfficerAssigned  ,
	@BinSize,
	@AmountBags,
	@CommentsRC  ,
	@ResourceController
	 )
	END
END
GO

