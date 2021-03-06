USE [master]
GO
/****** Object:  Database [BillManagement_Developement_V2]    Script Date: 15-04-2022 16:05:22 ******/
CREATE DATABASE [BillManagement_Developement_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BillManagement_Developement_V2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BillManagement_Developement_V2.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BillManagement_Developement_V2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BillManagement_Developement_V2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BillManagement_Developement_V2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BillManagement_Developement_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET  MULTI_USER 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BillManagement_Developement_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BillManagement_Developement_V2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BillManagement_Developement_V2]
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_ArInvoice]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_ArInvoice] AS TABLE(
	[product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 5) NULL,
	[discount] [numeric](18, 5) NULL,
	[tax] [numeric](18, 5) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[invoiceid] [nvarchar](max) NULL,
	[discounttype] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Arinvoiceinsert]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Arinvoiceinsert] AS TABLE(
	[product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 5) NULL,
	[discount] [numeric](18, 5) NULL,
	[tax] [numeric](18, 5) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[invoiceid] [nvarchar](max) NULL,
	[discounttype] [nvarchar](max) NULL,
	[amount] [numeric](18, 5) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_ArinvoiceSave]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_ArinvoiceSave] AS TABLE(
	[product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 5) NULL,
	[discount] [numeric](18, 5) NULL,
	[tax] [numeric](18, 5) NULL,
	[invoiceid] [nvarchar](max) NULL,
	[discounttype] [nvarchar](max) NULL,
	[amount] [numeric](18, 5) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Bills]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Bills] AS TABLE(
	[ClientID] [numeric](18, 0) NULL,
	[UpdatedOn] [nvarchar](max) NULL,
	[BillID] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Category]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Category] AS TABLE(
	[ClientID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[GLNumber] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[RowStatus] [nvarchar](max) NULL,
	[MasterGLCode] [nvarchar](max) NULL,
	[IsMasterGLCode] [numeric](18, 0) NULL,
	[CategoryName] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Categorylist]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Categorylist] AS TABLE(
	[ClientID] [numeric](18, 0) NULL,
	[SubcategoryGL] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[RowStatus] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[Mastercode] [nvarchar](max) NULL,
	[IsMasterGLCode] [numeric](18, 0) NULL,
	[Category] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_CustomerList]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_CustomerList] AS TABLE(
	[CustomerName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[ClientId] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Customers]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Customers] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CutomerType] [numeric](18, 0) NULL,
	[Email] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[CustomerLogo] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[PaymentTerms] [bigint] NULL,
	[PaymentMethod] [bigint] NULL,
	[Shippingaddress] [nvarchar](max) NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[AccountHoldername] [nvarchar](max) NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[RoutingNumber] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_dwolla]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_dwolla] AS TABLE(
	[FundID] [nvarchar](max) NULL,
	[SourceName] [nvarchar](max) NULL,
	[ClientID] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[BankName] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_dwollaold]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_dwollaold] AS TABLE(
	[FundID] [nvarchar](max) NULL,
	[SourceName] [nvarchar](max) NULL,
	[ClientID] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_GlCodes]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_GlCodes] AS TABLE(
	[IdentityID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[GLNumber] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[RowStatus] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_GlCodesNew]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_GlCodesNew] AS TABLE(
	[IdentityID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[GLNumber] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[RowStatus] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [nvarchar](max) NULL,
	[Category] [numeric](18, 0) NULL,
	[SubCategory] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Invoice]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Invoice] AS TABLE(
	[Lineitemnno] [nvarchar](max) NULL,
	[InvID] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Amount] [numeric](18, 5) NULL,
	[Discount] [numeric](18, 0) NULL,
	[ClientId] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Invoice_old]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Invoice_old] AS TABLE(
	[Lineitemnno] [nvarchar](max) NULL,
	[InvID] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Discount] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Invoice_OLKH]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Invoice_OLKH] AS TABLE(
	[Lineitemnno] [nvarchar](max) NULL,
	[InvID] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Discount] [numeric](18, 0) NULL,
	[ClientId] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceARInsert]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceARInsert] AS TABLE(
	[product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 5) NULL,
	[discount] [numeric](18, 5) NULL,
	[tax] [numeric](18, 5) NULL,
	[amount] [numeric](18, 5) NULL,
	[invoiceid] [nvarchar](max) NULL,
	[discounttype] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinct]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinct] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[ClientId] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinct_Old1]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinct_Old1] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinct_oldone]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinct_oldone] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinctAR]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinctAR] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[ClientId] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinctOld]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinctOld] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [datetime] NULL,
	[TermCode] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinctOLD1]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinctOLD1] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[InvoiceDate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceDistinctOLd4]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceDistinctOLd4] AS TABLE(
	[CustomerID] [numeric](18, 0) NULL,
	[InvID] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_invoiceInsert]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_invoiceInsert] AS TABLE(
	[product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[price] [numeric](18, 5) NULL,
	[discount] [numeric](18, 5) NULL,
	[tax] [numeric](18, 5) NULL,
	[amount] [numeric](18, 5) NULL,
	[invoiceid] [nvarchar](max) NULL,
	[discounttype] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_InvoiceOld1]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_InvoiceOld1] AS TABLE(
	[Lineitemnno] [nvarchar](max) NULL,
	[InvID] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Discount] [numeric](18, 0) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Order]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Order] AS TABLE(
	[OrderId] [bigint] NULL,
	[OrderName] [nvarchar](max) NULL,
	[Billtoaddressid] [nvarchar](max) NULL,
	[Customerid] [numeric](18, 0) NULL,
	[Customeridtype] [nvarchar](max) NULL,
	[Datefulfilled] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Discountamount] [numeric](18, 0) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Discountamountbase] [numeric](18, 0) NULL,
	[Discountpercentage] [numeric](18, 0) NULL,
	[Freightamount] [numeric](18, 0) NULL,
	[Freightamountbase] [numeric](18, 0) NULL,
	[Freighttermscode] [nvarchar](max) NULL,
	[Ispricelocked] [nvarchar](max) NULL,
	[Lastbackofficesubmit] [nvarchar](max) NULL,
	[Opportunityid] [numeric](18, 0) NULL,
	[Ordernumber] [nvarchar](max) NULL,
	[Paymenttermscode] [nvarchar](max) NULL,
	[PaymenttermscodeDisplay] [nvarchar](max) NULL,
	[Pricelevelid] [nvarchar](max) NULL,
	[Pricingerrorcode] [nvarchar](max) NULL,
	[Prioritycode] [nvarchar](max) NULL,
	[Quoteid] [numeric](18, 0) NULL,
	[Requestdeliveryby] [nvarchar](max) NULL,
	[Shippingmethodcode] [nvarchar](max) NULL,
	[ShippingmethodcodeDisplay] [nvarchar](max) NULL,
	[Shiptoaddressid] [nvarchar](max) NULL,
	[Statecode] [nvarchar](max) NULL,
	[Statuscode] [nvarchar](max) NULL,
	[Submitdate] [datetime] NULL,
	[Submitstatus] [nvarchar](max) NULL,
	[Submitstatusdescription] [nvarchar](max) NULL,
	[Totalamount] [numeric](18, 0) NULL,
	[Totalamountbase] [numeric](18, 0) NULL,
	[Totalamountlessfreight] [numeric](18, 0) NULL,
	[Totalamountlessfreightbase] [numeric](18, 2) NULL,
	[Totaldiscountamount] [numeric](18, 0) NULL,
	[Totaldiscountamountbase] [numeric](18, 0) NULL,
	[Totallineitemamount] [numeric](18, 0) NULL,
	[Totallineitemamountbase] [numeric](18, 0) NULL,
	[Totallineitemdiscountamount] [numeric](18, 0) NULL,
	[Totallineitemdiscountamountbase] [numeric](18, 0) NULL,
	[Totaltax] [numeric](18, 0) NULL,
	[Totaltaxbase] [numeric](18, 0) NULL,
	[Willcall] [nvarchar](max) NULL,
	[Salesrepid] [numeric](18, 0) NULL,
	[Pricingdate] [datetime] NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL,
	[PushToDenali] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Orderproduct]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Orderproduct] AS TABLE(
	[OrderProductID] [bigint] NULL,
	[Baseamount] [numeric](18, 0) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Baseamountbase] [numeric](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[Extendedamount] [numeric](18, 0) NULL,
	[Extendedamountbase] [numeric](18, 0) NULL,
	[Iscopied] [nvarchar](max) NULL,
	[Ispriceoverridden] [nvarchar](max) NULL,
	[Isproductoverridden] [nvarchar](max) NULL,
	[Lineitemnumber] [nvarchar](max) NULL,
	[Manualdiscountamount] [numeric](18, 0) NULL,
	[Manualdiscountamountbase] [numeric](18, 0) NULL,
	[Parentbundleid] [numeric](18, 0) NULL,
	[Productassociationid] [numeric](18, 0) NULL,
	[Producttypecode] [nvarchar](max) NULL,
	[Priceperunit] [nvarchar](max) NULL,
	[Priceperunitbase] [nvarchar](max) NULL,
	[Pricingerrorcode] [nvarchar](max) NULL,
	[Productdescription] [nvarchar](max) NULL,
	[Productname] [nvarchar](max) NULL,
	[Productid] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Quantitybackordered] [numeric](18, 0) NULL,
	[Quantitycancelled] [numeric](18, 0) NULL,
	[Quantityshipped] [numeric](18, 0) NULL,
	[Requestdeliveryby] [nvarchar](max) NULL,
	[Orderid] [numeric](18, 0) NULL,
	[Salesorderispricelocked] [nvarchar](max) NULL,
	[Salesorderstatecode] [nvarchar](max) NULL,
	[Salesrepid] [numeric](18, 0) NULL,
	[Shiptoaddressid] [nvarchar](max) NULL,
	[Tax] [numeric](18, 0) NULL,
	[Taxbase] [numeric](18, 0) NULL,
	[Uomid] [numeric](18, 0) NULL,
	[Volumediscountamount] [numeric](18, 0) NULL,
	[Volumediscountamountbase] [numeric](18, 0) NULL,
	[Willcall] [nvarchar](max) NULL,
	[Sequencenumber] [nvarchar](max) NULL,
	[Quotedetailid] [nvarchar](max) NULL,
	[Salesorderdetailname] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Payment]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Payment] AS TABLE(
	[ClientID] [numeric](18, 0) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[BillId] [numeric](18, 0) NULL,
	[vendorID] [nvarchar](max) NULL,
	[PaymentDate] [nvarchar](max) NULL,
	[PaymentAmount] [nvarchar](max) NULL,
	[PaymentReferanceNo] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Products]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Products] AS TABLE(
	[ProductID] [nvarchar](max) NULL,
	[ProductName] [nvarchar](max) NULL,
	[Vendorid] [nvarchar](max) NULL,
	[Validfromdate] [datetime] NULL,
	[Validtodate] [datetime] NULL,
	[Currentcost] [nvarchar](max) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [nvarchar](max) NULL,
	[Currentcostbase] [nvarchar](max) NULL,
	[Defaultuomid] [nvarchar](max) NULL,
	[Defaultuomscheduleid] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Iskit] [nvarchar](max) NULL,
	[Isstockitem] [nvarchar](max) NULL,
	[Parentproductid] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
	[Pricebase] [nvarchar](max) NULL,
	[Productstructure] [nvarchar](max) NULL,
	[ProductstructureDisplay] [nvarchar](max) NULL,
	[Producttypecode] [nvarchar](max) NULL,
	[ProducttypecodeDisplay] [nvarchar](max) NULL,
	[Productnumber] [nvarchar](max) NULL,
	[Producturl] [nvarchar](max) NULL,
	[Quantitydecimal] [nvarchar](max) NULL,
	[Quantityonhand] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Standardcost] [nvarchar](max) NULL,
	[Standardcostbase] [nvarchar](max) NULL,
	[Statecode] [nvarchar](max) NULL,
	[Statuscode] [nvarchar](max) NULL,
	[Stockvolume] [nvarchar](max) NULL,
	[Stockweight] [nvarchar](max) NULL,
	[Suppliername] [nvarchar](max) NULL,
	[Vendorpartnumber] [nvarchar](30) NULL,
	[Hierarchypath] [nvarchar](max) NULL,
	[Pricelistid] [nvarchar](max) NULL,
	[SKUCode] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NULL,
	[ProductSubcategory] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[UnitPrice] [nvarchar](max) NULL,
	[WholesaleCost] [nvarchar](max) NULL,
	[PurchaseCost] [nvarchar](max) NULL,
	[ProfitMargin] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[ClientID] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_VendorList]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_VendorList] AS TABLE(
	[VendorName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[PrefferedPaymentMethod] [nvarchar](max) NULL,
	[PaymentTerm] [nvarchar](max) NULL,
	[GLCode] [nvarchar](max) NULL,
	[ClientID] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_VendorList_old]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_VendorList_old] AS TABLE(
	[VendorName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[PrefferedPaymentMethod] [nvarchar](max) NULL,
	[PaymentTerm] [nvarchar](max) NULL,
	[GLCode] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Vendors]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Vendors] AS TABLE(
	[VendorId] [numeric](18, 0) NULL,
	[VendorName] [nvarchar](max) NULL,
	[VendorType] [numeric](18, 0) NULL,
	[PrimaryEmail] [nvarchar](max) NULL,
	[VendorAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
	[PreferredPaymentMethod] [numeric](18, 0) NULL,
	[TaxID] [nvarchar](max) NULL,
	[PaymentTerms] [numeric](18, 0) NULL,
	[LeadTime] [nvarchar](max) NULL,
	[GlAccount] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[PayPalEmail] [nvarchar](max) NULL,
	[PayPalMobileNumber] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_Vendors2]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_Vendors2] AS TABLE(
	[VendorName] [nvarchar](max) NULL,
	[VendorType] [numeric](18, 0) NULL,
	[PrimaryEmail] [nvarchar](max) NULL,
	[VendorAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
	[PreferredPaymentMethod] [numeric](18, 0) NULL,
	[TaxID] [nvarchar](max) NULL,
	[PaymentTerms] [numeric](18, 0) NULL,
	[LeadTime] [nvarchar](max) NULL,
	[GlAccount] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[PayPalEmail] [nvarchar](max) NULL,
	[PayPalMobileNumber] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TVP_VendorsOld]    Script Date: 15-04-2022 16:05:26 ******/
CREATE TYPE [dbo].[TVP_VendorsOld] AS TABLE(
	[VendorName] [nvarchar](max) NULL,
	[VendorType] [numeric](18, 0) NULL,
	[PrimaryEmail] [nvarchar](max) NULL,
	[VendorAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
	[PreferredPaymentMethod] [numeric](18, 0) NULL,
	[TaxID] [nvarchar](max) NULL,
	[PaymentTerms] [numeric](18, 0) NULL,
	[LeadTime] [nvarchar](max) NULL,
	[GlAccount] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[PayPalEmail] [nvarchar](max) NULL,
	[PayPalMobileNumber] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_BuildInvoices]    Script Date: 15-04-2022 16:05:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE FUNCTION [dbo].[Fn_BuildInvoices]
(@clientId NUMERIC(18,0),@dateDiff NUMERIC(18,0),@status NUMERIC(18,0))
RETURNS NVARCHAR(MAX)
AS
  BEGIN
  DECLARE @returnInvoices NVARCHAR(MAX)
     IF(@dateDiff=0)
     BEGIN  
	  
       SELECT @returnInvoices = ISNULL(@returnInvoices+',','') + InvoiceNumber FROM Tbl_Bill 
       where ClientID=@clientId  AND Status =@status
       AND Convert(date,duedate) = Convert(Date,GetDate()) 
	   END

	   IF(@dateDiff=1)
     BEGIN
     
       SELECT @returnInvoices = ISNULL(@returnInvoices+',','') + InvoiceNumber FROM Tbl_Bill 
       where ClientID=@clientId  AND Status =@status
       AND Convert(Date, DueDate)=Convert(DATE,DATEADD(day,1,GETDATE())) 
	   END

	   IF(@dateDiff=2)
     BEGIN
     
       SELECT @returnInvoices = ISNULL(@returnInvoices+',','') + InvoiceNumber FROM Tbl_Bill 
       where ClientID=@clientId  AND Status =@status
       AND Convert(Date, DueDate)=Convert(DATE,DATEADD(day,2,GETDATE()))
	   END
	   IF(@dateDiff=3)
     BEGIN
     
	 
       SELECT @returnInvoices = ISNULL(@returnInvoices+',','') + InvoiceNumber FROM Tbl_Bill 
       where ClientID=@clientId  AND Status =@status
       AND Convert(date,duedate) BETWEEN Convert(Date,GetDate())  AND Convert(Date, DATEADD(day,2,GETDATE()))
	   END

	   RETURN @returnInvoices
 END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPaymentReferenceId]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_GetPaymentReferenceId](      
@billId NVARCHAR(MAX)           
) RETURNS @table TABLE ( [value] NVARCHAR(MAX))      
AS      
BEGIN 
declare @results varchar(MAX)

IF @billId <> ''
INSERT INTO @table([value])      
SELECT STUFF((SELECT  ',' +PaymentReferenceId FROM [dbo].[fn_split](@billId , ',')
INNER JOIN Tbl_BillApproved B on B.BillId = [fn_split].[value] FOR XML PATH('')), 1, 1, '')

RETURN      
END 
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetUserName]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetUserName](      
@accountID NVARCHAR(MAX),
@clientID numeric(18,0)
) RETURNS @table TABLE ( [value] NVARCHAR(MAX))      
AS      
BEGIN 
declare @results varchar(MAX)

IF @accountID <> ''
INSERT INTO @table([value])      
SELECT STUFF((SELECT  ',' +(ISNULL(FirstName,'')+' '+ISNULL(LastName,'')) FROM [dbo].[fn_split](@accountID , ',')
INNER JOIN Tbl_Accounts k on (k.AccountID = [fn_split].[value] AND k.ClientID=@clientID) FOR XML PATH('')), 1, 1, '')

RETURN      
END 
GO
/****** Object:  UserDefinedFunction [dbo].[fn_split]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_split](      
@delimited NVARCHAR(MAX),      
@delimiter NVARCHAR(100)      
) RETURNS @table TABLE (id INT IDENTITY(1,1), [value] NVARCHAR(MAX))      
AS      
BEGIN      
DECLARE @xml XML      
SET @xml = N'<t>' + REPLACE(@delimited,@delimiter,'</t><t>') + '</t>'      
INSERT INTO @table([value])      
SELECT r.value('.','Nvarchar(MAX)') as item      
FROM @xml.nodes('/t') as records(r)      
RETURN      
END 
GO
/****** Object:  UserDefinedFunction [dbo].[GetInvoices]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetInvoices]
(@clientId NUMERIC(18,0),@dateDiff NUMERIC(18,0),@status NUMERIC(18,0))
RETURNS NVARCHAR(MAX)
AS
  BEGIN
  DECLARE @returnInvoices NVARCHAR(MAX)
     IF(@dateDiff=0)
     BEGIN
     
	  Select @returnInvoices= (SELECT  distinct
              STUFF((SELECT ', ' + CAST(ISNULL(InvoiceNumber,'') AS NVARCHAR(MAX)) [text()]
                FROM Tbl_Bill 
                WHERE ClientID = t.ClientID AND DueDate=t.DueDate AND Status=t.Status
                FOR XML PATH(''), TYPE)
               .value('.','NVARCHAR(MAX)'),1,1,' ') List_Output
       FROM Tbl_Bill t WHERE ClientID=@clientId  AND Convert(Date, DueDate)=Convert(Date, GETDATE()) AND Status=@status
       GROUP BY  ClientID ,DueDate,Status)
	   END

	   IF(@dateDiff=1)
     BEGIN
     
	  Select @returnInvoices= (SELECT  distinct
              STUFF((SELECT ', ' + CAST(ISNULL(InvoiceNumber,'') AS NVARCHAR(MAX)) [text()]
                FROM Tbl_Bill 
                WHERE ClientID = t.ClientID AND DueDate=t.DueDate AND Status=t.Status
                FOR XML PATH(''), TYPE)
               .value('.','NVARCHAR(MAX)'),1,1,' ') List_Output
       FROM Tbl_Bill t WHERE ClientID=@clientId  AND Convert(Date, DueDate)=Convert(DATE,DATEADD(day,1,GETDATE())) AND Status=@status
       GROUP BY  ClientID ,DueDate,Status)
	   END

	   IF(@dateDiff=2)
     BEGIN
     
	  Select @returnInvoices= (SELECT  distinct
              STUFF((SELECT ', ' + CAST(ISNULL(InvoiceNumber,'') AS NVARCHAR(MAX)) [text()]
                FROM Tbl_Bill 
                WHERE ClientID = t.ClientID AND DueDate=t.DueDate AND Status=t.Status
                FOR XML PATH(''), TYPE)
               .value('.','NVARCHAR(MAX)'),1,1,' ') List_Output
       FROM Tbl_Bill t WHERE ClientID=@clientId  AND Convert(Date, DueDate)=Convert(DATE,DATEADD(day,2,GETDATE())) AND Status=@status
       GROUP BY  ClientID ,DueDate,Status)
	   END

	   IF(@dateDiff=3)
     BEGIN
     
	  Select @returnInvoices= (SELECT  distinct
              STUFF((SELECT ', ' + CAST(ISNULL(InvoiceNumber,'') AS NVARCHAR(MAX)) [text()]
                FROM Tbl_Bill 
                WHERE ClientID = t.ClientID AND DueDate=t.DueDate AND Status=t.Status
                FOR XML PATH(''), TYPE)
               .value('.','NVARCHAR(MAX)'),1,1,' ') List_Output
       FROM Tbl_Bill t WHERE ClientID=@clientId  AND Convert(Date, DueDate) BETWEEN GETDATE() AND DATEADD(day,2,GETDATE()) AND Status=50016
       GROUP BY  ClientID ,DueDate,Status)
	   END

	   RETURN @returnInvoices
 END
GO
/****** Object:  Table [dbo].[ApplicationRole]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRole](
	[RoleID] [numeric](18, 0) IDENTITY(1000,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[MasterRoleID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ApplicationRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationRoleEntity]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoleEntity](
	[ApplicationRoleEntityID] [numeric](18, 0) IDENTITY(4000,1) NOT NULL,
	[EntityActionID] [numeric](18, 0) NULL,
	[RoleID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ApplicationRoleEntity] PRIMARY KEY CLUSTERED 
(
	[ApplicationRoleEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillStageApproval]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillStageApproval](
	[BillStageApprovalID] [numeric](18, 0) IDENTITY(5000,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[ApproverID] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,
	[Sequence] [numeric](18, 0) NULL,
	[StageInitiated] [numeric](18, 0) NULL,
	[CurrentStageApproval] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[ApprovedAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_BillStageApproval] PRIMARY KEY CLUSTERED 
(
	[BillStageApprovalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomeDwollaSettings]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomeDwollaSettings](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[DwollaKey] [varbinary](max) NULL,
	[SecretKey] [varbinary](max) NULL,
	[AccountID] [varbinary](max) NULL,
	[IsConnected] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_CustomeDwollaSettings] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomePaypalSettings]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomePaypalSettings](
	[IdentityID] [numeric](18, 0) IDENTITY(3000,1) NOT NULL,
	[CustomePaypalSettingsID] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[APIClientID] [varbinary](max) NULL,
	[APISecretKey] [varbinary](max) NULL,
	[APISignature] [varbinary](max) NULL,
	[APIUserName] [varbinary](max) NULL,
	[APIPassword] [varbinary](max) NULL,
	[IsConnected] [numeric](18, 0) NULL,
	[PayPalSecurityPassword] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomePaypalSettings] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [numeric](18, 0) IDENTITY(2000,1) NOT NULL,
	[EntityName] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[Priority] [numeric](18, 0) NULL,
	[PriorityScreen] [nvarchar](max) NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityAction]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityAction](
	[EntityActionID] [numeric](18, 0) IDENTITY(3000,1) NOT NULL,
	[EntityID] [numeric](18, 0) NULL,
	[ActionName] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_EntityAction] PRIMARY KEY CLUSTERED 
(
	[EntityActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyList](
	[SID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](256) NULL,
	[FunctionalArea] [nvarchar](256) NULL,
	[Category] [nvarchar](256) NULL,
	[SubCategory] [nvarchar](256) NULL,
	[KeyID] [numeric](18, 0) NULL,
	[KeyName] [nvarchar](256) NULL,
	[KeyListID] [numeric](18, 0) NULL,
	[Value1] [nvarchar](256) NULL,
	[Value2] [nvarchar](256) NULL,
	[Value3] [numeric](18, 0) NULL,
	[Value4] [nvarchar](256) NULL,
	[Value5] [nvarchar](256) NULL,
	[HLevel1] [numeric](18, 0) NULL,
	[HLevel2] [numeric](18, 0) NULL,
	[HLevel3] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_KeyList] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterRole]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRole](
	[MasterRoleID] [numeric](18, 0) NULL,
	[MasterRoleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[IsAdded] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeAccount](
	[StripeAccountsID] [numeric](18, 0) IDENTITY(10020,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[PublishableKey] [nvarchar](max) NULL,
	[SecretKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_StripeAccount] PRIMARY KEY CLUSTERED 
(
	[StripeAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeBankAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeBankAccount](
	[StripeBankAccountDetailsID] [numeric](18, 0) IDENTITY(99101,1) NOT NULL,
	[BankAccountNumber] [nvarchar](50) NULL,
	[RoutingNumber] [nvarchar](50) NULL,
	[Name] [nvarchar](150) NULL,
	[IsDefault] [numeric](1, 0) NULL,
	[SourceID] [nvarchar](250) NULL,
	[Status] [nvarchar](50) NULL,
	[IsVerified] [numeric](1, 0) NULL,
 CONSTRAINT [PK_StripeBankAccount] PRIMARY KEY CLUSTERED 
(
	[StripeBankAccountDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StripeCards]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StripeCards](
	[StripeCardDetailsID] [numeric](18, 0) IDENTITY(350010,1) NOT NULL,
	[CardNumber] [nvarchar](20) NULL,
	[ExpiryMonth] [nvarchar](2) NULL,
	[ExpiryYear] [nvarchar](2) NULL,
	[CVV] [nvarchar](5) NULL,
	[IsVerified] [numeric](1, 0) NULL,
	[SourceID] [nvarchar](250) NULL,
	[IsDefault] [numeric](1, 0) NULL,
 CONSTRAINT [PK_StripeCards] PRIMARY KEY CLUSTERED 
(
	[StripeCardDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Accounts]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Accounts](
	[AccountID] [numeric](18, 0) IDENTITY(30001,1) NOT NULL,
	[Role] [numeric](18, 0) NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[PrimaryEmailID] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[Zipcode] [bigint] NULL,
	[IsActive] [numeric](18, 0) NULL,
	[EntityStatus] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[AdministrationRole] [numeric](18, 0) NULL,
	[ApplicationRole] [numeric](18, 0) NULL,
	[IsForgotten] [numeric](18, 0) NULL,
	[LinkID] [nvarchar](max) NULL,
	[IsPasswordGenerated] [numeric](18, 0) NULL,
	[IsDefaultAccountant] [numeric](18, 0) NULL,
	[IsPasswordReseted] [numeric](18, 0) NULL,
	[ApproverSeqence] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ApprovedComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ApprovedComments](
	[ApprovedCommentID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[ApprovedComment] [nvarchar](max) NULL,
	[CreatedOn] [date] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ApprovedBillID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_ApprovedComments] PRIMARY KEY CLUSTERED 
(
	[ApprovedCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ApproveHistory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ApproveHistory](
	[ApproveHistoryID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[ApproverComment] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [date] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ApproverID] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,
	[ApprovedAmount] [numeric](18, 2) NULL,
	[BalanceAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Tbl_ApproveHistory] PRIMARY KEY CLUSTERED 
(
	[ApproveHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ARPreferences]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ARPreferences](
	[PreferencesId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoicePreFix] [nvarchar](200) NULL,
	[Shouldallowedsplitinvoice] [int] NULL,
	[Shouldallowededitinvoiceafteremailsend] [int] NULL,
	[TermsConditions] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Invoicetemplate] [nvarchar](max) NULL,
	[ClientId] [numeric](18, 0) NULL,
	[Createdby] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PreferencesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AuditLog]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AuditLog](
	[Logid] [bigint] IDENTITY(2000,1) NOT NULL,
	[TimeStamp] [datetime] NULL,
	[Activity] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ScreenName] [nvarchar](max) NULL,
	[UserId] [bigint] NULL,
	[SystemIp] [nvarchar](max) NULL,
	[ClientId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Bill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Bill](
	[BillID] [numeric](18, 0) IDENTITY(4000,1) NOT NULL,
	[VendorID] [numeric](18, 0) NULL,
	[AccountID] [numeric](18, 0) NULL,
	[BillDate] [datetime] NULL,
	[Amount] [numeric](18, 2) NULL,
	[InvoiceNumber] [nvarchar](max) NULL,
	[DueDate] [datetime] NULL,
	[Category] [numeric](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
	[PaymentTerms] [numeric](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[IsSplitted] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[Balance] [numeric](18, 2) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[FileDisplayName] [nvarchar](max) NULL,
	[PhysicalLocation] [nvarchar](max) NULL,
	[FileSize] [numeric](18, 2) NULL,
	[FileName] [nvarchar](max) NULL,
	[UserComment] [nvarchar](max) NULL,
	[PurchaseOrder] [nvarchar](max) NULL,
	[IsChallenged] [numeric](18, 0) NULL,
	[IsRecurring] [numeric](18, 0) NULL,
	[RecurrenceReferenceId] [numeric](18, 0) NULL,
	[IsReminder] [numeric](18, 0) NULL,
	[ReminderEmail] [nvarchar](max) NULL,
	[ReminderInterval] [numeric](18, 0) NULL,
	[ReminderIntervalDay] [nvarchar](50) NULL,
	[isAutoApproval] [numeric](18, 0) NULL,
	[RecurrenceStartDate] [datetime] NULL,
	[RecurrenceEndDate] [datetime] NULL,
	[RecurrenceFrequency] [numeric](18, 0) NULL,
	[RecurrenceBatchNumber] [numeric](18, 0) NULL,
	[IsUpdatedDenali] [numeric](18, 0) NULL,
	[Project] [numeric](18, 0) NULL,
	[Customer] [numeric](18, 0) NULL,
	[BillCategory] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillApproved]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillApproved](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[ApprovedAmount] [numeric](18, 2) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[PayableAmount] [numeric](18, 2) NULL,
	[PaymentStatus] [numeric](18, 0) NULL,
	[DueOn] [date] NULL,
	[PaidOn] [datetime] NULL,
	[VendorID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CurrentApprover] [numeric](18, 0) NULL,
	[PaymentReferenceID] [nvarchar](max) NULL,
	[AmountPaid] [numeric](18, 2) NULL,
	[AmountDue] [numeric](18, 2) NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[PaymentMode] [numeric](18, 0) NULL,
	[DwollaFundID] [nvarchar](max) NULL,
	[TypeOfPayment] [numeric](18, 0) NULL,
	[BankTransferID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_BillApproved] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillAttachments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillAttachments](
	[AttatchmentId] [numeric](18, 0) IDENTITY(7000,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[FileName] [nvarchar](max) NULL,
	[PhysicalFileName] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[PhysicalPath] [nvarchar](max) NULL,
	[Extension] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsBillFile] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_BillAttachments] PRIMARY KEY CLUSTERED 
(
	[AttatchmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillBreakage]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillBreakage](
	[BillBreakageID] [numeric](18, 0) IDENTITY(6000,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[BillType] [nvarchar](max) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[AccountName] [nvarchar](max) NULL,
	[GLAccountID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_BillBreakage] PRIMARY KEY CLUSTERED 
(
	[BillBreakageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillCategory](
	[BillCategoryId] [numeric](18, 0) IDENTITY(8000,1) NOT NULL,
	[BillCategory] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_BillCategory] PRIMARY KEY CLUSTERED 
(
	[BillCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillComments](
	[BillCommentID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[CommentBy] [numeric](18, 0) NULL,
	[CommentOn] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_BillComments] PRIMARY KEY CLUSTERED 
(
	[BillCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillDescription]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillDescription](
	[BillDescriptionId] [numeric](18, 0) IDENTITY(6000,1) NOT NULL,
	[BillID] [numeric](18, 0) NOT NULL,
	[Rate] [numeric](18, 2) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Total] [numeric](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_BillDescription] PRIMARY KEY CLUSTERED 
(
	[BillDescriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillDisputedHistory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillDisputedHistory](
	[IdentityID] [numeric](18, 0) IDENTITY(1600,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[BillApprovedID] [numeric](18, 0) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_BillDisputedHistory] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_BillListComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BillListComments](
	[BillCommentID] [bigint] IDENTITY(1,1) NOT NULL,
	[BillID] [bigint] NULL,
	[Commant] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [bigint] NULL,
	[Updatedon] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_BillPaidAttachments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BillPaidAttachments](
	[BillPaidAttatchmentId] [numeric](18, 0) IDENTITY(9000,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[BillApprovedId] [numeric](18, 0) NULL,
	[FileName] [nvarchar](max) NULL,
	[PhysicalFileName] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[PhysicalPath] [nvarchar](max) NULL,
	[Extension] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_BillPaidAttachments] PRIMARY KEY CLUSTERED 
(
	[BillPaidAttatchmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Client]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Client](
	[ClientID] [numeric](18, 0) IDENTITY(2000,1) NOT NULL,
	[ClientName] [nvarchar](max) NULL,
	[PhoneNumber] [bigint] NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Zincode] [bigint] NULL,
	[Status] [numeric](18, 0) NULL,
	[BrandLogo] [nvarchar](max) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[EntityStatus] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ActivationKey] [nvarchar](max) NULL,
	[UserID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ClientBankAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ClientBankAccount](
	[AccountIdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[RoutingNumber] [nvarchar](max) NULL,
	[ReferenceID] [nvarchar](max) NULL,
	[AccountName] [nvarchar](max) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,
	[IsDefault] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[ACHCustomer] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_ClientBankAccount] PRIMARY KEY CLUSTERED 
(
	[AccountIdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ClientCards]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ClientCards](
	[CardIdentityId] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CardName] [nvarchar](max) NULL,
	[CardNumber] [nvarchar](max) NULL,
	[ExpiryMonth] [nvarchar](max) NULL,
	[ExpiryYear] [nvarchar](max) NULL,
	[CCV] [nvarchar](max) NULL,
	[IsDefault] [numeric](18, 0) NULL,
	[ReferenceID] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,
	[BankName] [nvarchar](max) NULL,
	[IsActive] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_ClientCards] PRIMARY KEY CLUSTERED 
(
	[CardIdentityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Configurations]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Configurations](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[IsChangesAllowed] [numeric](18, 0) NULL,
	[IsSplitAllowed] [numeric](18, 0) NULL,
	[IsRecurrenceEnabled] [numeric](18, 0) NULL,
	[IsBillAssociationEnabled] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[IsBillExportEnabled] [numeric](18, 0) NULL,
	[IsEpaymentsEnabled] [numeric](18, 0) NULL,
	[IsOfflinePaymentsAllowed] [numeric](18, 0) NULL,
	[IsImportVendorsAllowed] [numeric](18, 0) NULL,
	[IsAutoApproval] [numeric](18, 0) NULL,
	[IsMultiApproval] [numeric](18, 0) NULL,
	[IsDefaultApproval] [numeric](18, 0) NULL,
	[IsStandardApproval] [numeric](18, 0) NULL,
	[IsCustomApproval] [numeric](18, 0) NULL,
	[IsPartialApprovalEnabled] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Configurations] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CustomApprovalConfigurations]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CustomApprovalConfigurations](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IsVendorType] [numeric](18, 0) NULL,
	[IsAmountType] [numeric](18, 0) NULL,
	[VendorID] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 2) NULL,
	[Condition] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[SecondAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Tbl_CustomApprovalConfigurations] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CustomApprovers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CustomApprovers](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ConfigID] [numeric](18, 0) NULL,
	[ApproverID] [numeric](18, 0) NULL,
	[Sequence] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_CustomApprovers] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Customer_Accounts]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customer_Accounts](
	[CaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [nvarchar](max) NULL,
	[Payment_ID] [nvarchar](max) NULL,
	[Resource] [nvarchar](max) NULL,
	[Account_type] [nvarchar](max) NULL,
	[Last_four] [nvarchar](max) NULL,
	[Expiration_month] [nvarchar](max) NULL,
	[Expiration_year] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Customer3600Notes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customer3600Notes](
	[CustomerNotesID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[OrderByDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Customer360Contact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customer360Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [numeric](18, 0) NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phoneno] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
	[LastName] [nvarchar](max) NULL,
	[OrderByDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Customer360Documents]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customer360Documents](
	[CustomerDocumentID] [numeric](18, 0) IDENTITY(900,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[FileName] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[ModifiedFileName] [nvarchar](max) NULL,
	[OrderByDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CustomerContact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CustomerContact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [numeric](18, 0) NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phoneno] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[ClientID] [numeric](18, 0) NULL,
	[LastName] [nvarchar](max) NULL,
	[OrderByDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CustomerDocuments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CustomerDocuments](
	[CustomerDocumentID] [numeric](18, 0) IDENTITY(900,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[FileName] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[ModifiedFileName] [nvarchar](max) NULL,
	[OrderByDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CustomerNotes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CustomerNotes](
	[CustomerNotesID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CustomerID] [numeric](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[OrderByDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Customers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Customers](
	[CustomerID] [numeric](18, 0) IDENTITY(9500,1) NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CutomerType] [numeric](18, 0) NULL,
	[Email] [nvarchar](max) NULL,
	[ContactNumber] [nvarchar](max) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[CustomerLogo] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[PaymentTerms] [bigint] NULL,
	[PaymentMethod] [bigint] NULL,
	[Shippingaddress] [nvarchar](max) NULL,
	[BillingAddress] [nvarchar](max) NULL,
	[AccountHoldername] [nvarchar](max) NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[RoutingNumber] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL,
	[PushToDenali] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DenaliSync]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DenaliSync](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[syncdate] [datetime] NULL,
	[syncby] [int] NULL,
	[syncsts] [varchar](15) NULL,
	[syncDesc] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DwollaConnectedDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DwollaConnectedDetails](
	[ConnectedID] [int] IDENTITY(1,1) NOT NULL,
	[FundID] [nvarchar](max) NULL,
	[SourceName] [nvarchar](max) NULL,
	[ClientID] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[UpdatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[BankName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConnectedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DwollaTransactions]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DwollaTransactions](
	[TransactionHistoryID] [numeric](18, 0) IDENTITY(5800,1) NOT NULL,
	[BillID] [numeric](18, 0) NULL,
	[FundFrom] [nvarchar](max) NULL,
	[FundTo] [nvarchar](max) NULL,
	[Amount] [numeric](18, 2) NULL,
	[Remarks] [nvarchar](max) NULL,
	[CapturedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[FundId] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[BankTransferID] [nvarchar](max) NULL,
	[SortID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_DwollaTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DwollaTransferAudit]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DwollaTransferAudit](
	[AuditID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FundID] [nvarchar](max) NULL,
	[ResponseID] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[Status] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_DwollaTransferAudit] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmailTemplate]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmailTemplate](
	[EmailTemplateID] [numeric](18, 0) IDENTITY(600010,1) NOT NULL,
	[TemplateName] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[DwollaStatus] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_GlCodes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_GlCodes](
	[IdentityID] [numeric](18, 0) IDENTITY(1200,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[GLNumber] [nvarchar](max) NULL,
	[GLDescription] [nvarchar](max) NULL,
	[RowStatus] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [nvarchar](max) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [nvarchar](max) NULL,
	[Category] [numeric](18, 0) NULL,
	[SubCategory] [numeric](18, 0) NULL,
	[MasterGLCode] [numeric](18, 0) NULL,
	[IsMasterGLCode] [numeric](18, 0) NULL,
	[CategoryName] [nvarchar](max) NULL,
	[IsActive] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_GlCodes] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_InvMailSts]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InvMailSts](
	[invoiceid] [bigint] NULL,
	[reqdate] [datetime] NULL,
	[sentdate] [datetime] NULL,
	[sts] [char](1) NULL,
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Invoice]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Invoice](
	[InvoiceId] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceName] [nvarchar](max) NULL,
	[Billtoaddressid] [nvarchar](max) NULL,
	[Customerid] [numeric](18, 0) NULL,
	[Customeridtype] [nvarchar](max) NULL,
	[Datedelivered] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Discountamount] [numeric](18, 0) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Discountamountbase] [numeric](18, 0) NULL,
	[Discountpercentage] [numeric](18, 0) NULL,
	[Duedate] [datetime] NULL,
	[Freightamount] [numeric](18, 0) NULL,
	[Freightamountbase] [numeric](18, 0) NULL,
	[Invoicenumber] [nvarchar](max) NULL,
	[Ispricelocked] [nvarchar](max) NULL,
	[Lastbackofficesubmit] [nvarchar](max) NULL,
	[Opportunityid] [numeric](18, 0) NULL,
	[Paymenttermscode] [nvarchar](max) NULL,
	[PaymenttermscodeDisplay] [nvarchar](max) NULL,
	[Pricelevelid] [numeric](18, 0) NULL,
	[Pricingerrorcode] [nvarchar](max) NULL,
	[Prioritycode] [nvarchar](max) NULL,
	[Salesorderid] [numeric](18, 0) NULL,
	[Shippingmethodcode] [nvarchar](max) NULL,
	[Shiptoaddressid] [nvarchar](max) NULL,
	[Statecode] [nvarchar](max) NULL,
	[Statuscode] [nvarchar](max) NULL,
	[Totalamount] [numeric](18, 0) NULL,
	[Totalamountbase] [numeric](18, 0) NULL,
	[Totalamountlessfreight] [numeric](18, 0) NULL,
	[Totalamountlessfreightbase] [numeric](18, 0) NULL,
	[Totaldiscountamount] [numeric](18, 0) NULL,
	[Totaldiscountamountbase] [numeric](18, 0) NULL,
	[Totallineitemamount] [numeric](18, 0) NULL,
	[Totallineitemamountbase] [numeric](18, 0) NULL,
	[Totallineitemdiscountamount] [numeric](18, 0) NULL,
	[Totallineitemdiscountamountbase] [numeric](18, 0) NULL,
	[Totaltax] [numeric](18, 0) NULL,
	[Totaltaxbase] [numeric](18, 0) NULL,
	[Willcall] [nvarchar](max) NULL,
	[Invoicedate] [nvarchar](max) NULL,
	[TermCode] [nvarchar](max) NULL,
	[BillStatus] [numeric](18, 0) NULL,
	[Ismarkaspaid] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[ClientId] [numeric](18, 0) NULL,
	[PaidOn] [datetime] NULL,
	[Paymentterms] [numeric](18, 0) NULL,
	[Referanceorder] [nvarchar](max) NULL,
	[Paymenttype] [numeric](18, 0) NULL,
	[Subtotal] [numeric](18, 2) NULL,
	[Discount] [numeric](18, 2) NULL,
	[ShippingCharge] [numeric](18, 2) NULL,
	[Tax] [numeric](18, 2) NULL,
	[TotamAmount] [numeric](18, 2) NULL,
	[DiscountType] [nvarchar](max) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[Updatedon] [datetime] NULL,
	[IsRecurring] [int] NULL,
	[RecurringStartDate] [datetime] NULL,
	[RecurrinEendtDate] [datetime] NULL,
	[Frequency] [nvarchar](100) NULL,
	[RecurringLastdate] [datetime] NULL,
	[MasterInvoice] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_InvoiceEmailTemplate]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InvoiceEmailTemplate](
	[TemplateID] [bigint] IDENTITY(2000,1) NOT NULL,
	[Sunject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_InvoiceOrder]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_InvoiceOrder](
	[Invoiceorderid] [bigint] IDENTITY(1,1) NOT NULL,
	[actualDeliveryOn] [datetime] NULL,
	[baseAmount] [numeric](18, 2) NULL,
	[transactionCurrencyId] [nvarchar](max) NULL,
	[exchangeRate] [numeric](18, 2) NULL,
	[baseAmountBase] [numeric](18, 2) NULL,
	[description] [nvarchar](max) NULL,
	[extendedAmount] [numeric](18, 2) NULL,
	[extendedAmountBase] [numeric](18, 2) NULL,
	[invoiceId] [numeric](18, 0) NULL,
	[invoiceIsPriceLocked] [numeric](18, 0) NULL,
	[invoiceStateCode] [nvarchar](max) NULL,
	[isCopied] [nvarchar](max) NULL,
	[isPriceOverridden] [numeric](18, 0) NULL,
	[isProductOverridden] [numeric](18, 0) NULL,
	[lineItemNumber] [nvarchar](max) NULL,
	[manualDiscountAmount] [numeric](18, 0) NULL,
	[manualDiscountAmountBase] [numeric](18, 0) NULL,
	[parentBundleId] [numeric](18, 0) NULL,
	[productAssociationId] [numeric](18, 0) NULL,
	[productTypeCode] [nvarchar](max) NULL,
	[pricePerUnit] [numeric](18, 0) NULL,
	[pricePerUnitBase] [numeric](18, 0) NULL,
	[pricingErrorCode] [nvarchar](max) NULL,
	[productDescription] [nvarchar](max) NULL,
	[productName] [nvarchar](max) NULL,
	[productId] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 0) NULL,
	[quantityBackordered] [nvarchar](max) NULL,
	[quantityCancelled] [nvarchar](max) NULL,
	[quantityShipped] [nvarchar](max) NULL,
	[salesRepId] [numeric](18, 0) NULL,
	[shippingTrackingNumber] [nvarchar](max) NULL,
	[shipToAddressId] [nvarchar](max) NULL,
	[shipToFreightTermsCode] [nvarchar](max) NULL,
	[tax] [numeric](18, 5) NULL,
	[taxBase] [numeric](18, 5) NULL,
	[uoMId] [nvarchar](max) NULL,
	[volumeDiscountAmount] [numeric](18, 2) NULL,
	[volumeDiscountAmountBase] [numeric](18, 2) NULL,
	[willCall] [nvarchar](max) NULL,
	[sequenceNumber] [nvarchar](max) NULL,
	[invoiceDetailName] [nvarchar](max) NULL,
	[salesOrderDetailId] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Invoiceorderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_InvoiceTimeline]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_InvoiceTimeline](
	[TimelineId] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](200) NULL,
	[date] [datetime] NULL,
	[Invoiceno] [nvarchar](200) NULL,
	[Invoiceid] [numeric](18, 0) NULL,
	[AccountId] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[TimelineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_LoginAudit]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_LoginAudit](
	[Id] [numeric](18, 0) IDENTITY(6000,1) NOT NULL,
	[LoginName] [nvarchar](max) NULL,
	[LoginTime] [datetime] NULL,
	[Status] [nvarchar](max) NULL,
	[IpAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_LoginAudit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Offline_Payment]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Offline_Payment](
	[OFLINE_ID] [int] IDENTITY(1,1) NOT NULL,
	[OF_CUST_ID] [numeric](18, 0) NULL,
	[OF_CUST_NAME] [nvarchar](max) NULL,
	[OF_INVOICE_NO] [nvarchar](500) NULL,
	[OF_INVOICE_DATE] [datetime] NULL,
	[OF_INVOICE_AMOUNT] [numeric](18, 2) NULL,
	[OF_PAID_DATE] [datetime] NULL,
	[OF_PAID_AMT] [numeric](18, 2) NULL,
	[OF_BALANCE_AMT] [numeric](18, 2) NULL,
	[OF_PAY_TYPE] [varchar](15) NULL,
	[OF_CREATED_BY] [numeric](18, 0) NULL,
	[OF_CREATED_DATE] [datetime] NULL,
	[OF_UPDATED_BY] [numeric](18, 0) NULL,
	[OF_UPDATEDON_DATE] [datetime] NULL,
	[OF_CLIEND_ID] [numeric](18, 0) NULL,
	[OF_INVOICE_ID] [numeric](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[OFLINE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Order]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Order](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](max) NULL,
	[Billtoaddressid] [nvarchar](max) NULL,
	[Customerid] [numeric](18, 0) NULL,
	[Customeridtype] [nvarchar](max) NULL,
	[Datefulfilled] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Discountamount] [numeric](18, 0) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Discountamountbase] [numeric](18, 0) NULL,
	[Discountpercentage] [numeric](18, 0) NULL,
	[Freightamount] [numeric](18, 0) NULL,
	[Freightamountbase] [numeric](18, 0) NULL,
	[Freighttermscode] [nvarchar](max) NULL,
	[Ispricelocked] [nvarchar](max) NULL,
	[Lastbackofficesubmit] [nvarchar](max) NULL,
	[Opportunityid] [numeric](18, 0) NULL,
	[Ordernumber] [nvarchar](max) NULL,
	[Paymenttermscode] [nvarchar](max) NULL,
	[PaymenttermscodeDisplay] [nvarchar](max) NULL,
	[Pricelevelid] [nvarchar](max) NULL,
	[Pricingerrorcode] [nvarchar](max) NULL,
	[Prioritycode] [nvarchar](max) NULL,
	[Quoteid] [numeric](18, 0) NULL,
	[Requestdeliveryby] [nvarchar](max) NULL,
	[Shippingmethodcode] [nvarchar](max) NULL,
	[ShippingmethodcodeDisplay] [nvarchar](max) NULL,
	[Shiptoaddressid] [nvarchar](max) NULL,
	[Statecode] [nvarchar](max) NULL,
	[Statuscode] [nvarchar](max) NULL,
	[Submitdate] [datetime] NULL,
	[Submitstatus] [nvarchar](max) NULL,
	[Submitstatusdescription] [nvarchar](max) NULL,
	[Totalamount] [numeric](18, 0) NULL,
	[Totalamountbase] [numeric](18, 0) NULL,
	[Totalamountlessfreight] [numeric](18, 0) NULL,
	[Totalamountlessfreightbase] [numeric](18, 2) NULL,
	[Totaldiscountamount] [numeric](18, 0) NULL,
	[Totaldiscountamountbase] [numeric](18, 0) NULL,
	[Totallineitemamount] [numeric](18, 0) NULL,
	[Totallineitemamountbase] [numeric](18, 0) NULL,
	[Totallineitemdiscountamount] [numeric](18, 0) NULL,
	[Totallineitemdiscountamountbase] [numeric](18, 0) NULL,
	[Totaltax] [numeric](18, 0) NULL,
	[Totaltaxbase] [numeric](18, 0) NULL,
	[Willcall] [nvarchar](max) NULL,
	[Salesrepid] [numeric](18, 0) NULL,
	[Pricingdate] [datetime] NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL,
	[PushToDenali] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderInvoice]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderInvoice](
	[OrderInvoice] [bigint] IDENTITY(1,1) NOT NULL,
	[Lineitemnno] [nvarchar](max) NULL,
	[InvID] [nvarchar](max) NULL,
	[OrderId] [nvarchar](max) NULL,
	[Amount] [numeric](18, 5) NULL,
	[Discount] [numeric](18, 2) NULL,
	[ClientId] [numeric](18, 0) NULL,
	[BillStatus] [numeric](18, 0) NULL,
	[Product] [numeric](18, 0) NULL,
	[quantity] [numeric](18, 2) NULL,
	[Price] [numeric](18, 5) NULL,
	[Tax] [numeric](18, 5) NULL,
	[Discounttype] [nvarchar](max) NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderInvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderProduct]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderProduct](
	[OrderProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[Baseamount] [numeric](18, 0) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Baseamountbase] [numeric](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[Extendedamount] [numeric](18, 0) NULL,
	[Extendedamountbase] [numeric](18, 0) NULL,
	[Iscopied] [nvarchar](max) NULL,
	[Ispriceoverridden] [nvarchar](max) NULL,
	[Isproductoverridden] [nvarchar](max) NULL,
	[Lineitemnumber] [nvarchar](max) NULL,
	[Manualdiscountamount] [numeric](18, 0) NULL,
	[Manualdiscountamountbase] [numeric](18, 0) NULL,
	[Parentbundleid] [numeric](18, 0) NULL,
	[Productassociationid] [numeric](18, 0) NULL,
	[Producttypecode] [nvarchar](max) NULL,
	[Priceperunit] [nvarchar](max) NULL,
	[Priceperunitbase] [nvarchar](max) NULL,
	[Pricingerrorcode] [nvarchar](max) NULL,
	[Productdescription] [nvarchar](max) NULL,
	[Productname] [nvarchar](max) NULL,
	[Productid] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[Quantitybackordered] [numeric](18, 0) NULL,
	[Quantitycancelled] [numeric](18, 0) NULL,
	[Quantityshipped] [numeric](18, 0) NULL,
	[Requestdeliveryby] [nvarchar](max) NULL,
	[Orderid] [numeric](18, 0) NULL,
	[Salesorderispricelocked] [nvarchar](max) NULL,
	[Salesorderstatecode] [nvarchar](max) NULL,
	[Salesrepid] [numeric](18, 0) NULL,
	[Shiptoaddressid] [nvarchar](max) NULL,
	[Tax] [numeric](18, 0) NULL,
	[Taxbase] [numeric](18, 0) NULL,
	[Uomid] [numeric](18, 0) NULL,
	[Volumediscountamount] [numeric](18, 0) NULL,
	[Volumediscountamountbase] [numeric](18, 0) NULL,
	[Willcall] [nvarchar](max) NULL,
	[Sequencenumber] [nvarchar](max) NULL,
	[Quotedetailid] [nvarchar](max) NULL,
	[Salesorderdetailname] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Vendorid] [numeric](18, 0) NULL,
	[Validfromdate] [datetime] NULL,
	[Validtodate] [datetime] NULL,
	[Currentcost] [nvarchar](max) NULL,
	[Transactioncurrencyid] [nvarchar](max) NULL,
	[Exchangerate] [numeric](18, 0) NULL,
	[Currentcostbase] [nvarchar](max) NULL,
	[Defaultuomid] [numeric](18, 0) NULL,
	[Defaultuomscheduleid] [numeric](18, 0) NULL,
	[Description] [nvarchar](max) NULL,
	[Iskit] [nvarchar](max) NULL,
	[Isstockitem] [nvarchar](max) NULL,
	[Parentproductid] [numeric](18, 0) NULL,
	[Price] [numeric](18, 0) NULL,
	[Pricebase] [numeric](18, 0) NULL,
	[Productstructure] [nvarchar](max) NULL,
	[ProductstructureDisplay] [nvarchar](max) NULL,
	[Productnumber] [nvarchar](max) NULL,
	[Producttypecode] [nvarchar](max) NULL,
	[ProducttypecodeDisplay] [nvarchar](max) NULL,
	[Producturl] [nvarchar](max) NULL,
	[Quantitydecimal] [nvarchar](max) NULL,
	[Quantityonhand] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Standardcost] [numeric](18, 0) NULL,
	[Standardcostbase] [numeric](18, 0) NULL,
	[Statecode] [nvarchar](max) NULL,
	[Statuscode] [nvarchar](max) NULL,
	[Stockvolume] [nvarchar](max) NULL,
	[Stockweight] [numeric](18, 0) NULL,
	[Suppliername] [nvarchar](max) NULL,
	[Vendorpartnumber] [nvarchar](30) NULL,
	[Hierarchypath] [nvarchar](max) NULL,
	[Pricelistid] [numeric](18, 0) NULL,
	[SKUCode] [nvarchar](max) NULL,
	[ProductCategory] [nvarchar](max) NULL,
	[ProductSubcategory] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
	[WholesaleCost] [numeric](18, 2) NULL,
	[PurchaseCost] [numeric](18, 2) NULL,
	[ProfitMargin] [numeric](18, 2) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL,
	[PushToDenali] [numeric](18, 0) NULL,
	[clientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK__Tbl_Prod__B40CC6ED673BD948] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Projects]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Projects](
	[ProjectID] [numeric](18, 0) IDENTITY(8500,1) NOT NULL,
	[ProjectName] [nvarchar](max) NULL,
	[Customer] [nvarchar](max) NULL,
	[ProjectDescription] [nvarchar](max) NULL,
	[ProjectType] [nvarchar](max) NULL,
	[ProjectStatus] [nvarchar](max) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Recurrence]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Recurrence](
	[RecurrenceId] [numeric](18, 0) IDENTITY(6000,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Frequency] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_Recurrence] PRIMARY KEY CLUSTERED 
(
	[RecurrenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SubCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SubCategory](
	[SubCategoryID] [numeric](18, 0) IDENTITY(6800,1) NOT NULL,
	[SubCategory] [nvarchar](max) NULL,
	[CategoryID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Subcription]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Subcription](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[PayloadURL] [nvarchar](max) NULL,
	[Secret] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Subcription] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Subcription_Header]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Subcription_Header](
	[SubID] [numeric](18, 0) NULL,
	[key] [nvarchar](max) NULL,
	[value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Vendor]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Vendor](
	[VendorID] [numeric](18, 0) IDENTITY(5000,1) NOT NULL,
	[VendorName] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[IsActive] [numeric](18, 0) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[SSNNumber] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[WebsiteURL] [nvarchar](max) NULL,
	[ReferenceID] [nvarchar](max) NULL,
	[VendorType] [numeric](18, 0) NULL,
	[PrefferedPaymentMethod] [numeric](18, 0) NULL,
	[TaxId] [nvarchar](max) NULL,
	[PaymentTerm] [numeric](18, 0) NULL,
	[LeadTimeDays] [nvarchar](max) NULL,
	[VendorLogo] [nvarchar](max) NULL,
	[PaypalEmailAddress] [nvarchar](max) NULL,
	[PaypalMobileNumber] [nvarchar](max) NULL,
	[GLCode] [nvarchar](max) NULL,
	[ExternalNumber] [nvarchar](max) NULL,
	[ExternalNewReferenceNumber] [nvarchar](max) NULL,
	[ExternalMergingReferenceNumber] [nvarchar](max) NULL,
	[PushToDenali] [numeric](18, 0) NULL,
	[IsAddedToDwolla] [numeric](18, 0) NULL,
	[DwollaCustomerID] [nvarchar](max) NULL,
	[DwollaFundID] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_VendorBankAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_VendorBankAccount](
	[IdentityID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[VendorID] [numeric](18, 0) NULL,
	[AccountHolderName] [nvarchar](max) NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[RoutingNumber] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Tbl_VendorBankAccount] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_VendorDocuments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_VendorDocuments](
	[VendorDocumentID] [numeric](18, 0) IDENTITY(900,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[VendorID] [numeric](18, 0) NULL,
	[FileName] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[LastModifiedBy] [nvarchar](max) NULL,
	[ModifiedFileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_VendorDocuments] PRIMARY KEY CLUSTERED 
(
	[VendorDocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_VendorNotes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_VendorNotes](
	[VendorNotesID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ClientID] [numeric](18, 0) NULL,
	[VendorID] [numeric](18, 0) NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_VendorNotes] PRIMARY KEY CLUSTERED 
(
	[VendorNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_WebhookEvent]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_WebhookEvent](
	[WebhookEventID] [int] IDENTITY(1,1) NOT NULL,
	[WebhookEventName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_WebhookEvent] PRIMARY KEY CLUSTERED 
(
	[WebhookEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Users_SID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[GroupName] [nvarchar](max) NULL,
	[SecurityQuestion] [nvarchar](max) NULL,
	[SecurityAnswer] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Designation] [nvarchar](50) NULL,
	[ImageUrl] [varbinary](max) NULL,
	[image] [nvarchar](max) NULL,
	[GroupID] [int] NULL,
	[ShortName] [nvarchar](max) NULL,
	[DepartmentJobTitleID] [numeric](18, 0) NULL,
 CONSTRAINT [PK_IAK_USERS] PRIMARY KEY CLUSTERED 
(
	[Users_SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorContact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorContact](
	[ContactIdentityId] [numeric](18, 0) IDENTITY(800,1) NOT NULL,
	[VendorID] [numeric](18, 0) NULL,
	[ClientID] [numeric](18, 0) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [numeric](18, 0) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [numeric](18, 0) NULL,
 CONSTRAINT [PK_VendorContact] PRIMARY KEY CLUSTERED 
(
	[ContactIdentityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_APAgingDerailedReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[View_APAgingDerailedReport]
AS

SELECT V.VendorName,B.BillDate,B.InvoiceNumber,K.Value1 [PaymentTerms],BA.DueOn,BA.PayableAmount AS Balance,
DATEDIFF(DAY, BA.DueOn, GETDATE()) AS Agingday,BA.VendorID,BA.ClientID,K.Keylistid [PaymentTermsID],PS.KeyListID
, PS.Value1,BA.PaymentStatus,B.BillID
FROM [Tbl_BillApproved] BA
JOIN Tbl_Vendor V ON BA.VendorID=V.VendorID
JOIN TBL_BILL B ON  B.BillID=BA.BillID
JOIN KeyList K ON K.Keylistid=B.PaymentTerms
JOIN KeyList PS ON PS.Keylistid=BA.PaymentStatus

WHERE BA.PaymentStatus<>50044 AND BA.PaymentStatus<>50036 AND BA.PaymentStatus<>50025 and BA.PaymentStatus<>50033
  
GO
/****** Object:  View [dbo].[View_APAgingSummaryReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_APAgingSummaryReport]
AS

SELECT DISTINCT V.VendorName,V.VendorID,SUM(BA.PayableAmount) AS [1-30DAYS],'0' AS [31-60DAYS],'0' AS [61-90DAYS]
,'0' AS [>90DAYS],V.ClientID,SUM(BA.PayableAmount) AS Totalamt
FROM  [Tbl_BillApproved] BA				
RIGHT JOIN Tbl_vendor V ON BA.VendorID=V.VendorID
WHERE DATEDIFF(DAY,BA.DueOn, CURRENT_TIMESTAMP) BETWEEN 1 AND 30 AND BA.PaymentStatus<>50033 AND BA.PaymentStatus<>50044
GROUP BY V.VendorName,V.VendorID,V.ClientID

UNION 
SELECT DISTINCT V.VendorName,V.VendorID,'0' AS [1-30DAYS], SUM(BA.PayableAmount) AS [31-60DAYS],'0' AS [61-90DAYS]
,'0' AS [>90DAYS],V.ClientID,SUM(BA.PayableAmount) AS Totalamt
FROM  [Tbl_BillApproved] BA
RIGHT JOIN Tbl_vendor V ON BA.VendorID=V.VendorID
WHERE DATEDIFF(DAY,BA.DueOn, CURRENT_TIMESTAMP) BETWEEN 31 AND 60 AND BA.PaymentStatus<>50033 AND BA.PaymentStatus<>50044
GROUP BY V.VendorName,V.VendorID,V.ClientID

UNION 
SELECT DISTINCT V.VendorName,V.VendorID,'0' AS [1-30DAYS], '0' AS [31-60DAYS],SUM(BA.PayableAmount) AS [61-90DAYS]
,'0' AS [>90DAYS],V.ClientID,SUM(BA.PayableAmount) AS Totalamt
FROM  [Tbl_BillApproved] BA
RIGHT JOIN Tbl_vendor V ON BA.VendorID=V.VendorID
WHERE DATEDIFF(DAY,BA.DueOn, CURRENT_TIMESTAMP) BETWEEN 61 AND 90 AND BA.PaymentStatus<>50033 AND BA.PaymentStatus<>50044
GROUP BY V.VendorName,V.VendorID,V.ClientID
UNION 
SELECT DISTINCT V.VendorName,V.VendorID,'0' AS [1-30DAYS], '0' AS [31-60DAYS],'0' AS [61-90DAYS]
,SUM(BA.PayableAmount) AS [>90DAYS],V.ClientID,SUM(BA.PayableAmount) AS Totalamt
FROM  [Tbl_BillApproved] BA
RIGHT JOIN Tbl_vendor V ON BA.VendorID=V.VendorID
WHERE DATEDIFF(DAY,BA.DueOn, CURRENT_TIMESTAMP) >91 AND BA.PaymentStatus<>50033 AND BA.PaymentStatus<>50044
GROUP BY V.VendorName,V.VendorID,V.ClientID
  
GO
/****** Object:  View [dbo].[View_ApproverBillRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ApproverBillRead]
AS

  SELECT distinct  A.[BillID]    
      ,A.[VendorID]    
      ,A.[AccountID]    
      ,A.[BillDate]    
      ,A.[Amount]    
      ,A.[InvoiceNumber]    
      ,A.[DueDate]    
	  ,Convert(date,A.[DueDate],101) AS DueOn
      ,A.[Category]    
      ,A.[Notes]    
      ,A.[PaymentTerms]    
      ,A.[Description]    
      ,A.[Status]      
      ,A.[Balance]    
      ,A.[FileDisplayName]    
      ,A.[PhysicalLocation]    
      ,A.[FileSize]    
      ,A.[FileName]    
      ,B.ApproverID    
      ,B.CurrentStageApproval    
      ,B.StageInitiated,    
      C.Value1 AS 'StatusName' 
      ,Case  
	  WHEN A.Status IN ('50017','50015','50016','50034') Then 'Approvals' 
	  WHEN A.Status IN ('50036','50018','50044')  Then 'Payments'
      END AS 'StageName' 
     ,D.VendorName     
  -- ,F.ApprovedAmount  ,
     ,(ISNULL(A.Amount,0)-ISNULL(A.Balance,0)) AS 'ApprovedAmount'
     ,A.ClientID,
	 G.Value1 AS 'PaymentMode'
	 ,IsSplitted
  FROM [Tbl_Bill] AS A    
  INNER JOIN BillStageApproval AS B    
  ON A.BillID=B.BillID    
  LEFT JOIN KeyList AS C    
  ON C.KeyListID=A.Status    
  LEFT JOIN Tbl_Vendor AS D    
  ON D.VendorID=A.VendorID        
  LEFT JOIN Tbl_BillApproved As F    
  ON A.BillID=F.BillID    
  LEFT JOIN KeyList AS G
  ON F.PaymentMode=G.KeylistID AND G.Keyid=5021
  
  WHERE   A.Status !=50019 AND  B.StageInitiated=1  
  

  
GO
/****** Object:  View [dbo].[View_Auditlog]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Auditlog]
AS

SELECT FORMAT([TimeStamp],'MM/dd/yyyy hh:mm:s tt') AS [TimeStamp],Activity,[Description],
CONCAT(FirstName, ' ', LastName) AS [User],SystemIp,AD.ClientId,AD.UserId,Logid,ScreenName,[TimeStamp] AS [DATE]
FROM TBL_AUDITLOG AD JOIN 
Tbl_Accounts A ON AccountID=UserId
  
GO
/****** Object:  View [dbo].[View_BillCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_BillCategory]
AS

SELECT A.[BillCategoryId]
      ,A.[BillCategory]
      ,A.[Description]
      ,A.[Status]
      ,A.[CreatedBy]
      ,A.[CreatedOn]
      ,A.[UpdatedBy]
      ,A.[UpdatedOn]
	  ,B.Value1 AS 'StrStatus',
	  A.[ClientID]
  FROM [Tbl_BillCategory] AS A
  LEFT JOIN KeyList AS B
  ON A.Status =B.KeyListId AND KeyId=5022
GO
/****** Object:  View [dbo].[View_BillDueBasedReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[View_BillDueBasedReport]
AS
SELECT 
V.VendorName,B.InvoiceNumber,B.BillDate AS InvoiceDate,
BA.DueOn AS  DueDate,

--DATEDIFF(DAY,B.BillDate,BA.DueOn) AS Duedays,
CASE WHEN DATEDIFF(DAY,DueOn,getdate()) > 0 THEN 0 ELSE DATEDIFF(DAY,B.BillDate,BA.DueOn) END AS Duedays,


CASE WHEN DATEDIFF(DAY,DueOn,getdate()) > 0 THEN DATEDIFF(DAY,DueOn,getdate()) ELSE 0 END AS OverDuedays,
K.Value1 AS ApprovalStatus,'Unpaid' Paymentstatus,
ApprovedAmount AS Amount,BA.VendorID,BA.[Status],BA.PaymentStatus AS PaymentStatusId,
BA.ClientID--,K.keylistid [Statusid],PS.keylistid [PaymentStatusID]

FROM  [Tbl_BillApproved] BA
JOIN Tbl_vendor V ON BA.VendorID=V.VendorID
JOIN Tbl_Bill B ON B.BillID=BA.BillID
JOIN keylist K ON K.keylistid=BA.[STATUS] 
JOIN keylist PS ON BA.PaymentStatus=PS.keylistid
WHERE BA.[Status] IN (50015,50016)
  
  

  
GO
/****** Object:  View [dbo].[View_BillRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE View [dbo].[View_BillRead]
AS

--Select  A.[BillID]    
--        ,A.[VendorID]    
--        ,A.[AccountID]    
--        ,A.[BillDate]    
--        ,A.[Amount]    
--        ,A.[InvoiceNumber]    
--        ,A.[DueDate]
--		,Convert(date,A.[DueDate],101) AS DueOn
--        ,A.[Category]    
--        ,A.[Notes]    
--        ,A.[PaymentTerms]    
--        ,A.[Description]    
--        ,A.[IsSplitted]    
--        ,Case  
--         WHEN A.Status=50019 Then 'Draft' 
--		 WHEN A.Status IN ('50017','50015','50016','50034') Then 'Approvals' 
--		 WHEN A.Status IN ('50036','50018','50044')  Then 'Payments'
--         END AS 'StageName'  
--        ,A.[Status]    
--        ,A.[CreatedOn]    
--        ,A.CreatedBy    
--        ,B.[Value1] AS StatusName,    
--        A.[IsRecurring],    
--        C.[VendorName]    
--        from [dbo].[Tbl_Bill] AS A    
--        LEFT JOIN KeyList AS B    
--        ON A.Status=B.KeyListID AND B.KeyID=5005    
--        LEFT JOIN [dbo].[Tbl_Vendor] AS C    
--        ON A.VendorID=C.[VendorID]   
	 
	     SELECT
		 DISTINCT(B.BillID),
         SQ.InvoiceNumber
		 ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber AND BillID !=B.BillID Order by DueDate ASC) As NextDueDate
        ,C.Value1  AS StatusName
        ,D.[VendorName]
        ,B.[VendorID]    
        ,B.[AccountID]    
        ,B.[BillDate]    
        ,B.[Amount]    
        ,B.[DueDate]
		,Convert(date,B.[DueDate],101) AS DueOn
        ,B.[Category]    
        ,B.[Notes]    
        ,B.[PaymentTerms]    
        ,B.[Description]    
        ,B.[IsSplitted]    
        ,Case  
         WHEN B.Status=50019 Then 'Draft' 
		 WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals' 
		 WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'
         END AS 'StageName'  
        ,B.[Status]    
        ,B.[CreatedOn]    
        ,B.CreatedBy 
		--,B.[BillID]   
		,B.IsRecurring
		,F.Value1 AS 'PaymentMode'
		,(SELECT TOP(1) CurrentStageApproval FROM BillStageApproval Where BillID=B.BillID) AS 'ApprovalStage'
        from tbl_bill B join 
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber ) 
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status
        LEFT JOIN KeyList AS C   
        ON B.Status=C.KeyListID AND c.KeyID=5005    
        LEFT JOIN [dbo].[Tbl_Vendor] AS D
	    ON B.VendorID=D.[VendorID]
		LEFT JOIN TBL_BillApproved AS E
		ON B.BillID=E.BillID
		LEFT JOIN KeyList AS F
		ON E.PaymentMode=F.KeylistID AND F.Keyid=5021

    
GO
/****** Object:  View [dbo].[View_Customers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[View_Customers]
AS
SELECT DISTINCT( A.[CustomerID])
      ,A.[CustomerName]
      ,A.[CutomerType]
      ,A.[Email]
      ,A.[ContactNumber]
      ,A.[CustomerAddress]
      ,A.[City]
      ,A.[State]
      ,A.[Zip]
      ,A.[CustomerLogo]
      ,A.[ClientID]
      ,A.[CreatedOn]
      ,A.[CreatedBy]
      ,A.[UpdatedOn]
      ,A.[UpdatedBy]
	  ,B.Value1 AS StrCutomerType
	  ,(SELECT COUNT(ProjectID) FROM TBl_Projects Where Customer=A.CustomerID) AS 'AssociatedProjects'
	  ,SUM(C.Amount) AS 'Expenses'
	  ,(SELECT Count(BillID) FROM Tbl_Bill Where [Customer]=A.CustomerID ) AS 'AssociatedBills'
	  ,(SELECT Count(BillID) FROM Tbl_Bill Where [Customer]=A.CustomerID AND Status in 
	  ('50015','50017','50018','50034','50036' ,'50044' ,'50087' ,'50087' ,'50089' ,'50090') ) AS 'AssociatedCounts'
  FROM  [Tbl_Customers] AS A
  LEFT JOIN KeyList AS B
  ON A.CutomerType=B.KeylistID AND B.KeyId=5023
  LEFT JOIN Tbl_Bill AS C
  ON A.CustomerID=C.[Customer] --AND C.Status=50015
  LEFT JOIN TBl_BillApproved AS D
  ON C.BillID=D.BillID
  GROUP BY A.[CustomerName]
      ,A.[CutomerType]
      ,A.[Email]
      ,A.[ContactNumber]
      ,A.[CustomerAddress]
      ,A.[City]
      ,A.[State]
      ,A.[Zip]
      ,A.[CustomerLogo]
      ,A.[ClientID]
      ,A.[CreatedOn]
      ,A.[CreatedBy]
      ,A.[UpdatedOn]
      ,A.[UpdatedBy]
	   ,B.Value1
	   ,A.[CustomerID]



  --SELECT * FROM Tbl_BillApproved























  
GO
/****** Object:  View [dbo].[View_ExportBillRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_ExportBillRead]
AS
 SELECT 
             A.[IdentityID]  
               ,A.[BillID]  
               ,A.[ApprovedAmount]  
               ,A.[Status]  
               ,A.[PaymentStatus] 
			 --  ,A.[DueOn]
			   ,Convert(varchar,C.[DueDate],101) AS 'DueOn'
               --,Convert(varchar,A.[DueOn],101)   AS 'DueOn'
               ,A.[VendorID]  
      ,B.[VendorName]  
      ,C.Description  
      ,C.InvoiceNumber  
	  ,B.ClientID
	  ,D.Value1 AS 'PaymentMode' 
      FROM TBl_BillApproved AS A  
      LEFT JOIN Tbl_Vendor AS B  
      ON A.VendorID=B.VendorID  
      LEFT JOIN Tbl_Bill As C  
      ON A.BillID =C.BillID 
	  LEFT JOIN KeyList AS D
	  ON A.PaymentMode=D.KeylistID AND D.Keyid=5021
	 -- WHERE B.ClientID=2000
	 
GO
/****** Object:  View [dbo].[View_GlCodeRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[View_GlCodeRead]
As
SELECT   
      A.[IdentityID]  
      ,A.[ClientID]  
      ,A.[GLNumber]  
      ,A.[GLDescription]  
      ,A.[RowStatus]  
      ,A.[CreatedBy]  
      ,A.[CreatedOn]  
      ,(coalesce(B.FirstName,'')+' '+coalesce(B.LastName,'')) AS 'CreatedByName'  
	  ,C.BillCategory AS 'StrCategory',
	  D.SubCategory AS 'StrSubCategory'
      FROM [Tbl_GlCodes] As A  
      LEFT JOIN Tbl_Accounts AS B  
      ON A.CreatedBy = B.AccountID  
	  LEFT JOIN Tbl_BillCategory AS C
	  ON A.Category=C.BillCategoryID
	  LEFT JOIN Tbl_SubCategory AS D
	  ON A.SubCategory=D.SubCategoryID
 
GO
/****** Object:  View [dbo].[View_InvoiceCustomer]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_InvoiceCustomer]
as
 WITH CTE
AS
(
   SELECT  InvID,SUM(Amount) AS Dueamountt, I.TotamAmount AS Dueamount,SUM(O.Discount) AS Discount,I.InvoiceId,O.ClientId
,I.Customerid,[Description],Invoicedate,K.value2,I.BillStatus,
CASE WHEN I.BillStatus=1 THEN 'Released Invoice' when I.BillStatus=2 then 'Paid Invoice' else 'Unsubmitted Invoice' END AS [Status],
DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate],
C.CustomerName ,I.TermCode,I.PaidOn

from Tbl_OrderInvoice O
JOIN Tbl_Invoice I ON InvID=InvoiceName AND O.ClientId=I.ClientId
JOIN Tbl_Customers C ON C.CustomerID=I.Customerid
JOIN keylist K ON K.[Value1]=I.TermCode
group by InvID,I.Customerid,[Description],Invoicedate,C.CustomerName,I.InvoiceId,
I.TermCode,I.BillStatus,K.Value2,O.ClientId,I.BillStatus,I.PaidOn,I.TotamAmount
)
 
 select DISTINCT C.CustomerName 
 ,( SELECT Top(1) CONVERT(VARCHAR, Duedate,101) AS Due From CTE Where  Customerid=C.CustomerID AND BillStatus<>2   ORDER BY Duedate ASC) AS 'NextDueDate'
 ,( SELECT Top(1) Dueamount From CTE Where Customerid=C.CustomerID AND BillStatus<>2 ORDER BY Duedate ASC) AS 'NextDueAmount'
 ,(SELECT COUNT(ProjectID) FROM TBl_Projects Where Customer=C.CustomerID) AS 'AssociatedProjects'
 ,(SELECT Count(BillID) FROM Tbl_Bill Where [Customer]=C.CustomerID ) AS 'AssociatedBills'
 ,(SELECT Count(BillID) FROM Tbl_Bill Where [Customer]=C.CustomerID AND Status in 
	  ('50015','50017','50018','50034','50036' ,'50044' ,'50087' ,'50087' ,'50089' ,'50090') ) AS 'AssociatedCounts'
,( SELECT Top(1) PaidOn From CTE Where Customerid=C.CustomerID ORDER BY PaidOn desc) AS 'LastPayment'
 ,(SELECT SUM(Amount) FROM TBL_INVOICE JOIN Tbl_orderinvoice on InvoiceName=InvID where Customerid=C.Customerid) AS 'Totalamtreceved'
 ,(SELECT SUM(Amount) FROM TBL_INVOICE I JOIN Tbl_orderinvoice O on InvoiceName=InvID where Customerid=C.Customerid AND I.BillStatus<>2) AS 'Balance'
 ,(SELECT Count(InvID) FROM CTE Where Customerid=C.CustomerID ) AS 'AssociatedInvoice'
 ,C.Customerid,C.ClientId
 FROM Tbl_Customers C
 LEFT JOIN CTE E ON C.CustomerID=E.Customerid
GO
/****** Object:  View [dbo].[View_InvoiceList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[View_InvoiceList]
AS

SELECT I.InvoiceName as InvID,SUM(Amount) AS Dueamountt,SUM(O.Discount) AS Discount,I.InvoiceId,I.ClientId as ClientId
,I.Customerid,[Description],Invoicedate,K.value2,I.BillStatus,I.TotamAmount AS Dueamount,
CASE WHEN I.BillStatus=1 THEN 'Released Invoice' when I.BillStatus=2 then 'Paid Invoice'
when I.BillStatus=3 then 'Partially Paid'  when I.BillStatus=5 then 'Canceled'
else 'Unsubmitted Invoice' END AS [Status],
DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate],
C.CustomerName ,I.TermCode,I.MasterInvoice
from Tbl_Invoice I
left JOIN  Tbl_OrderInvoice O ON InvID=InvoiceName AND O.ClientId=I.ClientId
JOIN Tbl_Customers C ON C.CustomerID=I.Customerid
JOIN keylist K ON K.[Value1]=I.TermCode
group by InvID,I.Customerid,[Description],Invoicedate,C.CustomerName,I.InvoiceId,
I.TermCode,I.BillStatus,K.Value2,O.ClientId,I.BillStatus,I.TotamAmount,I.InvoiceName
,I.ClientId,I.MasterInvoice

GO
/****** Object:  View [dbo].[View_PayerBillRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[View_PayerBillRead]
AS

   select 
           A.[IdentityID],    
           A.[BillID],    
           A.[ApprovedAmount],    
           A.[Status],    
           A.[PayableAmount], 
		   Convert(date,B.[DueDate],101) AS 'DueOn', 
		   Convert(date,A.[PaidOn],101) AS 'PaidDate', 
           A.[PaidOn],    
           A.[VendorID],    
           A.[PaymentStatus],    
           B.Description,    
           B.PurchaseOrder,    
           B.InvoiceNumber,    
           B.IsRecurring,    
           C.VendorName,   
		   'Payments' AS 'StageName', 
		   B.ClientID,
           D.Value1 AS PaymentStatusName  
		   ,E.Value1 AS 'PaymentMode'
		  , Convert(date,B.[CreatedOn],101) AS 'CreatedOn'
		  ,IsSplitted
          from Tbl_BillApproved as A    
          left join Tbl_Bill As B    
          On A.BillID=B.BillID    
          left join Tbl_Vendor As C    
          On A.VendorID=C.VendorID    
          left join KeyList AS D    
          On A.PaymentStatus=D.KeyListID 
		  left join Keylist AS E
		  ON A.PaymentMode =E.Keylistid AND E.Keyid=5021
         
GO
/****** Object:  View [dbo].[View_PaymentStatusReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[View_PaymentStatusReport]
AS
SELECT
BA.BillID,
V.VendorID,
V.VendorName,
B.InvoiceNumber [BillNo],
BA.PayableAmount [TotalBillableAmount],
BA.AmountPaid [TotalPaid],
B.Balance,
BA.BankTransferID [TransactionId],
'' [Fee],
A.FirstName [PaidBy],
A.AccountID,
BA.PaidOn [PaidOn],
PM.Value1 [PaymentMode],
BA.PaymentMode [PaymentModeID],
BA.PaymentStatus,
K.Value1 [Status],
BA.ClientID,
BA.DueOn

FROM Tbl_Bill B
JOIN TBL_VENDOR V ON B.VendorID=V.VendorID
JOIN [Tbl_BillApproved] BA ON B.BillID=BA.BillID
JOIN Tbl_Accounts A ON A.AccountID=BA.UpdatedBy
JOIN KEYLIST K ON BA.PaymentStatus=K.KEYLISTID
JOIN KEYLIST PM ON BA.PaymentMode=PM.KEYLISTID
  
  

  
GO
/****** Object:  View [dbo].[View_Projects]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Projects]
AS
SELECT  A.[ProjectID]
      , A.[ProjectName]
      , A.[Customer]
      , A.[ProjectDescription]
      , A.[ProjectType]
      , A.[ProjectStatus]
      , A.[ClientID]
      , A.[CreatedOn]
      , A.[CreatedBy]
      , A.[UpdatedOn]
      , A.[UpdatedBy]
	  ,B.CustomerName AS 'StrCustomerName'
	  ,C.Value1 AS 'StrProjectType'
	  ,D.Value1 AS 'StrStatus'
  FROM [Tbl_Projects] AS A
  LEFT JOIN Tbl_Customers AS B
  ON A.Customer=B.CustomerID
  LEFT JOIN KeyList As C 
  ON A.ProjectType=C.KeyListID AND C.Keyid=5024
  LEFT JOIN KeyList AS D
  ON A.ProjectStatus=D.KeyListID AND D.Keyid=5025
  

GO
/****** Object:  View [dbo].[View_SyncList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SyncList]
As
SELECT
        A.[id]
      , A.[syncdate]
      , A.[syncby]
      , A.[syncsts]
      , A.[syncDesc]
	  ,(ISNULL(B.FirstName,'')+' '+ISNULL(B.LastName,''))AS syncbyname
  FROM [tbl_DenaliSync] As A
  LEFT JOIN Tbl_Accounts AS B
  On  A.syncby=B.AccountID
GO
/****** Object:  View [dbo].[View_UserRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_UserRead]
AS

  SELECT    
    A.[AccountID]    
      ,A.[Role]    
      ,A.[UserName]    
      ,A.[Password]    
      ,A.[FirstName]    
      ,A.[LastName]    
      ,A.[PrimaryEmailID]    
      ,A.[PhoneNumber]    
      ,A.[Address1]    
      ,A.[Address2]    
      ,A.[Zipcode]    
      ,A.[IsActive]    
      ,A.[EntityStatus]    
      ,A.[CreatedOn]    
      ,A.[CreatedBy]    
      ,A.[UpdatedOn]    
      ,A.[UpdatedBy]    
      ,A.[ClientID]    
      ,A.[AdministrationRole]    
      ,A.[ApplicationRole]    
   ,B.Value1 AS StrStatus    
   ,C.RoleName    
   FROM Tbl_Accounts AS A    
   LEFT JOIN KeyList AS B    
   ON A.IsActive=B.KeyListID AND B.KeyID=5013     
   LEFT JOIN [dbo].[ApplicationRole] AS C    
   ON A.ApplicationRole=C.RoleID   
   Where A.FirstName is Not Null AND A.FirstName !=''
  
  

GO
/****** Object:  View [dbo].[View_VendorBalanceReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[View_VendorBalanceReport]
AS
SELECT  V.VendorName,
SUM(B.Amount) AS TOTALBILLABLEAMT,

--SUM(AmountPaid) AS TOTALPAIDAMT,
--SUM(AmountDue) AS OVERDUEAMT,
--SUM(PayableAmount) AS PAYABLEAMT,
(SELECT SUM(AmountPaid) From Tbl_BillApproved Where  VendorID=V.VendorID AND PaymentStatus <>50025 AND PaymentStatus<>50033) AS 'TOTALPAIDAMT',
--(SELECT SUM(PayableAmount) From Tbl_BillApproved Where  VendorID=V.VendorID AND PaymentStatus <>50025 AND PaymentStatus<>50033) AS 'OVERDUEAMT',
( SELECT Top(1) PayableAmount From Tbl_BillApproved Where PaymentStatus=50023 AND VendorID=V.VendorID and DueOn>getdate() ORDER BY DueOn ASC) AS 'OVERDUEAMT',
--SUM(AmountPaid) AS TOTALPAIDAMT,
--SUM(AmountDue) AS OVERDUEAMT,
--SUM(PayableAmount) AS PAYABLEAMT,
(SELECT SUM(PayableAmount) From Tbl_BillApproved Where  VendorID=V.VendorID AND PaymentStatus <> 50033 AND PaymentStatus<>50025) AS 'PAYABLEAMT',

K.Value1 AS PAYMENTMWTHOD,
V.VendorID,V.ClientID
,( SELECT Top(1) PaidOn From Tbl_BillApproved Where  VendorID=V.VendorID ORDER BY DueOn ASC) AS 'LASTPAYMENT'
--,( SELECT Top(1)  DueOn From Tbl_BillApproved Where  VendorID=V.VendorID ORDER BY DueOn ASC) AS 'NEXTDUEIN'
,( SELECT Top(1)  DueOn From Tbl_BillApproved Where PaymentStatus=50023 AND VendorID=V.VendorID ORDER BY DueOn ASC) AS 'NEXTDUEIN'

FROM  [Tbl_Vendor] V
LEFT JOIN Tbl_BillApproved BA ON V.VendorID=BA.VendorID
LEFT JOIN Tbl_Bill B ON BA.VendorID=BA.VendorID
LEFT JOIN KEYLIST K ON K.keylistid=V.PrefferedPaymentMethod
--WHERE BA.PaymentStatus <>50025 AND BA.PaymentStatus<>50033

GROUP BY V.VendorName,V.VendorID,V.ClientID,K.Value1
--ORDER BY  V.VendorName

GO
/****** Object:  View [dbo].[View_VendorRead]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[View_VendorRead]
AS
      SELECT distinct    A.VendorID,          
      A.[VendorName],            
      (IsNull( A.[Address1],'') +' '+IsNull(  A.[Address2],'') )AS  'Address',            
      --  A.[Address2],            
      A.[Email],            
      Isnull(  (  
      (SELECT SUM(PayableAmount) FROM Tbl_BillApproved  
      WHERE VendorID=A.VendorID AND Status != 50044 )),0) AS 'Balance',  
      ISNULL(  
      ISNULL( Convert(varchar,(SELECT Top(1) PaidOn  
      FROM Tbl_BillApproved Where VendorId=A.VendorID   
      Order by PaidOn desc),101),''),'' )AS 'PaidOn'            
    --  A.VendorID 
	 ,A.ClientID
	 ,( SELECT Top(1) PayableAmount From Tbl_BillApproved Where PaymentStatus=50023 AND VendorID=A.VendorID ORDER BY DueOn ASC) AS 'NextDueAmount'
	 ,( SELECT Top(1)  DueOn From Tbl_BillApproved Where PaymentStatus=50023 AND VendorID=A.VendorID ORDER BY DueOn ASC) AS 'NextDueDate'
	 ,( SELECT SUM(PayableAmount) From Tbl_BillApproved Where PaymentStatus=50044 AND VendorID=A.VendorID ) AS 'TotalPaidAmount'
      FROM [dbo].[Tbl_Vendor] AS A            
      LEFT JOIN [dbo].[Tbl_BillApproved] AS B            
      ON A.VendorID=B.VendorID     


	

	   
	  

GO
ALTER TABLE [dbo].[tbl_ARPreferences] ADD  DEFAULT ((0)) FOR [Shouldallowedsplitinvoice]
GO
ALTER TABLE [dbo].[tbl_ARPreferences] ADD  DEFAULT ((0)) FOR [Shouldallowededitinvoiceafteremailsend]
GO
ALTER TABLE [dbo].[tbl_ARPreferences] ADD  DEFAULT (getutcdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tbl_Invoice] ADD  DEFAULT ((0)) FOR [BillStatus]
GO
ALTER TABLE [dbo].[Tbl_Invoice] ADD  DEFAULT ((0)) FOR [IsRecurring]
GO
ALTER TABLE [dbo].[Tbl_OrderInvoice] ADD  DEFAULT ((0)) FOR [BillStatus]
GO
/****** Object:  StoredProcedure [dbo].[ChangeClientAdminState]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChangeClientAdminState]  
(  
@UpdatedBy numeric(18,0),     
@IsActivate numeric(18,0),
@ClientID NUMERIC(18,0)
)  
AS  
BEGIN  
DECLARE @isReturnValue int=0
--Activate  
IF(@IsActivate=1)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50042 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50059, IsActive=1 where ClientID=@ClientID
SET @isReturnValue=2;
END  
--Deactivate
ELSE IF(@IsActivate=2)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50043 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50060, IsActive=0 where  ClientID=@ClientID
SET @isReturnValue=2
END  
--Delete
ELSE IF(@IsActivate=3)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50043 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50061, IsActive=0 where ClientID=@ClientID
SET @isReturnValue=2
END  
RETURN @isReturnValue
END  



GO
/****** Object:  StoredProcedure [dbo].[SP_ApproveorRejectBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ApproveorRejectBill]
@accountId numeric(18,0),
@billID numeric(18,0),
@approvedAmount numeric(18,2),
@balanceAmount numeric(18,2),
@payableAmount numeric(18,2),
@status numeric(18,0),
@approverComment nvarchar(max),
@actionKey numeric(18,0),
@dueOn datetime,
@vendorId numeric(18,0)

--@paymentTerms numeric(18,0),
--@filName nvarchar(max),
--@fileDisplayName nvarchar(max),
--@physicalfilePath nvarchar(max),
--@category numeric(18,0),
--@notes nvarchar(max),
--@billDate datetime,
--@invoiceNumber nvarchar(max),
--@description nvarchar(max),
--@issplited numeric(18,0),
--@clientId numeric(18,0),
--@fileSize numeric(18,2),
--@userComment nvarchar(max),
--@puchaseOrder nvarchar(max),
--@billOwner numeric(18,2)
AS 
Begin
declare @ApprovedBillID as numeric(18,0)
	if(@actionKey=2)
	begin
		Update Tbl_Bill set Status=50017 ,Balance=@payableAmount, UpdatedBy=@accountId,UpdatedOn=getutcdate() where BillID=@billID
		Insert into [dbo].[Tbl_BillComments] ([BillID],[Comment],[CreatedOn],[CreatedBy])
		Values
		(@billID,@approverComment,getutcdate(),@accountId)
		DELETE FROM Tbl_BillApproved WHERE BillID=@billID
	end
	else
	begin
		Insert into [dbo].[Tbl_BillApproved]
		([BillID],
		[ApprovedAmount],
		[Status],
		[PaymentStatus],
		[DueOn],
		[VendorID],
		[PayableAmount],
		[CreatedOn],
		[CreatedBy])
		Values
		(@billID,@approvedAmount,50015,50023,@dueOn,@vendorId,@payableAmount,getutcdate(),@accountId)
		set @ApprovedBillID=(SCOPE_IDENTITY())
		Update Tbl_Bill set Balance=@balanceAmount,Status=@status, UpdatedOn=getutcdate(),UpdatedBy=@accountId where BillID=@billID
	 
		--if(@balanceAmount!=0)
		--begin
		--Declare @NewBillId numeric(18,0)
		--	insert into Tbl_Bill ([VendorID],[AccountID],[BillDate],[Amount],[InvoiceNumber],[DueDate],
		--	[Category],[Notes],[PaymentTerms],[Description],[IsSplitted],[Status],[CreatedOn],[CreatedBy],[IsActive],
		--	[Balance],[ClientID],[FileDisplayName],[PhysicalLocation],[FileSize],[FileName],[UserComment],[PurchaseOrder])
		--	values
		--	(@vendorId,@billOwner,@billDate,@payableAmount,@invoiceNumber,@dueOn,@category,@notes,@paymentTerms
		--	,@description,@issplited,50016,GETUTCDATE(),@billOwner,2,@balanceAmount,@clientId,@fileDisplayName,
		--	@physicalfilePath,@fileSize,@filName,@userComment,@puchaseOrder
		--	)
		--	set @NewBillId=(SCOPE_IDENTITY())
		--	if(@issplited=5001[ApprovedBillID]3)
		--	begin
		--		update Tbl_BillBreakage set BillID=@NewBillId where BillID=@billID
		--	end
		--		update Tbl_Bill set Status=50015 where BillID=@billID
			
		--end

		Insert into [dbo].[Tbl_ApprovedComments]([BillID],[ApprovedComment],[CreatedOn],[CreatedBy],[ApprovedBillID])
		Values(@billID,@approverComment,getutcdate(),@accountId,@ApprovedBillID)
		
end
	


End
GO
/****** Object:  StoredProcedure [dbo].[SP_ARCreateCustomer]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ARCreateCustomer]
@clientID NUMERIC(18,0),
@createdBy NUMERIC(18,0),
@customerName NVARCHAR(MAX),
@email NVARCHAR(MAX),
@addressd NVARCHAR(MAX),
@cityd NVARCHAR(MAX),
@stated  NVARCHAR(MAX),
@zipd NVARCHAR(MAX),
@addressb NVARCHAR(MAX),
@cityb NVARCHAR(MAX),
@stateb NVARCHAR(MAX),
@zipb NVARCHAR(MAX),
@retVal NUMERIC(18,0),
@paymentterm NUMERIC(18,0),
@paymentmethod NUMERIC(18,0)


AS
BEGIN


		INSERT INTO [dbo].[Tbl_Customers] 
		([CustomerName],[Email],[CustomerAddress],[City],[State],[Zip],[ClientID],
		[CreatedOn],[CreatedBy],PaymentTerms,PaymentMethod,Shippingaddress,BillingAddress)
		VALUES
		(@customerName,@email,@addressd,@cityd,@stated,@zipd,@clientID,
		GETUTCDATE(),@createdBy,@paymentterm,@paymentmethod,@addressd,@addressb)
		
		 set @retVal=SCOPE_IDENTITY()   
RETURN @retVal  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ARDeleteInvoice]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ARDeleteInvoice]
@invoiceId NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
DELETE FROM tbl_orderinvoice Where ClientId=@clientID AND OrderInvoice=@invoiceId
RETURN @invoiceId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BillApproveOrReject]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[SP_BillApproveOrReject]              
@accountId numeric(18,0),              
@billID numeric(18,0),              
@approvedAmount numeric(18,2),              
@balanceAmount numeric(18,2),              
@payableAmount numeric(18,2),              
@status numeric(18,0),              
@approveStatus numeric(18,0),              
@approverComment nvarchar(max),              
@actionKey numeric(18,0),              
@dueOn datetime,              
@vendorId numeric(18,0),              
@currentBillStageApprovalID numeric(18,0),              
@isPartial NUMERIC(18,0),              
@clientId NUMERIC(18,0)              
              
AS              
BEGIN              
            
if(@actionKey=2)              
 begin              
 --Updating Bill status in Tbl_Bill AS Rejected              
  Update Tbl_Bill set Status=50017 ,Balance=@payableAmount, UpdatedBy=@accountId,UpdatedOn=getutcdate() where BillID=@billID              
                
--Inserting approver History              
  Insert into [dbo].[Tbl_ApproveHistory] ([BillID],[ApproverComment],[ApproverID],[CreatedOn],[CreatedBy],Status)              
  Values              
  (@billID,@approverComment,@accountId,getutcdate(),@accountId,50046)              
                
  --Deleting  Bill history in Bil approved              
  DELETE FROM Tbl_BillApproved WHERE BillID=@billID              
 end              
 else              
 begin              
 --inserting Bill Approved Table Data              
              
 --if not exists(SELECT BillId FROM Tbl_BillApproved WHERE BillID=@billID)              
 --begin              
                
 --end              
 --else              
 -- begin              
 -- update Tbl_BillApproved set Status=@approveStatus,ApprovedAmount=@approvedAmount ,UpdatedBy=@accountId where BillID=@billID              
 -- end              
        
  --Inserting Approver History              
    Insert into [dbo].[Tbl_ApproveHistory]([BillID],[ApproverComment],[CreatedOn],[CreatedBy],[ApproverID],Status,[ApprovedAmount],[BalanceAmount])              
    Values(@billID,@approverComment,getutcdate(),@accountId,@accountId,50045,@approvedAmount,@balanceAmount)              
              
                  
    DECLARE @approverCount NUMERIC(18,0)              
              
    set @approverCount=(SELECT COUNT(BillStageApprovalID) FROM  [dbo].[BillStageApproval]  WHERE BillID=@billID)              
              
    DECLARE @lastApprover NUMERIC(18,0)              
              
    SET @lastApprover=(SELECT MAX(BillStageApprovalID) FROM  [dbo].[BillStageApproval]  WHERE BillID=@billID)              
             
  DECLARE @currentApproverStageApprovalID NUMERIC(18,0)              
              
     SET @currentApproverStageApprovalID=(SELECT BillStageApprovalID FROM  [dbo].[BillStageApproval]  WHERE BillID=@billID AND ApproverID=@accountId)              
             
          
    DECLARE @firstApproverSequence NUMERIC(18,0)              
              
    set @firstApproverSequence=(SELECT MIN([Sequence]) from [dbo].[BillStageApproval]  WHERE BillID=@billID)              
              
    UPDATE [dbo].[BillStageApproval] SET CurrentStageApproval=0, ApprovedAmount=@approvedAmount WHERE ApproverID=@accountId and BillID=@billID              
              
    UPDATE [dbo].[BillStageApproval] SET StageInitiated=1 ,CurrentStageApproval=1 WHERE BillStageApprovalID= @currentBillStageApprovalID AND BillID=@billID        
         
 --Insert if the current approver is the last approver        
 IF(@currentApproverStageApprovalID=@lastApprover)        
 BEGIN        
   Insert into [dbo].[Tbl_BillApproved]              
       ([BillID],              
       [ApprovedAmount],              
       [Status],              
       [PaymentStatus],              
       [DueOn],              
       [VendorID],              
       [PayableAmount],              
       [CreatedOn],              
       [CreatedBy],              
       ClientID,UpdatedBy)               
      -- Values              
	  (Select BillID,@approvedAmount,@approveStatus,50023,DueDate,@vendorId,@payableAmount,getutcdate(),@accountId,@clientId,@accountId FROM Tbl_Bill Where BillID=@billID)
    --(@billID,@approvedAmount,@approveStatus,50023,@dueOn,@vendorId,@payableAmount,getutcdate(),@accountId,@clientId,@accountId)        
     --Updating Tbl_Bill data for the bill              
        Update Tbl_Bill set Balance=@balanceAmount,Status=@status, UpdatedOn=getutcdate(),UpdatedBy=@accountId where BillID=@billID              
 END        
              
    if(@isPartial=1 AND @lastApprover=@currentBillStageApprovalID-1)              
    begin            
     UPDATE [dbo].[BillStageApproval] SET CurrentStageApproval=0 WHERE BillID=@billID                
                
     UPDATE [dbo].[BillStageApproval] SET CurrentStageApproval=1 WHERE [Sequence]=@firstApproverSequence AND  BillID=@billID               
                
    end              
              
              
 end             
            
 return @billID            
             
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_BillSubmit]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BillSubmit]  
@userRoleId NUMERIC(18,0),  
@accountID NUMERIC(18,0),  
@billID NUMERIC(18,0)  
AS  
BEGIN  
DECLARE @isSumbit  NUMERIC(18,0)  
 SET @isSumbit=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3003)  
 IF(@isSumbit IS NOT NULL)  
 BEGIN  
   UPDATE Tbl_Bill SET Status=50016,UpdatedOn=GETUTCDATE(),UpdatedBy=@accountID WHERE BillID=@billID  
 END 
 return @billID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChallengeBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_ChallengeBill]
@billId numeric(18,0),
@identityId numeric(18,0)
AS
Begin 
  --      DECLARE @BalanceAmount As numeric(18,2)
		--Set @BalanceAmount=(select Amount from Tbl_Bill where BillID=@billId)
		Update Tbl_Bill set Status=50036  where BillID=@billId
		Update Tbl_BillApproved set PaymentStatus=50036 where IdentityID=@identityId

		
End
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeBillStatusToFlag]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChangeBillStatusToFlag]
@billId numeric(18,0),
@approvedBillId numeric(18,0)
AS
Begin
		IF exists(Select BillId from Tbl_BillApproved where BillID=@billId and IdentityID=@approvedBillId )
		begin
				Update Tbl_BillApproved set PaymentStatus=50025 where BillID=@billId and IdentityID=@approvedBillId
		end

End
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeClientAdminState]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChangeClientAdminState]  
(  
@UpdatedBy numeric(18,0),     
@IsActivate numeric(18,0),
@ClientID NUMERIC(18,0)
)  
AS  
BEGIN  
DECLARE @isReturnValue int=0
--Activate  
IF(@IsActivate=1)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50042 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50059, IsActive=1 where ClientID=@ClientID
SET @isReturnValue=2;
END  
--Deactivate
ELSE IF(@IsActivate=2)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50043 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50060 where  ClientID=@ClientID
SET @isReturnValue=2
END  
--Delete
ELSE IF(@IsActivate=3)  
BEGIN  
Update [dbo].[Tbl_Accounts] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy, IsActive=50043 where ClientID =@ClientID  
Update [dbo].[tbl_Client] set UpdatedOn=GETUTCDATE(), UpdatedBy=@UpdatedBy,Status=50061, IsActive=0 where ClientID=@ClientID
SET @isReturnValue=2
END  
RETURN @isReturnValue
END  

select * from Tbl_Accounts
select * from Tbl_Client

GO
/****** Object:  StoredProcedure [dbo].[SP_ChangePassword]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChangePassword]      
@oldPassword NVARCHAR(MAX),      
@newPassword NVARCHAR(MAX),      
@userId NUMERIC(18,0),      
@clientId NUMERIC(18,0)      
AS      
BEGIN      
DECLARE @returnValue AS NUMERIC(18,0) 
DECLARE @existingPassword AS NVARCHAR(MAX)

IF EXISTS(SELECT AccountID FROM Tbl_Accounts WHERE AccountID=@userId AND Password=@oldPassword)      
 BEGIN    
	SET @existingPassword=(SELECT Password FROM Tbl_Accounts WHERE AccountID=@userId AND Password=@oldPassword)
	IF(@newPassword=@oldPassword)
	BEGIN
	     SET @returnValue=2     
	END
	ELSE
	BEGIN
       SET @returnValue=3      
       UPDATE Tbl_Accounts SET Password=@newPassword,UpdatedBy=@userId,UpdatedOn=GETUTCDATE(),IsPasswordReseted=1  WHERE AccountID=@userId    
	END
 END      
 ELSE      
 BEGIN      
       SET @returnValue=1      
 END      
 Return @returnValue;      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateBillCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateBillCategory]
@createdBy NUMERIC(18,0),
@clientID NUMERIC(18,0),
@status NUMERIC(18,0),
@billCategory NVARCHAR(MAX),
@description NVARCHAR(MAX),
@retVal Numeric(18,0)
AS
BEGIN
INSERT INTO Tbl_BillCategory
(BillCategory,[Description],[Status],CreatedBy,CreatedOn,ClientID)
VALUES
(@billCategory,@description,@status,@createdBy,GETUTCDATE(),@clientID)
 set @retVal=SCOPE_IDENTITY() 
 RETURN @retVal
END







GO
/****** Object:  StoredProcedure [dbo].[SP_CreateCustomer]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateCustomer]
@clientID NUMERIC(18,0),
@createdBy NUMERIC(18,0),
@customerName NVARCHAR(MAX),
@customerType NUMERIC(18,0),
@email NVARCHAR(MAX),
@contactNumber NVARCHAR(MAX),
@address NVARCHAR(MAX),
@city  NVARCHAR(MAX),
@state NVARCHAR(MAX),
@zip NVARCHAR(MAX),
@logo NVARCHAR(MAX),
@retVal NUMERIC(18,0),
@paymentterm NUMERIC(18,0),
@paymentmethod NUMERIC(18,0),
@shippingaddress NVARCHAR(MAX),
@billingaddress NVARCHAR(MAX),
@accountholdername NVARCHAR(MAX),
@accountnumber NVARCHAR(MAX),
@routingnumber NVARCHAR(MAX)

AS
BEGIN


		INSERT INTO [dbo].[Tbl_Customers] 
		([CustomerName],[CutomerType],[Email],[ContactNumber],[CustomerAddress],[City],[State],[Zip],[CustomerLogo],[ClientID],
		[CreatedOn],[CreatedBy],PaymentTerms,PaymentMethod,Shippingaddress,BillingAddress,AccountHoldername,AccountNumber,RoutingNumber)
		VALUES
		(@customerName,@customerType,@email,@contactNumber,@address,@city,@state,@zip,@logo,@clientID,
		GETUTCDATE(),@createdBy,@paymentterm,@paymentmethod,@shippingaddress,@billingaddress,@accountholdername,@accountnumber,@routingnumber)
		
		 set @retVal=SCOPE_IDENTITY()   
RETURN @retVal  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateNewBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateNewBill]              
@accountId NUMERIC(18,0),              
@clientId NUMERIC(18,0),              
@vendorId NUMERIC(18,0),              
@invoiceNumber NVARCHAR(MAX),              
@billDesc NVARCHAR(MAX),              
@paymentTerm NUMERIC(18,0),              
@status NUMERIC(18,0),              
@invoiceDate DATETIME,              
@dueDate DATETIME,              
@amount NUMERIC(18,2),              
@fileName NVARCHAR(MAX),              
@fileDisplayName NVARCHAR(MAX),              
@fileSize NUMERIC(18,2),              
@physicalLocation NVARCHAR(MAX),              
@isAutoApproval NUMERIC(18,0),              
@isRecurring NUMERIC(18,0),              
@isReminder NUMERIC(18,0),              
@reminderEmail NVARCHAR(MAX),              
@reminderInterval NUMERIC(18,0),              
@reminderIntervalDay NVARCHAR(MAX),              
@isSplitted NUMERIC(18,0),              
@recurrenceFrequency NUMERIC(18,0),              
@recurrenceStartDate Datetime,              
@recurrenceEndDate Datetime,              
@recurrenceBatchNumber NUMERIC(18,0),              
@comment NVARCHAR(MAX),   
@customer NUMERIC(18,0),  
@project NUMERIC(18,0), 
@category NUMERIC(18,0), 
@retVal NUMERIC(18,0)              
AS              
BEGIN              

declare @PaymentTermid numeric(18,0),@GLCodeID  numeric(18,0)

SET @PaymentTermid =(SELECT PaymentTerm FROM Tbl_Vendor WHERE VendorID=@vendorId)
IF(@PaymentTermid=0)
BEGIN
UPDATE Tbl_Vendor SET PaymentTerm=@paymentTerm WHERE VendorID=@vendorId
END


SET @GLCodeID=(SELECT GLCode FROM Tbl_Vendor WHERE VendorID=@vendorId) 
IF(@GLCodeID=0)
BEGIN
UPDATE Tbl_Vendor SET GLCode=@category WHERE VendorID=@vendorId
END



 INSERT INTO Tbl_Bill              
 ([AccountID],[ClientID],[VendorID],[InvoiceNumber],[Description],[PaymentTerms],[BillDate],[DueDate],Amount,Balance,[Status],              
 [FileName],[FileDisplayName],[FileSize],[PhysicalLocation],[isAutoApproval],[IsRecurring],[IsReminder],isSplitted,              
    [ReminderEmail],[ReminderInterval],[ReminderIntervalDay],CreatedBy,CreatedOn,[RecurrenceFrequency],[RecurrenceStartDate],              
    [RecurrenceEndDate],[RecurrenceBatchNumber],UpdatedOn,UpdatedBy ,Customer,Project,BillCategory         
 )              
 VALUES              
 (@accountId,@clientId,@vendorId,@invoiceNumber,@billDesc,@paymentTerm,@invoiceDate,@dueDate,@amount,@amount,@status              
 ,@fileName,@fileDisplayName,@fileSize,@physicalLocation,@isAutoApproval,@isRecurring,@isReminder,@isSplitted              
 ,@reminderEmail,@reminderInterval,@reminderIntervalDay,@accountId,GETUTCDATE(),@recurrenceFrequency,@recurrenceStartDate,              
 @recurrenceEndDate,@recurrenceBatchNumber,GETUTCDATE(),@accountId,@customer,@project,@category)              
 set @retVal=SCOPE_IDENTITY()                
              
 IF(@status=50015)              
 BEGIN              
 Insert into [dbo].[Tbl_BillApproved]              
  ([BillID],              
  [ApprovedAmount],              
  [Status],              
  [PaymentStatus],              
  [DueOn],              
  [VendorID],              
  [PayableAmount],              
  [CreatedOn],              
  [CreatedBy],          
  ClientId)              
  --Values      
  (Select Billid,Amount,50015,50023,DueDate,VendorID,Amount,CreatedOn,UpdatedBy,ClientID FROM TBl_Bill Where BillId=@retVal AND ClientID=@clientId)    
  --(@retVal,@amount,50015,50023,@dueDate,@vendorId,@amount,getutcdate(),@accountId,@clientId)              
                
  Update Tbl_Bill set Balance=0.00,Status=@status, UpdatedOn=getutcdate(),UpdatedBy=@accountId where BillID=@retVal              
            
              
 Insert Into TBl_ApproveHistory            
 (BillID,ApproverComment,CreatedOn,CreatedBy,ApproverID,Status,ApprovedAmount,BalanceAmount)            
 Values            
 (@retVal,@comment,GETUTCDATE(),@accountId,0,50045,@amount,0.00)            
                
 END              
   return @retVal;              
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_CreatePartialPayment]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreatePartialPayment]
@createdBy NUMERIC(18,0),
@clientID NUMERIC(18,0),
@customerName NVARCHAR(MAX),
@duedate nvarchar(50),
@paymentmode numeric(18,0),
@refnumber NVARCHAR(MAX),
@balanveamont numeric(18,2),
@invoice  NVARCHAR(MAX),
@payableamount numeric(18,2),
@paidon NVARCHAR(MAX),
@amountpaid numeric(18,2),
@retVal NUMERIC(18,0),
@status NUMERIC(18,0),
@customerid NUMERIC(18,0),
@invoiceno numeric(18,0)


AS
BEGIN

DECLARE @action NVARCHAR(200),@invoiceid NUMERIC(18,0),@accountid NUMERIC(18,0)

         UPDATE Tbl_Invoice SET TotamAmount=@balanveamont,BillStatus=3 WHERE InvoiceId=@invoiceno;

		INSERT INTO [dbo].Tbl_Offline_Payment
		(OF_CUST_ID,OF_CUST_NAME,OF_INVOICE_NO,OF_INVOICE_DATE,OF_INVOICE_AMOUNT,OF_PAID_DATE,OF_PAID_AMT,OF_BALANCE_AMT,OF_PAY_TYPE,OF_CREATED_BY,
		OF_CREATED_DATE,OF_CLIEND_ID,OF_INVOICE_ID)
		VALUES
		(@customerid,@customerName,@invoice,@duedate,@payableamount,@paidon,@amountpaid,@balanveamont,@paymentmode,@createdBy,GETUTCDATE(),@clientID,@invoiceno)
		set @retVal=SCOPE_IDENTITY() 
		
		EXEC SP_InsertTimeLine @action='Payment Completed By Partially',@invoiceid=@invoiceno,@accountid=@createdBy

 RETURN @retVal  
END




GO
/****** Object:  StoredProcedure [dbo].[SP_CreateUser]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CreateUser]        
@userRoleId NUMERIC(18,0),        
@firstName NVARCHAR(MAX),        
@lastName NVARCHAR(MAX),        
@role NUMERIC(18,0),        
@email NVARCHAR(MAX),        
@phoneNumber NVARCHAR(MAX),        
@isActive NUMERIC(18,0),        
@createdBy NUMERIC(18,0),        
@passWord NVARCHAR(MAX)  ,      
@clientID NUMERIC(18,0)  ,    
@retVal NUMERIC(18,0)  ,  
@isDefaultAccountant NUMERIC(18,0)  
AS        
BEGIN        
 DECLARE @isCreate  NUMERIC(18,0)        
 SET @isCreate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3012)        
 IF(@isCreate IS NOT NULL)        
 BEGIN        
  
 IF (@isDefaultAccountant=1)  
 BEGIN  
 UPDATE Tbl_Accounts SET IsDefaultAccountant=0 Where ClientID=@clientID  
 END  
    INSERT INTO Tbl_Accounts        
    ([FirstName],        
    [LastName],        
    UserName,        
    [PrimaryEmailID],        
    [PhoneNumber],        
    [IsActive],        
    [ApplicationRole],        
    CreatedOn,        
    CreatedBy,        
    Password,      
    ClientID  
 ,IsDefaultAccountant,
 IsPasswordReseted)        
    VALUES        
    (@firstName,        
    @lastName        
    ,@email        
    ,@email        
    ,@phoneNumber,        
    @isActive,        
    @role        
    ,GETUTCDATE()        
    ,@createdBy        
    ,@passWord      
 ,@clientID  
 ,@isDefaultAccountant,0)        
    
 SET @retVal=SCOPE_IDENTITY()    
 RETURN @retVal;    
    
 END        
 END 
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCard]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCard]
@userID NUMERIC(18,0),
@customerID NUMERIC(18,0),
@cardID NUMERIC(18,0)
AS
BEGIN

		DELETE FROM Tbl_ClientCards WHERE CardIdentityId=@cardID AND CustomerID=@customerID
		
		
		RETURN @cardID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteClientAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteClientAccount]
@customerID NUMERIC(18,0),
@accountID NUMERIC(18,0)
AS
BEGIN
		DELETE FROM [dbo].[Tbl_ClientBankAccount] WHERE AccountIdentityID=@accountID AND CustomerID=@customerID
		return @accountID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteClientGL]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteClientGL]
@clientID NUMERIC(18,0),
@glID NUMERIC(18,0)
AS
BEGIN
			DELETE FROM Tbl_GlCodes Where IdentityID=@glID AND ClientID=@clientID
			Return @glID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCustomApprovalConfig]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DeleteCustomApprovalConfig]
@configId NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
	DELETE FROM Tbl_CustomApprovalConfigurations Where IdentityID=@configId AND ClientID=@clientID
	DELETE FROM Tbl_CustomApprovers Where ConfigID=@configId AND ClientID=@clientID
	REturn @configId


END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCustomer]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCustomer]
@customerId NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
DELETE FROM Tbl_Customers Where CustomerID=@customerId AND ClientID=@clientID
RETURN @customerId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCustomer360Contact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_DeleteCustomer360Contact]
@contactID NUMERIC(18,0),
@customerID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
	DELETE  FROM Tbl_Customer360Contact WHERE ContactId=@contactID AND CustomerId=@customerID AND ClientID=@clientID
	Return @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCustomerContact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteCustomerContact]
@contactID NUMERIC(18,0),
@customerID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
	DELETE  FROM Tbl_CustomerContact WHERE ContactId=@contactID AND CustomerId=@customerID AND ClientID=@clientID
	Return @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteGlCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteGlCategory]
@categoryId NUMERIC(18,0),
@clientId NUMERIC(18,0)
AS
BEGIN
	DELETE FROM [dbo].[Tbl_GlCodes] Where IdentityID=@categoryId OR [MasterGLCode]=@categoryId-- AND ClientID=@clientId
	RETURN @categoryId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeletePaidBillAttachment]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeletePaidBillAttachment]
@attachmentID NUMERIC(18,0),
@billApproveId NUMERIC(18,0)
AS
BEGIN
DELETE  FROM [dbo].[Tbl_BillPaidAttachments] Where
[BillPaidAttatchmentId]=@attachmentID AND [BillApprovedId]=@billApproveId
return @attachmentID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProject]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DeleteProject]  
@clientID NUMERIC(18,0),  
@projectID NUMERIC(18,0)  
AS  
BEGIN  
  DELETE FROM Tbl_Projects Where ClientID=@clientID AND ProjectID=@projectID  
  RETURN @projectID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteRole]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteRole]
@deleteRoleId NUMERIC(18,0),
@deleteMasterRoleID NUMERIC(18,0),
@userRoleId NUMERIC(18,0)
AS
BEGIN
	DECLARE @isDelete  NUMERIC(18,0)
	SET @isDelete=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3011)
	IF(@isDelete IS NOT NULL)
	BEGIN
			DELETE FROM ApplicationRole WHERE RoleID=@deleteRoleId
			UPDATE [dbo].[MasterRole] SET IsAdded=0 WHERE [MasterRoleID]=@deleteMasterRoleID
	END


END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteUser]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteUser]
@deleteUserId NUMERIC(18,0),
@userRoleId NUMERIC(18,0)
AS
BEGIN
	DECLARE @isDelete  NUMERIC(18,0)
	SET @isDelete=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3014)
	IF(@isDelete IS NOT NULL)
	BEGIN
			UPDATE Tbl_Accounts SET IsActive=50043 WHERE AccountID=@deleteUserId
	END


END

GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteUserBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteUserBill]
@clientID numeric(18,0),
@accountID numeric(18,0),
@billID numeric(18,0)
AS
BEGIN
		if exists(select * from Tbl_Bill where BillID=@billID)
		begin
		delete from Tbl_Bill where BillID=@billID and AccountID=@accountID
		delete from Tbl_BillBreakage where BillID=@billID
		end
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteVendor]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_DeleteVendor]  
@vendorID NUMERIC(18,0),  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
 DELETE FROM Tbl_Vendor WHERE VendorID=@vendorID AND ClientID=@clientID  
 DELETE FROM Tbl_VendorBankAccount WHERE VendorID=@vendorID   
 DELETE FROM TBl_Bill Where VendorID=@vendorID AND ClientID=@clientID
 DELETE FROM Tbl_BillApproved Where VendorID=@vendorID
 RETURN @vendorID  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteVendorContact]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteVendorContact]
@contactID NUMERIC(18,0),
@vendorID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
	DELETE  FROM VendorContact WHERE ContactIdentityId=@contactID AND VendorID=@vendorID AND ClientID=@clientID
	Return @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DisableDefaultApprobers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_DisableDefaultApprobers]
@clientID  NUMERIC(18,0)
AS
BEGIN
	UPDATE Tbl_Accounts SET [IsDefaultAccountant]=0,ApproverSeqence=null Where ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EditApplicationRole]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EditApplicationRole]  
@userRoleID NUMERIC(18,0),  
@roleName NVARCHAR(MAX),  
@description NVARCHAR(MAX),  
@status NUMERIC(18,0),  
@updatedBy NUMERIC(18,0),  
@editRoleID NUMERIC(18,0)  
  
AS  
BEGIN  
 DECLARE @isUpdate  NUMERIC(18,0)  
 SET @isUpdate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleID AND EntityActionID=3010)  
 IF(@isUpdate IS NOT NULL)  
 BEGIN  
   UPDATE ApplicationRole SET  
     [RoleName]=@roleName,  
     [Description]=@description,   
     [Status]=@status,  
     [UpdatedBy]=@updatedBy,  
     [UpdatedOn]=GETUTCDATE()  
     WHERE RoleID=@editRoleID  
  
     DELETE FROM ApplicationRoleEntity WHERE RoleID=@editRoleID  

	 RETURN @editRoleID
     END  
    
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_FetchBillDetailsForTriggerEmail]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_FetchBillDetailsForTriggerEmail]      
AS      
BEGIN      
 -- payments and financemanager email id based on clients      
	 SELECT distinct  'DuePaymentsToday' AS TableName,        
 B.FirstName,B.PrimaryEmailID,      
 BA.ClientId   
 , B.AccountID  
-- ,BA.InvoiceNumber
 ,dbo.Fn_BuildInvoices(BA.ClientId,0,50015) AS InvoiceNumbers    
 FROM Tbl_BillApproved AS A      
 Inner JOIN Tbl_Bill AS BA      
 ON A.BillId=BA.BillId      
 Inner JOIN Tbl_Accounts AS B      
 ON BA.ClientID=B.ClientID      
 INNER JOIN ApplicationRoleENtity AS C      
    ON B.ApplicationRole=C.RoleID      
    INNER JOIN EntityAction AS D      
    ON C.EntityActionID=D.EntityActionID      
    INNER JOIN Entity AS E      
    ON D.EntityID=E.EntityID AND      
    E.EntityID=2002 AND B.ApplicationRole !=1005      
 WHERE  A.PaymentStatus=50023      
 --AND A.DueOn = CONVERT(DATE ,GETDATE())      
 Order by B.AccountID      
     
      
  SELECT distinct  'DuePaymentsTomorrow' AS TableName,        
 B.FirstName,B.PrimaryEmailID,      
 BA.ClientId   
 , B.AccountID  
 --,BA.InvoiceNumber
 ,dbo.Fn_BuildInvoices(BA.ClientId,1,50015) AS InvoiceNumbers    
 FROM Tbl_BillApproved AS A      
 Inner JOIN Tbl_Bill AS BA      
 ON A.BillId=BA.BillId      
 Inner JOIN Tbl_Accounts AS B      
 ON BA.ClientID=B.ClientID      
 INNER JOIN ApplicationRoleENtity AS C      
    ON B.ApplicationRole=C.RoleID      
    INNER JOIN EntityAction AS D      
    ON C.EntityActionID=D.EntityActionID      
    INNER JOIN Entity AS E      
    ON D.EntityID=E.EntityID AND      
    E.EntityID=2002 AND B.ApplicationRole !=1005      
 WHERE  A.PaymentStatus=50023        
 AND A.DueOn =Convert(DATE,DATEADD(day,1,GETDATE()))      
 Order by B.AccountID      
      
  SELECT distinct  'DuePaymentsDayAfterTomorrow' AS TableName,        
 B.FirstName,B.PrimaryEmailID,      
 BA.ClientId   
 , B.AccountID  
 --,BA.InvoiceNumber
 ,dbo.Fn_BuildInvoices(BA.ClientId,2,50015) AS InvoiceNumbers    
 FROM Tbl_BillApproved AS A      
 Inner JOIN Tbl_Bill AS BA      
 ON A.BillId=BA.BillId      
 Inner JOIN Tbl_Accounts AS B      
 ON BA.ClientID=B.ClientID      
 INNER JOIN ApplicationRoleENtity AS C      
    ON B.ApplicationRole=C.RoleID      
    INNER JOIN EntityAction AS D      
    ON C.EntityActionID=D.EntityActionID      
    INNER JOIN Entity AS E      
    ON D.EntityID=E.EntityID AND      
    E.EntityID=2002 AND B.ApplicationRole !=1005      
 WHERE  A.PaymentStatus=50023        
 AND A.DueOn =Convert(DATE,DATEADD(day,2,GETDATE()))      
 Order by B.AccountID   
      
 SELECT distinct  'DueApprovals' AS TableName,      
 dbo.Fn_BuildInvoices(A.ClientId,3,50016) AS InvoiceNumbers ,Format(A.DueDate,'dd/MM/yyyy') AS DueDate,
 C.FirstName,C.PrimaryEmailID,B.[ApproverID] FROM Tbl_Bill AS A       
 INNER JOIN [dbo].[BillStageApproval] AS B      
 ON A.BillID=B.BillID AND B.[ApproverID] IS NOT NULL       
 AND B.[StageInitiated]=1 AND B.[CurrentStageApproval]=1      
 INNER JOIN Tbl_Accounts AS C      
 ON B.[ApproverID]=C.AccountID      
 WHERE A.DueDate BETWEEN GETDATE() AND DATEADD(day,2,GETDATE())      
 ORDER BY B.[ApproverID]      
      
END      
      
	  

    
       
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
GO
/****** Object:  StoredProcedure [dbo].[SP_FlagOrDisputeBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_FlagOrDisputeBill]    
@billId NUMERIC(18,0),    
@actionKey NUMERIC(18,0),    
@status NUMERIC(18,0),    
@paymentStatus NUMERIC(18,0),    
@processedBy NUMERIC(18,0),    
@clientId NUMERIC(18,0) ,
@billApprovedId NUMERIC(18,0),
@disputedReason NVARCHAR(MAX)
AS    
BEGIN    
  UPDATE Tbl_BillApproved SET PaymentStatus=@paymentStatus ,UpdatedBy=@processedBy,UpdatedOn=GETUTCDATE() WHERE BillID=@billId --AND ClientID=@clientId    
  UPDATE Tbl_Bill SET Status=@status ,UpdatedBy=@processedBy,UpdatedOn=GETUTCDATE() WHERE BillID=@billId --AND ClientID=@clientId   
  IF @actionKey=2
  BEGIN
	INSERT INTO [dbo].[Tbl_BillDisputedHistory]
	([BillID],[BillApprovedID],[Comment],CreatedOn,[CreatedBy])
	VALUES
	(@billId,@billApprovedId,@disputedReason,GETUTCDATE(),@processedBy)
  END

  Return @billId  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_GerOffLinePaymentlist]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GerOffLinePaymentlist]
	@clientid numeric(18,0)
AS
BEGIN
	 SELECT KeyListID,Value1 FROM Keylist Where Keyid=5020  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAccountsPayableData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_GetAccountsPayableData]
@DueDate date 
AS
Begin
select 
B.VendorID,
B.VendorName,
B.CurrentPayable,
B.ZeroToThirty,
B.ThityOneToSixty,
B.SixtyOneToNinty,
B.GreaterThanOneTwenty,
(select(B.CurrentPayable+B.ZeroToThirty+B.ThityOneToSixty+B.SixtyOneToNinty+B.GreaterThanOneTwenty)) as TotalOutStanding
from
(select A.VendorID,A.VendorName,
(select coalesce(sum(ApprovedAmount),0) from Tbl_BillApproved  where VendorID= A.VendorID and DueOn=convert(Date, @DueDate)) As CurrentPayable,
(select coalesce(sum(ApprovedAmount),0) from Tbl_BillApproved  where VendorID= A.VendorID 
and DueOn between  DATEADD ( DAY,-1,(convert(date,@DueDate))) and DATEADD ( DAY,30,(convert(date,@DueDate)))) AS ZeroToThirty,
(select coalesce(sum(ApprovedAmount),0) from Tbl_BillApproved  where VendorID= A.VendorID 
and DueOn between  DATEADD ( DAY,31,(convert(date,@DueDate))) and DATEADD ( DAY,60,(convert(date,@DueDate)))) AS ThityOneToSixty,
(select coalesce(sum(ApprovedAmount),0) from Tbl_BillApproved  where VendorID= A.VendorID 
and DueOn between DATEADD ( DAY,61,(convert(date,@DueDate))) and DATEADD ( DAY,120,(convert(date,@DueDate)))) As SixtyOneToNinty,
(select coalesce(sum(ApprovedAmount),0) from Tbl_BillApproved  where VendorID= A.VendorID 
and DueOn > DATEADD ( DAY,120,(convert(date,@DueDate)))) AS GreaterThanOneTwenty
from
(select * from Tbl_Vendor ) A)B

End

--select * from Tbl_BillApproved where  VendorID=5109
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAccountsPayableDataList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_GetAccountsPayableDataList]
@clientId NUMERIC(18,0)
AS
BEGIN
SELECT
A.BillID
,B.VendorID
,B.VendorName
,A.DueDate
,A.InvoiceNumber
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) <= CAST(GETDATE() AS DATE) ) as CurrentPayable
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) > CAST(GETDATE() AS DATE) and CAST( A.DueDate AS DATE) <=  DATEADD( DAY,30, CAST(GETDATE() AS DATE))) as ZeroToThirty
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) > DATEADD( DAY,30, CAST(GETDATE() AS DATE)) and CAST(A.DueDate AS DATE) <=  DATEADD( DAY,60, CAST(GETDATE() AS DATE))) as ThirtyToSisty
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) > DATEADD( DAY,60, CAST(GETDATE() AS DATE)) and CAST(A.DueDate AS DATE) <=  DATEADD( DAY,90, CAST(GETDATE() AS DATE))) as SixtyToNinty
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) >DATEADD( DAY,90, CAST(GETDATE() AS DATE)) and CAST(A.DueDate AS DATE) <=  DATEADD( DAY,120, CAST(GETDATE() AS DATE))) as NintyToOneTwenty
,( SELECT  ISNULL( SUM(ApprovedAmount),0)  FROM Tbl_BillApproved WHERE BillID = A.BillID  AND CAST( A.DueDate AS DATE) > DATEADD( DAY,120, CAST(GETDATE() AS DATE)) ) as AboveOneTwenty
FROM
Tbl_Bill AS A
INNER JOIN Tbl_Vendor AS B 
ON A.VendorID=B.VendorID
INNER JOIN Tbl_BillApproved as C
ON A.BillID=C.BillID
WHERE C.Status=50015 AND C.PaymentStatus != 50026 AND A.ClientID=@clientId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAddVendorScreenMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAddVendorScreenMasterData]            
@clientID NUMERIC(18,0)            
AS            
BEGIN            
  SELECT            
   'PaymentTerms' AS TableName,            
   KeyID,            
   KeyListID,            
   Value1 FROM KeyList            
   WHERE KeyID=5003           
             
   SELECT            
   'PrefferedPayment' AS TableName,            
   KeyID,            
   KeyListID,            
   Value1 FROM KeyList            
   WHERE KeyID=5020          
          
   SELECT            
   'VendorType' AS TableName,            
   KeyID,            
   KeyListID,            
   Value1 FROM KeyList            
   WHERE KeyID=5019          
           
   SELECT 'GlCodes' AS TableName,        
   [IdentityID]  AS KeyListID,        
   [GLNumber] ,        
   CASE  
   WHEN [IsMasterGLCode]=1 THEN ISNULL( [GLNumber],'')+' - '+ISNULL(CategoryName,'')   
   ELSE ISNULL( [GLNumber],'')+' - '+ISNULL([GLDescription],'') 
   END  
   AS 'Value1'
  --ISNULL( [GLNumber],'')+' - '+ISNULL([GLDescription],'') AS 'Value1'        
      
   FROM [dbo].[Tbl_GlCodes] Where ClientID=@clientID AND IsActive=1   
       
   SELECT 'VendorEmail' AS TableName,Email FROM Tbl_Vendor Where ClientID=@clientID    
              
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAgingDetailedReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SP_GetAgingDetailedReport 0,10,'VendorName asc','2000','0','50009','','1','30','',''
CREATE PROCEDURE [dbo].[SP_GetAgingDetailedReport]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@clientID NVARCHAR(MAX),
	@vendor nvarchar(max),
	@paymentterms nvarchar(max),@balanceamt nvarchar(max),
	@fromval nvarchar(max),@toval nvarchar(max),
	@fromdate nvarchar(max),@todate nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @vendor !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
END

IF @paymentterms !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND PaymentTermsID IN ('+@paymentterms+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Balance IN ('+@balanceamt+')'               
END

IF @fromval !='100'  AND  @toval!='100'             
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Agingday BETWEEN '+@fromval+' AND '+@toval+''               
END
ELSE
BEGIN
SET @dynamicwhere = @dynamicwhere + ' AND Agingday > '+@fromval+''               
END

IF @fromdate !='' AND @todate !=''                        
BEGIN                            
SET @dynamicwhere = @dynamicwhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@fromdate,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@todate,101),101)+''''                            
END 


--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
--END

--IF @balanceamt !=''                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND 0-30DAYS IN ('+@balanceamt+')'               
--END

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''VendorList'' AS TableName, [VendorName],[BillDate],[InvoiceNumber]        
,[PaymentTerms],[DueOn],Balance,Agingday,VendorID,ClientID
 FROM [View_APAgingDerailedReport] WHERE  ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM [View_APAgingDerailedReport]'              
+ '              
 WHERE Agingday BETWEEN '+@fromval+' AND '+@toval+' AND  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAgingStatusReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAgingStatusReport]
	-- Add the parameters for the stored procedure here
@clientID nvarchar(max)
AS
BEGIN
		SELECT VendorName AS Value1,VendorID AS KeyListID FROM TBL_VENDOR
	    WHERE ClientID=@clientid

			SELECT KeyListID,Value1 FROM  KEYLIST 
	        WHERE KeyID=5003 ORDER BY Value1

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAgingSummaryReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SP_GetAgingSummaryReport 0,10,'VendorName asc','','4','0','2000'
CREATE PROCEDURE [dbo].[SP_GetAgingSummaryReport]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@totalamt NVARCHAR(MAX),
	@balanceamt nvarchar(max),@vendor nvarchar(max),@clientID NVARCHAR(MAX)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @vendor !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
END 

--IF @from !='' AND @to !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND InvoiceDate  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            
--END 


--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
--END

IF @totalamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Totalamt IN ('+@totalamt+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND [1-30DAYS] IN ('+@balanceamt+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' OR [31-60DAYS] IN ('+@balanceamt+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' OR [31-60DAYS] IN ('+@balanceamt+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' OR [61-90DAYS] IN ('+@balanceamt+')'               
END

IF @balanceamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' OR [>90DAYS] IN ('+@balanceamt+')'               
END



SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''VendorList'' AS TableName, [VendorName],[1-30DAYS],[31-60DAYS]        
,[61-90DAYS],[>90DAYS],VendorID,ClientID,Totalamt
 FROM [View_APAgingSummaryReport] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT VendorID) AS Count FROM [View_APAgingSummaryReport]'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllbillLst]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- SP_GetAllbillLst '0',10,'InvoiceNumber asc','2000','2000'
CREATE PROCEDURE [dbo].[SP_GetAllbillLst]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@cutmetid nvarchar(max)
	,@clientID nvarchar(max)
AS
BEGIN
DECLARE @orderbydynamic NVARCHAR(max) ='' 
DECLARE @dynamicsql NVARCHAR(max) =''   

SET @orderByDynamic = ' ORDER BY '+@orderBy

	SET @dynamicsql='SELECT ''BillList'' AS TableName, InvoiceNumber [BillNo],
	[Description],K.Value1 [Billstatus],DueDate,
	 Balance [AmountDue],B.BillID,B.[Status]
	FROM TBL_BILL B
	JOIN KeyList K on K.KeyListID=B.[Status]
	WHERE B.Customer='+ CAST(@cutmetid AS VARCHAR(MAX)) +'
	' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'          
	
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql) 

DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM [TBL_BILL]'              
+ '              
 WHERE  Customer = ' + CAST(@cutmetid AS VARCHAR(MAX)) + '' 
 
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetAPIPaymentDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- SP_GetAPIPaymentDetails 0,2000,'123','345','2020-01-01','2021-12-12'
CREATE PROCEDURE [dbo].[SP_GetAPIPaymentDetails]
	@accountID NUMERIC(18,2)=0,
	@clientID NVARCHAR(MAX),
	@Startvendor NVARCHAR(MAX)='',
	@Endvendor NVARCHAR(MAX)='',
	@Startpaiddte NVARCHAR(MAX),
	@Endpaiddate NVARCHAR(MAX)
AS
BEGIN


IF @Startvendor='' OR @Endvendor=''

BEGIN
SELECT 'Payment' TableName,
	V.ExternalNumber VendorID,
	BA.BillID,
	FORMAT(BA.PaidOn , 'MM/dd/yyyy HH:mm:ss tt') AS [PaymentDate],
	--convert(varchar(24),BA.PaidOn,22) AS [PaymentDate],
	BA.AmountPaid AS [PaymentAmount],
	BA.PaymentReferenceID AS [PaymentReferanceNo]
	--BA.CLIENTID
	FROM Tbl_BillApproved BA
	JOIN Tbl_Vendor V ON BA.VendorID=V.VendorID
	JOIN Tbl_Bill B ON B.Billid=BA.BillID
	WHERE 
	BA.ClientID=@clientID AND BA.PaidOn BETWEEN @Startpaiddte AND @Endpaiddate
	and ExternalNumber <>''-- AND B.IsUpdatedDenali=1
END
ELSE
BEGIN
	SELECT 'Payment' TableName,
	V.ExternalNumber VendorID,
	BA.BillID,
	FORMAT(BA.PaidOn , 'MM/dd/yyyy HH:mm:ss') AS [PaymentDate],
	--convert(varchar(24),BA.PaidOn,22) AS [PaymentDate],
	BA.AmountPaid AS [PaymentAmount],
	BA.PaymentReferenceID AS [PaymentReferanceNo]
	--BA.CLIENTID
	FROM Tbl_BillApproved BA
	JOIN Tbl_Vendor V ON BA.VendorID=V.VendorID
	JOIN Tbl_Bill B ON B.Billid=BA.BillID
	WHERE V.ExternalNumber > @Startvendor AND ExternalNumber < @Endvendor AND 
	BA.ClientID=@clientID AND BA.PaidOn BETWEEN @Startpaiddte AND @Endpaiddate AND 
	B.IsUpdatedDenali=1

	END

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetApplicationUserNames]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetApplicationUserNames]
@clientID NUMERIC(18,0)
AS
BEGIN
		SELECT 'UserName' AS TableName,
		UserName FROM Tbl_Accounts
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApprovalListScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetApprovalListScreenData]          
@ClientID NUMERIC(18,0),          
@accountID NUMERIC(18,0),          
@currentweekstartDate NVARCHAR(MAX),          
@currentweekendDate NVARCHAR(MAX),          
@lastweekstartDate NVARCHAR(MAX),          
@lasttweekendDate NVARCHAR(MAX),          
@today NVARCHAR(MAX),          
@lastDay NVARCHAR(MAX) ,  
@kpiStatus NUMERIC(18,0)          
AS          
BEGIN   
DECLARE @dynamicwhere NVARCHAR(max)=''  
  
IF @kpiStatus !=0  
BEGIN  
SET @dynamicwhere =  @kpiStatus   
END  
  


  SELECT           
     --Un Approved Bill Details          
     (  SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE( A.Status=50016 OR A.Status=50034) AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'UnApprovedBillsCount',           
          
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE ( A.Status=50016 OR A.Status=50034) AND CONVERT(DATE, A.UpdatedOn) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)  AND A.ClientID=@ClientID          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS 'CurrentWeekUnApprovedBillsClount',          
          
      ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE ( A.Status=50016 OR A.Status=50034) AND CONVERT(DATE, A.UpdatedOn) BETWEEN CONVERT(DATE, @lastweekstartDate) AND CONVERT(DATE, @lasttweekendDate) AND A.ClientID=@ClientID          
  AND B.ApproverID=@accountID AND B.StageInitiated=1  ) AS 'LastWeekUnApprovedBillsCount',           
               
   (  SELECT SUM(A.Balance) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE ( A.Status=50016 OR A.Status=50034) AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID) AS 'TotalUnApprovedAmount',          
          
     --Rejected Submission Bills          
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID          
) AS 'RejectedBills',          
          
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50017 AND CONVERT(DATE, A.UpdatedOn) =CONVERT(DATE, @today) AND A.ClientID=@ClientID          
  AND B.ApproverID=@accountID AND B.StageInitiated=1  )  AS 'TodayRejectedCount',          
            
  (  SELECT COUNT(A.BillID)   FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50017 AND CONVERT(DATE, A.UpdatedOn) = CONVERT(DATE, @lastDay) AND A.ClientID=@ClientID          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS'LastDayRejectedApprovedCount',          
             
   ( SELECT SUM(A.Amount)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID          
  ) AS 'RejectedAmount',          
             
   --Approved Submission Bills          
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50015  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID          
) AS 'ApprovedBillsCount',          
               
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50015  AND CONVERT(DATE, A.UpdatedOn) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'CWeekApprovedCount',         
               
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID        
  WHERE  A.Status=50015  AND CONVERT(DATE, A.UpdatedOn) BETWEEN  CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate)          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID  ) AS 'LWeekApprovedCount',          
              
    ( SELECT SUM(A.Amount) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE A.Status=50015 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'ApprovedAmount',          
          
            
             
   --Disputed Bills          
     (SELECT COUNT(A.BillID) AS 'DesputedCount' FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50036  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID  ) AS 'DisputedBills',          
          
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50036  AND CONVERT(DATE, A.UpdatedOn) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'CWeekDisputedCount',          
          
      (   SELECT COUNT(A.BillID) FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE  A.Status=50036  AND CONVERT(DATE, A.UpdatedOn) BETWEEN CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate)          
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID) AS 'LWeekDisputedCount',          
          
    ( SELECT SUM(A.Amount)  FROM Tbl_Bill AS A          
  INNER JOIN BillStageApproval AS B          
  ON A.BillID=B.BillID          
  WHERE A.Status=50036 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'DisputedAmount'          
             
  SELECT A.[BillID]          
      ,A.[VendorID]          
      ,A.[AccountID]          
      ,A.[BillDate]          
      ,A.[Amount]          
      ,A.[InvoiceNumber]     
      ,A.[InvoiceNumber] AS KeyListID    
      ,A.[InvoiceNumber] AS Value1    
      ,A.[DueDate]          
      ,A.[Category]          
      ,A.[Notes]          
      ,A.[PaymentTerms]          
      ,A.[Description]          
      ,A.[Status]            
      ,A.[Balance]          
      ,A.[FileDisplayName]          
      ,A.[PhysicalLocation]          
      ,A.[FileSize]          
      ,A.[FileName]          
      ,B.ApproverID          
      ,B.CurrentStageApproval          
      ,B.StageInitiated,          
      C.Value1 AS 'StatusName'          
      ,D.VendorName           
      ,F.ApprovedAmount          
      FROM [Tbl_Bill] AS A          
      INNER JOIN BillStageApproval AS B          
      ON A.BillID=B.BillID          
      LEFT JOIN KeyList AS C          
      ON C.KeyListID=A.Status          
      LEFT JOIN Tbl_Vendor AS D          
      ON D.VendorID=A.VendorID                    
      LEFT JOIN Tbl_BillApproved As F          
      ON A.BillID=F.BillID          
      WHERE   A.Status !=50019 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID   AND A.[Status] Like '%'+@dynamicwhere+'%'    
      
      
 SELECT VendorID AS KeyListID,VendorName AS Value1 FROM Tbl_Vendor Where ClientID=@clientID      
      
 SELECT KeyID,KeyListID,Value1 FROM Keylist Where Keyid=5005  AND KeylistID!=50019     
      
      
      
END         
        
        
        
        
        
        
        
        
        
        
        
        
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApprovalSummaryBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetApprovalSummaryBillList]
@clientId numeric(18,0)
AS
BEGIN
	select   A.[BillID]
			 , A.[VendorID]
			 ,D.VendorName
			 , A.[AccountID]
			 , A.[BillDate]
			 , A.[Amount]
			 , A.[InvoiceNumber]
			 , A.[DueDate]
			 , A.[Category]
			 , A.[Notes]
			 , A.[PaymentTerms]
			 , A.[Description]
			 , A.[IsSplitted]
			 , A.[Status]
			 , A.[IsActive]
			 , A.[Balance]
			 ,A.[PurchaseOrder]
			 ,A.FileDisplayName,
			 A.FileName,
			 A.PhysicalLocation
			 ,B.Value1 As StatusName,
			 C.Value1 As CategoryName
			 from [dbo].[Tbl_Bill] As A
			 left join [dbo].[KeyList] AS B
			 on A.Status=B.KeyListID and B.KeyID=5005
			 left join [dbo].[KeyList] AS C
			 on A.Category=C.KeyListID and C.KeyID=5002
			 left join Tbl_Vendor AS D
			 On
			 A.VendorID=D.VendorID
			 where not A.Status=50019 and  A.ClientID=@clientId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApprovalSummaryMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetApprovalSummaryMasterData]
@ClientId numeric(18,0)
As
Begin
	Select * from [dbo].[Tbl_Vendor] where ClientID=@ClientId

	Select * from  [dbo].[Tbl_Bill]  where not Status=50019 and  ClientID=@ClientId

	Select * from  [dbo].[KeyList] where  KeyID=5002

	Select * from  [dbo].[KeyList] where not KeyListID=50019 and   KeyID=5005

	select * from KeyList where KeyID=5010

	select * from KeyList where KeyID=5009
	
End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetApprovedBillComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Sp_GetApprovedBillComments]
@billId NUMERIC(18,0),
@ApprovedBillID NUMERIC(18,0)
AS
BEGIN
        SELECT 
		'Comments' AS TableName,
		A.BillID,
		A.Comment, 
		A.CreatedOn
		,'Disputed' AS 'Status',
		ISNULL(B.FirstName,'') +' '+ISNULL(B.LastName,'') AS CommentedBy
		FROM Tbl_BillDisputedHistory AS A
		LEFT JOIN Tbl_Accounts AS B
		ON A.CreatedBy=B.AccountID AND  BillApprovedID=@ApprovedBillID
		WHERE A.BillID=@billId
		
		UNION ALL

		SELECT 
		'Comments' AS TableName,
		A.BillID,
		A.ApproverComment AS 'Comment',
		A.CreatedOn
		,CASE 
		WHEN A.[Status]=50045 THEN 'Approved'
		WHEN A.[Status]=50046 THEN 'Rejected'
		END AS 'Status',
		ISNULL(B.FirstName,'') +' '+ISNULL(B.LastName,'') AS CommentedBy
		FROM TBl_Approvehistory AS A
			LEFT JOIN Tbl_Accounts AS B
		ON A.CreatedBy=B.AccountID
		WHERE A.BillID=@billId
		Order By CreatedOn Desc
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApproverHomeBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetApproverHomeBillList]
AS
BEGIN
--select 'TotalBillAmount' AS TableName,  SUM(amount) As TotalAmount from Tbl_Bill where NOT Status=50019

--select 'UnApprovedBillAmount' AS TableName ,SUM(amount) AS UnApprovedAmount from Tbl_Bill where Status=50016

--select 'ApprovedBillAmount' AS TableName ,SUM(amount) AS ApprovedAmount from Tbl_Bill where Status=50015

--select 'RejectedBillAmount' AS TableName, SUM(amount) AS RejectedAmount from Tbl_Bill where Status=50017

select 
(select sum(amount) from Tbl_Bill where not Status= 50019)  As TotalAmount,
(select sum(Balance) from Tbl_Bill where Status in('50016','50034')) AS UnapprovedAmount,
(Select SUM(ApprovedAmount)  from Tbl_BillApproved where Status=50015) AS ApprovedAmount,
(Select SUM(amount)  from Tbl_Bill where Status=50017) AS RejectedAmount

Select 'UnapprovedBillList' AS TableName, A.[BillID]
									 ,A.[VendorID]
									 ,B.VendorName
									 ,A.[AccountID]
									 ,A.[BillDate]
									 ,A.[Amount]
									 ,A.[InvoiceNumber]
									 ,A.[DueDate]
									 ,A.[Category]
									 ,A.[Notes]
									 ,A.[PaymentTerms]
									 ,A.[Description]
									 ,A.[IsSplitted]
									 ,A.[Status]
									 ,A.[IsActive]
									 ,A.FileDisplayName,
									 A.Balance,
									 A.FileName
									 From Tbl_Bill AS A
									 left join [dbo].[Tbl_Vendor] AS B
									 on
									 A.VendorID=B.VendorID
									 where A.Status in('50016','50034')

select 
(select count(BillID) from Tbl_Bill where not Status= 50019)  As TotalBillCount,
(select count(BillID) from Tbl_Bill where Status in('50016','50034')) As UnapprovedBillCount,
(Select count(BillID)  from Tbl_Bill where Status=50015) AS ApprovedBillCount,
(Select count(BillID)  from Tbl_Bill where Status=50017) AS RejectedBillCount

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApproverHomeScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetApproverHomeScreenData]                    
@ClientID NUMERIC(18,0),                    
@accountID NUMERIC(18,0),                    
@currentweekstartDate NVARCHAR(MAX),                    
@currentweekendDate NVARCHAR(MAX),                    
@lastweekstartDate NVARCHAR(MAX),                    
@lasttweekendDate NVARCHAR(MAX),                    
@today NVARCHAR(MAX),                    
@lastDay NVARCHAR(MAX),                    
@isOverDue NUMERIC(18,0),                    
@startDay NVARCHAR(MAX),                    
@endDay NVARCHAR(MAX)        ,      
@status NUMERIC(18,0)   ,    
@isOnload NUMERIC(18,0)    
AS                    
BEGIN             
DECLARE @dynamicwhere NVARCHAR(max)=''          
IF @status !=0        
BEGIN         
SET @dynamicwhere =@status        
END             
 IF(@isOverDue=0)                    
 BEGIN                    
  SELECT        
     --Un Approved Bill Details                    
     (  SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE( A.Status=50016 OR A.Status=50034)  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'UnApprovedBillsCount',                     
                    
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034) AND   CONVERT(DATE, A.DueDate) =CONVERT(DATE, @today)  AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS 'CurrentDayUnApprovedBillsClount',                    
                    
      ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034) AND   CONVERT(DATE, A.DueDate) =CONVERT(DATE, @lastDay) AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1  ) AS 'LastDayUnApprovedBillsCount',                     
                         
   (  SELECT SUM(A.Balance) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034) AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'TotalUnApprovedAmount',                    
                    
  --Disputed Bills                    
     (SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'DisputedBills',                    
                    
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'CWeekDisputedCount',                    
                    
      (   SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate)       
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID) AS 'LWeekDisputedCount',            
                    
    ( SELECT SUM(A.Amount)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status=50036 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                     
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'DisputedAmount',                    
                    
     --Rejected Submission Bills                    
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A             
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'RejectedBills',                    
                    
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)                    
  AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1  )  AS 'ThisWeekRejectedCount',                    
                      
  (  SELECT COUNT(A.BillID)   FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017   AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate)                     
  AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS'LastWeekRejectedCount',                    
                       
   ( SELECT SUM(A.Balance)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'RejectedAmount',                    
                       
   --Total Submission Bills                    
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)) AS 'TotalBillsCount',                    
                         
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  CONVERT(DATE, A.DueDate) =CONVERT(DATE, @today)                     
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                     
  ) AS 'TodayTotalCount',                    
                         
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  CONVERT(DATE, A.DueDate) =CONVERT(DATE, @lastDay)                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID  ) AS 'LastDayTotalCount',                    
              
    ( SELECT SUM(A.Amount) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  B.ApproverID=@accountID AND B.StageInitiated=1             
  AND A.ClientID=@ClientID                    
  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)            
  ) AS 'TotalAmount'                    
                    
  SELECT A.[BillID]        
      ,A.[VendorID]                    
      ,A.[AccountID]                    
      ,A.[BillDate]                    
      ,A.[Amount]                    
      ,A.[InvoiceNumber]                    
      ,A.[DueDate]                    
      ,A.[Category]                    
      ,A.[Notes]                    
      ,A.[PaymentTerms]                    
      ,A.[Description]                    
      ,A.[Status]                      
      ,A.[Balance]                    
      ,A.[FileDisplayName]                    
      ,A.[PhysicalLocation]                    
      ,A.[FileSize]                    
      ,A.[FileName]                    
   ,B.ApproverID                    
   ,B.CurrentStageApproval                    
   ,B.StageInitiated,                    
   C.Value1 AS 'StatusName'                    
   ,D.VendorName                     
  FROM [Tbl_Bill] AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  LEFT JOIN KeyList AS C                    
  ON C.KeyListID=A.Status                    
  LEFT JOIN Tbl_Vendor AS D                    
  ON D.VendorID=A.VendorID                    
  WHERE   A.Status !=50019 AND B.ApproverID=@accountID AND B.StageInitiated=1                     
  AND A.ClientID=@ClientID AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)       
  AND A.Status Like '%'+@dynamicwhere+'%'      
                    
   --SELECT YEAR(A.DueDate) AS 'Year',MONTH(A.DueDate) AS 'Month',SUM(A.Balance) AS 'Amount',A.Status AS 'Status'                    
   --  FROM Tbl_Bill AS A                    
   --  INNER JOIN   BillStageApproval AS B                    
   --  ON A.BillID=B.BillID                    
   --  WHERE  A.Status in('50036','50017','50016')                     
   --  AND B.ApproverID=@accountID AND A.ClientID=@ClientID AND B.StageInitiated=1                    
   --  AND CONVERT(DATE,A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)                    
   --  GROUP BY YEAR(A.DueDate),MONTH(A.DueDate),A.[STATUS]                 
   IF(@isOnload=0)    
   BEGIN    
    SELECT YEAR(A.DueDate) AS 'Year',MONTH(A.DueDate) AS 'Month', DATEPART(week, A.DueDate) AS 'Week',       
    CASE          
    WHEN A.Status=50036          
    THEN          
    SUM(A.Amount)          
    ELSE          
    SUM(A.Balance)          
    END          
    AS 'Amount',          
    A.Status AS 'Status'                    
     FROM Tbl_Bill AS A                    
     INNER JOIN   BillStageApproval AS B                    
     ON A.BillID=B.BillID                    
     WHERE  A.Status in('50036','50017','50016')                     
     AND B.ApproverID=@accountID AND A.ClientID=@ClientID AND B.StageInitiated=1                    
     AND CONVERT(DATE,A.DueDate) BETWEEN CONVERT(DATE,@startDay) AND CONVERT(DATE,@endDay)    AND A.Status Like '%'+@dynamicwhere+'%'                 
     GROUP BY YEAR(A.DueDate),MONTH(A.DueDate),A.[STATUS] ,DATEPART(week, A.DueDate)       
   END    
   ELSE    
   BEGIN    
    SELECT YEAR(A.DueDate) AS 'Year',MONTH(A.DueDate) AS 'Month',  DATEPART(week, A.DueDate) AS 'Week',             
    CASE          
    WHEN A.Status=50036          
    THEN          
    SUM(A.Amount)          
    ELSE          
    SUM(A.Balance)          
    END          
    AS 'Amount',          
    A.Status AS 'Status'                    
     FROM Tbl_Bill AS A                    
     INNER JOIN   BillStageApproval AS B                    
     ON A.BillID=B.BillID                    
     WHERE  A.Status in('50036','50017','50016')                     
     AND B.ApproverID=@accountID AND A.ClientID=@ClientID AND B.StageInitiated=1                    
     AND CONVERT(DATE,A.DueDate) BETWEEN CONVERT(DATE,CONVERT(DATE, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0))) AND     
  CONVERT(DATE,CONVERT(DATE,  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)))    
  AND A.Status Like '%'+@dynamicwhere+'%'                 
     GROUP BY YEAR(A.DueDate),MONTH(A.DueDate),A.[STATUS] ,DATEPART(week, A.DueDate)       
   END    
             
  END                    
  ELSE                    
  BEGIN                    
  SELECT        
     --Un Approved Bill Details                    
     (  SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE( A.Status=50016 OR A.Status=50034) AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                     
  AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'UnApprovedBillsCount',                     
                    
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034) AND  CONVERT(DATE, A.DueDate) =CONVERT(DATE, @today) AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS 'CurrentDayUnApprovedBillsClount',                    
                    
      ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034)  AND CONVERT(DATE, A.DueDate) =CONVERT(DATE, @lastDay)AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1  ) AS 'LastDayUnApprovedBillsCount',                     
                   
   (  SELECT SUM(A.Balance) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE ( A.Status=50016 OR A.Status=50034) AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'TotalUnApprovedAmount',                    
                    
  --Disputed Bills                    
     (SELECT COUNT(A.BillID) AS 'DesputedCount' FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                      
  AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'DisputedBills',                    
                    
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate)                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID ) AS 'CWeekDisputedCount',                    
                    
      (   SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50036  AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate)                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID) AS 'LWeekDisputedCount',                    
                    
    ( SELECT SUM(A.Amount)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status=50036 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                 
  AND Convert(Date,A.DueDate)<Convert(Date,GETDATE())) AS 'DisputedAmount',                    
                       
                    
     --Rejected Submission Bills                    
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
 AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'RejectedBills',          
                    
     ( SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017 AND  CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@currentweekstartDate) AND CONVERT(DATE,@currentweekendDate) AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1  )  AS 'ThisWeekRejectedCount',                    
                      
  (  SELECT COUNT(A.BillID)   FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017 AND CONVERT(DATE, A.DueDate) BETWEEN CONVERT(DATE,@lastweekstartDate) AND CONVERT(DATE,@lasttweekendDate) AND A.ClientID=@ClientID                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 ) AS'LastWeekRejectedCount',                    
                       
   ( SELECT SUM(A.Balance)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE  A.Status=50017 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'RejectedAmount',                    
                       
  --Total Submission Bills                    
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'TotalBillsCount',                    
                         
     ( SELECT COUNT(A.BillID)  FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  CONVERT(DATE, A.DueDate) =CONVERT(DATE, @today)                     
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                     
  ) AS 'TodayTotalCount',                    
                         
     (SELECT COUNT(A.BillID) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  CONVERT(DATE, A.DueDate) =CONVERT(DATE, @lastDay)                    
  AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID  ) AS 'LastDayTotalCount',                    
                        
    ( SELECT SUM(A.Amount) FROM Tbl_Bill AS A                    
  INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  WHERE A.Status in('50015','50017','50016','50033','50018','50034','50036','50044')  AND             
  B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID                    
  AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)) AS 'TotalAmount'                    
                      
  SELECT A.[BillID]       
      ,A.[VendorID]                  
      ,A.[AccountID]                    
      ,A.[BillDate]                    
      ,A.[Amount]                    
      ,A.[InvoiceNumber]                    
      ,A.[DueDate]                    
      ,A.[Category]                    
      ,A.[Notes]                    
      ,A.[PaymentTerms]                    
      ,A.[Description]                    
      ,A.[Status]                      
      ,A.[Balance]                    
      ,A.[FileDisplayName]                    
      ,A.[PhysicalLocation]                    
      ,A.[FileSize]                    
      ,A.[FileName]                    
   ,B.ApproverID                    
   ,B.CurrentStageApproval                    
   ,B.StageInitiated,                    
   C.Value1 AS 'StatusName'                    
   ,D.VendorName                     
  FROM [Tbl_Bill] AS A                    INNER JOIN BillStageApproval AS B                    
  ON A.BillID=B.BillID                    
  LEFT JOIN KeyList AS C                    
  ON C.KeyListID=A.Status                    
  LEFT JOIN Tbl_Vendor AS D                    
  ON D.VendorID=A.VendorID                    
  WHERE   A.Status !=50019 AND B.ApproverID=@accountID AND B.StageInitiated=1 AND A.ClientID=@ClientID AND CONVERT(DATE,A.DueDate)<CONVERT(DATE,@today)      
   AND A.Status Like '%'+@dynamicwhere+'%'      
                      
   SELECT YEAR(A.DueDate) AS 'Year',MONTH(A.DueDate) AS 'Month', DATEPART(week, A.DueDate) AS 'Week',                 
   CASE          
    WHEN A.Status=50036          
    THEN          
    SUM(A.Amount)          
    ELSE          
    SUM(A.Balance)          
    END          
    AS 'Amount',          
     A.Status AS 'Status'                    
     FROM Tbl_Bill AS A                    
     INNER JOIN   BillStageApproval AS B                    
     ON A.BillID=B.BillID                    
     WHERE  A.Status in('50036','50017','50016')                     
     AND B.ApproverID=@accountID AND A.ClientID=@ClientID AND B.StageInitiated=1                    
     AND CONVERT(DATE,A.DueDate) <CONVERT(DATE,@today)      AND A.Status Like '%'+@dynamicwhere+'%'               
     GROUP BY YEAR(A.DueDate),MONTH(A.DueDate),A.[STATUS]  ,DATEPART(week, A.DueDate)                    
                      
  END                  
                  
                
                  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetApproverPaginateBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
      
 --SP_GetApproverPaginateBillList 0,10,'DueDate asc',30003,0,2000,0,'0','01/01/2001','12/31/2022',50087,0
CREATE PROCEDURE [dbo].[SP_GetApproverPaginateBillList]             
@start INT,            
@skip INT,            
@orderby NVARCHAR(max),             
@accountID NUMERIC(18,0),        
@status NUMERIC(18,0),        
@clientID NUMERIC(18,0)  ,      
@vendor NUMERIC(18,0)    ,        
@invoiceNumber NVARCHAR(max),                 
@dueFrom NVARCHAR(MAX),              
@dueTo NVARCHAR(MAX),           
@dStatus NUMERIC(18,0) ,      
@kpiStatus NUMERIC(18,0)       
AS            
BEGIN            
            
DECLARE @dynamicwhere NVARCHAR(max)=''            
DECLARE @dynamicsql NVARCHAR(max) =''            
DECLARE @orderbydynamic NVARCHAR(max) =''        
        
IF @status!=0        
BEGIN        
SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '            
END        
ELSE      
BEGIN      
IF @dStatus!=0      
SET @dynamicwhere = @dynamicwhere + ' AND Status in ('''+CAST(@status AS VARCHAR(MAX))+''','''+CAST(@dStatus AS VARCHAR(MAX))+''')  '        
END      
      
IF @vendor !=0        
BEGIN        
SET @dynamicwhere = @dynamicwhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '        
END        
        
IF @invoiceNumber !='0'        
BEGIN        
SET @dynamicwhere = @dynamicwhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '        
END        
        
--IF @dStatus !=0  AND @status!=0       
--BEGIN        
--SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '        
--END        
        
IF @dueFrom !='' AND @dueTo !=''                      
BEGIN                          
SET @dynamicwhere = @dynamicwhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                          
END       
    
IF @kpiStatus !=0      
 BEGIN      
 SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@kpiStatus AS VARCHAR(MAX))+'  '        
 END      
 ELSE IF @kpiStatus =0  AND @dStatus !=0      
 BEGIN      
 SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '        
 END      
        
        
SET @orderByDynamic = ' ORDER BY '+@orderBy            
            
 SET @dynamicsql=' SELECT ''BillList'' AS TableName,  [BillID],[VendorID],[AccountID],[BillDate],[Amount],[InvoiceNumber],[DueDate],[Category] ,[Notes],[PaymentTerms],[Description]        
      ,[Status],[Balance],[FileDisplayName],[PhysicalLocation] ,[FileSize],[FileName],[ApproverID] ,[CurrentStageApproval]        
      ,[StageInitiated],[StatusName],[VendorName] ,[ApprovedAmount],StageName ,PaymentMode ,IsSplitted      
  FROM [View_ApproverBillRead]   WHERE ApproverID = '+ CAST(@accountID AS VARCHAR(MAX)) +' AND ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '+         
+  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '            
+ Cast(@start AS NVARCHAR(max))            
+ ' ROWS FETCH NEXT '            
+ Cast(@skip AS NVARCHAR(max))            
+ ' ROWS ONLY'            
            
PRINT ( @dynamicsql )            
            
EXEC(@dynamicsql)            
            
DECLARE            
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM View_ApproverBillRead'            
+ '            
 WHERE ApproverID = '+ CAST(@accountID AS VARCHAR(MAX)) +' AND ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '        
 + @dynamicwhere        
PRINT( @dynamiccountsql )            
            
EXEC(@dynamiccountsql)    
  
  
--GetTab Counts  
  
  
DECLARE @dynamicTabCountWhere NVARCHAR(max)=''    
  
IF  @dStatus !=0      
BEGIN      
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '        
END    
  
IF @dueFrom !='' AND @dueTo !=''                      
BEGIN                          
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''     
END    
  
IF @vendor !=0        
BEGIN        
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '        
END        
        
IF @invoiceNumber !='0'        
BEGIN        
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '        
END   
  
DECLARE                
@dynamicTabCountSql NVARCHAR(max) = 'SELECT ''SearchedTabCounts'' AS TableName,  
 (Select Count(DISTINCT BillID) FROM View_ApproverBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' AND ApproverID= '+ CAST(@accountID AS VARCHAR(MAX)) + '  
 AND Status  in (''50015'',''50016'',''50017'',''50018'',''50044'',''50034'',''50036'',''50087'')  ' +  @dynamicTabCountWhere+ ')AS ''AllCount'',  
 (Select Count(DISTINCT BillID) FROM View_ApproverBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' AND ApproverID= '+ CAST(@accountID AS VARCHAR(MAX)) + '  
 AND Status ='+ CAST(50016 AS VARCHAR(MAX)) + '  ' +  @dynamicTabCountWhere + ') AS ''AwaitingCount'',  
 (Select Count(DISTINCT BillID) FROM View_ApproverBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' AND  ApproverID= '+ CAST(@accountID AS VARCHAR(MAX)) + '  
 AND Status ='+ CAST(50036 AS VARCHAR(MAX)) + ' ' +  @dynamicTabCountWhere + ') AS ''DisputedCount'''  
  
PRINT( @dynamicTabCountSql )                
                
EXEC(@dynamicTabCountSql)    
            
END       




GO
/****** Object:  StoredProcedure [dbo].[SP_GetAuditlog]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_GetAuditlog 0,10,'TimeStamp asc',2000,'0','','0','0','01/01/2000','01/01/2025'
CREATE PROCEDURE [dbo].[SP_GetAuditlog]
	@start INT,@skip INT,@orderby NVARCHAR(max),@clientID NUMERIC(18,0),
	@activity nvarchar(max),@description nvarchar(max),@screen nvarchar(max),@user nvarchar(max),
	@from nvarchar(max),@to nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @activity !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Activity IN ('''+@activity+''')'               
END 

IF @description !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Description IN ('''+@description+''')'               
END 

IF @screen !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND ScreenName IN ('''+@screen+''')'               
END

IF @user !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND UserId IN ('+@user+')'               
END



IF @from !='' AND @to !=''                        
BEGIN                            
SET @dynamicwhere = @dynamicwhere + ' AND [DATE]  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            
END  

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''AuditList'' AS TableName,[TimeStamp],[Activity]        
,[Description],[User],[SystemIp],[ClientId],[UserId],Logid,ScreenName
 FROM [View_Auditlog] WHERE ClientId= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT Logid) AS Count FROM [View_Auditlog]'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillApprovalDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillApprovalDetails]
--@accountId numeric(18,0),
@clientId numeric(18,0),
@billId numeric(18,0)
AS
Begin
	Declare @VENDORID as numeric(18,0)=0;
		IF Exists(Select * from Tbl_Bill where BillID=@billId)
		Begin
				Set @VENDORID=(Select VendorId from Tbl_Bill where BillID=@billId)
				Select	'BillDetails' As TableName,	 A.[BillID]
							,A.[VendorID]
							,B.VendorName
							,A.[AccountID]
							,C.FirstName
							,A.[BillDate]
							,A.[Amount]
							,A.[InvoiceNumber]
							,A.[DueDate]
							,A.[Category]
							,A.[Notes]
							,A.[PaymentTerms],
							A.PurchaseOrder,
							A.ClientID,
							A.FileSize,
							D.Value1 as PaymentTermName
							,A.[Description]
							,A.[IsSplitted]
							,A.[Status]
							,A.[Balance]					
							,A.[FileName]
							,A.PhysicalLocation
							,A.FileDisplayName
							,E.Amount AS BreakageAmount,
							 E.BillBreakageID,
							 E.Description As BreakageDescription
							 ,E.BillType AS BreakageType,
							 F.Value1 AS BreakageTypeName
							  ,E.BillType AS BillBreakageStatus
							,A.[UserComment] from Tbl_Bill AS A
							left join Tbl_Vendor As B 
							On A.VendorID=B.VendorID
							left join Tbl_Accounts As C
							On A.AccountID=C.AccountID
							left join KeyList AS D
							on A.PaymentTerms = D.KeyListID and KeyID=5003
							inner join Tbl_BillBreakage AS E
							on A.BillID=E.BillID
							left Join KeyList AS F
							On E.BillType=F.KeyListID and F.KeyID=5007
							Where A.BillID=@billId and A.ClientID=@clientId 

		End

		IF Exists(Select * from [Tbl_BillApproved]  where BillID=@billId)
		Begin
				Select  TOP(5) 'RecentBillPayment' as TableName,A.[IdentityID],A.[BillID],A.[PaidOn],A.[ApprovedAmount],A.[PayableAmount],A.CreatedOn,
												B.InvoiceNumber
												from [dbo].[Tbl_BillApproved] AS A
												INNER JOIN Tbl_Bill AS B
												ON A.BillID=B.BillID
												Where  A.PaymentStatus=50026 AND A.BillId=@billId  order by A.CreatedOn desc
		End
		ELSE
		Begin

		Select  TOP(5) 'RecentVendorPayment' as TableName,A.[IdentityID],
												A.[BillID],A.[PaidOn],A.[ApprovedAmount],A.[PayableAmount],A.CreatedOn,B.InvoiceNumber from [Tbl_BillApproved] AS A
												INNER JOIN Tbl_Bill AS B
												ON A.BillID=B.BillID
												Where A.PaymentStatus=50026 AND A.[VendorID]=@VENDORID order by A.CreatedOn desc
		End


End
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillAttatchmentDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillAttatchmentDetails]
@billId numeric(18,0),
@AccountId numeric(18,0),
@ClientId numeric(18,0)
AS
Begin
		select [BillID], [VendorID],[AccountID],[FileDisplayName],[PhysicalLocation],[FileSize],FileName
		from Tbl_Bill where ClientID=@ClientId and @AccountId=AccountID and BillID=@billId

End
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillCategoryList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetBillCategoryList]  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
    SELECT 'Categories' AS TableName,  
    A.[IdentityID]  
               ,A.[ClientID]  
               ,A.[GLNumber]  
               ,A.[GLDescription]  
               ,A.[RowStatus]  
               ,A.[CreatedBy]  
			   ,CONVERT(VARCHAR(10), A.[CreatedOn], 103) [CreatedOn]
              --,A.[CreatedOn]  
               ,A.[UpdatedBy]  
               ,A.[UpdatedOn]  
               ,A.[Category]  
               ,A.[SubCategory]  
               ,A.[MasterGLCode]  
               ,A.[IsMasterGLCode]  
               ,A.[CategoryName]  
               ,A.[IsActive]   
      ,(ISNULL(B.FirstName,'')+' '+ ISNULL(B.LastName,'')) AS CreatedByName  
      ,CASE  
     When A.IsActive=0 THEN 'Inactive'  
     WHEN A.ISActive=1 Then 'Active'  
     END  
     AS 'StatusByName'  
      FROM Tbl_GlCodes AS A  
      LEFT JOIN Tbl_Accounts AS B  
      ON A.CreatedBy=B.AccountID  

	  Where A.ClientId=@clientID
  
  
  
  
  
  
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillCategoryStatus]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_GetBillCategoryStatus]
AS
BEGIN
		Select 'StatusList' As TableName, KeyId,KeyListID,Value1 FROM KeyList Where Keyid=5022


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetBillComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Sp_GetBillComments 24875
CREATE PROCEDURE [dbo].[Sp_GetBillComments]
@billId NUMERIC(18,0),@accountId NUMERIC(18,0)
AS
BEGIN
        SELECT 
		'Comments' AS TableName,
		A.BillID,
		A.Comment, 
		A.IdentityID AS RowID,
		@accountId as UserID,
		 A.CreatedBy,
		FORMAT(A.CreatedOn,'MMM dd yyyy hh:mm:s tt') AS CreatedOn
		,'Disputed' AS 'Status',
		ISNULL(B.FirstName,'') +' '+ISNULL(B.LastName,'') AS CommentedBy
		FROM Tbl_BillDisputedHistory AS A
		LEFT JOIN Tbl_Accounts AS B
		ON A.CreatedBy=B.AccountID
		WHERE A.BillID=@billId
		
		UNION ALL

		SELECT 
		'Comments' AS TableName,
		A.BillID,
		A.ApproverComment AS 'Comment',
		A.ApproveHistoryID AS RowID,
		@accountId as UserID,
		 A.CreatedBy,
		FORMAT(A.CreatedOn,'MMM dd yyyy hh:mm:s tt') AS CreatedOn
		,CASE 
		WHEN A.[Status]=50045 THEN 'Approved'
		WHEN A.[Status]=50046 THEN 'Rejected'
		END AS 'Status',
		ISNULL(B.FirstName,'') +' '+ISNULL(B.LastName,'') AS CommentedBy
		FROM TBl_Approvehistory AS A
			LEFT JOIN Tbl_Accounts AS B
		ON A.CreatedBy=B.AccountID
		WHERE A.BillID=@billId and A.ApproverComment <> ''
		--Order By CreatedOn Desc
		UNION ALL

		   SELECT 
		'Comments' AS TableName,
		A.BillID AS BillID,
		A.Commant AS Comment, 
		A.BillCommentID AS RowID,
		@accountId as UserID,
		 A.CreatedBy,
		FORMAT(A.CreatedOn,'MMM dd yyyy hh:mm:s tt') AS CreatedOn
		,'BillList' AS 'Status',
		ISNULL(B.FirstName,'') +' '+ISNULL(B.LastName,'') AS CommentedBy
		FROM tbl_BillListComments AS A
		LEFT JOIN Tbl_Accounts AS B
		ON A.CreatedBy=B.AccountID
		WHERE A.BillID=@billId
	
END


--select * from TBl_Approvehistory order by 1 desc
--select * from Tbl_BillDisputedHistory order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillData2Export]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
--Use  [BillManagement_Developement_V2]--[BillManagement_Testing_V2]      
--Exec SP_GetBillData2Export '2021/04/01','2021/04/30',0,2000      
      
CREATE PROCEDURE [dbo].[SP_GetBillData2Export]          
@SDueDate NVARCHAR(MAX),          
@EDueDate NVARCHAR(MAX),          
@PmtSts Numeric(18,0),          
@clientID NUMERIC(18,0)          
AS          
BEGIN       
DECLARE @dynamicwhere NVARCHAR(max)=''            
            
IF @PmtSts !=0            
BEGIN            
SET @dynamicwhere =  @PmtSts             
END        
          
   select 'BillData' AS TableName, A.[BillID] , 'H'  + char(9) +           
     isnull(ExternalNumber,'') + char(9) +          
     B.InvoiceNumber + char(9) +          
     '' + char(9) +           
     replace(replace(isnull(B.Description,''),char(13),''),char(10),' ')   + char(9) +           
     isnull(B.PurchaseOrder,'')  + char(9) +           
     isnull(C.Address1,'')  + char(9) +           
     isnull(C.Address2,'')  + char(9) +           
     isnull(C.State,'')  + char(9) +           
     isnull(C.PostalCode,'')  + char(9) +           
     '' + char(9) +           
     '0' + char(9) +           
     '0' + char(9) +           
     '1' + char(9) +           
     isnull(convert(varchar(10),B.BillDate,101) ,'')  + char(9) +           
     isnull(convert(varchar(10),B.DueDate,101) ,'')  + char(9) +                
     isnull(convert(varchar(10),B.DueDate,101) ,'')  + char(9) +           
     ''  + char(9) +                
     isnull(convert(varchar(10),B.DueDate,101) ,'')  + char(9) +           
     ''  + char(9) +           
     ''  + char(9) +           
     ''  + char(9) +           
     ''  + char(9) +           
     ''  + char(9) +           
     ''  + char(9) +           
     ''  + char(9)  AS 'BillAddress'          
   from Tbl_BillApproved as A          
          left join Tbl_Bill As B          
          On A.BillID=B.BillID          
          left join Tbl_Vendor As C          
          On A.VendorID=C.VendorID          
          where A. PaymentStatus like '%'+@dynamicwhere+'%'          
          -- in (50023,50026 )          
          and B.DueDate between @SDueDate and @EDueDate          
          and B.clientid =  @clientID          
          
       select 'BreakageData' AS TableName,  A.[BillID] ,           
       'D'  + char(9) +                   
       '1'  + char(9) +           
       replace(replace(isnull(B.Description,''),char(13),''),char(10),' ')  + char(9) +           
       isnull(C.GLCode,'') + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       isnull(convert(varchar(10),B.BillDate,101) ,'')  + char(9) +           
       ''  + char(9) +           
       isnull(cast(A.ApprovedAmount as varchar),'')  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9)  AS 'BreakageInfo'          
       from          
         Tbl_BillApproved as A          
          left join Tbl_Bill As B          
          On A.BillID=B.BillID          
          left join Tbl_Vendor As C          
          On A.VendorID=C.VendorID                                                 
          where  A. PaymentStatus  like '%'+@dynamicwhere+'%'           
          --in (50023,50026 )          
          and IsSplitted =50014          
          and B.duedate between @SDueDate and @EDueDate          
          and B.clientid =  @clientID          
          
          union all          
      select 'BreakageData' AS TableName, A.[BillID] ,            
       'D'  + char(9) +                   
       '1'  + char(9) +           
       replace(replace(isnull(B.Description,''),char(13),''),char(10),' ')  + char(9) +           
       isnull(cast(C.BillType as nvarchar(max)),'') + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       isnull(convert(varchar(10),B.BillDate,101) ,'')  + char(9) +           
       ''  + char(9) +           
       isnull(cast(C.Amount as varchar),'')  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9) +           
       ''  + char(9)  AS 'BreakageInfo'          
       from           
        Tbl_BillApproved as A          
          left join Tbl_Bill As B          
          On A.BillID=B.BillID          
          left join Tbl_BillBreakage As C          
          On A.BillID=C.BillID                                                 
          where  A.PaymentStatus like '%'+@dynamicwhere+'%'          
          --in (50023,50026 )          
          and C.billtype<>'0'          
     and B.duedate between @SDueDate and @EDueDate          
          and B.clientid =  @clientID          
          
END          
        
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillDataToDelnali]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
      
    
                
--Use  [BillManagement_Developement_V2]--[BillManagement_Testing_V2]                    
--Exec SP_GetBillDataToDelnali 2000 ,'2020-01-01','2021-06-30',1                   
                    
CREATE PROCEDURE [dbo].[SP_GetBillDataToDelnali]                        
@clientID NUMERIC(18,0) ,            
@startDate NVARCHAR(MAX),            
@endDate NVARCHAR(MAX) ,      
@accountID NUMERIC(18,0)      
AS                        
BEGIN                              
                        
   select 'BillData' AS TableName,             
   A.[BillID] ,            
   C.ExternalNumber,            
   B.InvoiceNumber,            
   B.PurchaseOrder,            
   C.Address1,            
   C.City,            
   C.State,            
   C.PostalCode,            
   B.Createdon BillDate ,--B.BillDate,            
   B.DueDate              
   from Tbl_BillApproved as A                        
   left join Tbl_Bill As B                        
   On A.BillID=B.BillID                        
   left join Tbl_Vendor As C                        
   On A.VendorID=C.VendorID                        
   where B.clientid =  @clientID AND( B.[IsUpdatedDenali] IS NUll  OR B.[IsUpdatedDenali]=0)          
   AND convert(varchar(10),B.CreatedOn,112) BetWeen convert(varchar(10),convert(date,@startDate),112) AND convert(varchar(10),convert(date,@endDate),112)                     
          
               
   select 'BreakageData' AS TableName,             
   A.[BillID] ,             
   B.Description,             
   D.GLNumber AS 'GlCode',           
   B.Createdon BillDate ,--B.BillDate,            
   A.ApprovedAmount FROM            
   Tbl_BillApproved as A                        
   left join Tbl_Bill As B                        
   On A.BillID=B.BillID                        
   left join Tbl_Vendor As C                        
   On A.VendorID=C.VendorID  
   LEFT JOIN Tbl_GlCodes AS D  
   ON CONVERT(VARCHAR(50),C.GlCode)=CONVERT(VARCHAR(50),D.IdentityID)  
   where   IsSplitted =50014                                  
   and B.clientid =  @clientID   AND( B.[IsUpdatedDenali] IS NUll  OR B.[IsUpdatedDenali]=0)                       
   AND convert(varchar(10),B.CreatedOn,112) BetWeen convert(varchar(10),convert(date,@startDate),112)   
   AND convert(varchar(10),convert(date,@endDate),112)                     
            
  union all                        
  select 'BreakageData' AS TableName,            
  A.[BillID] ,            
  B.Description,            
  C.BillType,            
  B.Createdon BillDate ,--B.BillDate,            
  C.Amount                     
  from                         
  Tbl_BillApproved as A                        
  left join Tbl_Bill As B                        
  On A.BillID=B.BillID                        
  left join Tbl_BillBreakage As C                        
  On A.BillID=C.BillID                                                               
  where                          
  C.billtype<>'0'                                    
  and B.clientid =  @clientID    AND( B.[IsUpdatedDenali] IS NUll  OR B.[IsUpdatedDenali]=0)                      
      AND convert(varchar(10),B.CreatedOn,112) BetWeen convert(varchar(10),convert(date,@startDate),112) AND convert(varchar(10),convert(date,@endDate),112)                     
         
      
   declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Bill Details are Pulled'        
 declare @status varchar(150) = 'Sync Completed'        
 insert into tbl_DenaliSync        
 (syncdate,syncby,syncsts,syncDesc)        
 values        
 (getutcdate(),@accountID,@status,@Description)        
                        
END         
      
  
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillDetails]                                
@billId NUMERIC(18,0),                                
@clientId NUMERIC(18,0)                                
AS                            
BEGIN                                
DECLARE @vendorId NUMERIC(18,0)              
  IF EXISTS(SELECT BillId FROM Tbl_Bill WHERE BillID=@billId AND ClientID=@clientId)                                
  BEGIN                                
     --Bill Details                                
                                    
      SELECT A.[BillID]                                
            ,A.[VendorID]                                
            ,A.[AccountID]                                
            ,A.[BillDate]                                
            ,A.[Amount]                                
            ,A.[InvoiceNumber]                                
            ,A.[DueDate]                                
            ,A.[Category]                                
            ,A.[Notes]                                
            ,A.[PaymentTerms]                                
            ,A.[Description]                                
            ,A.[Status]                                
            ,A.[Balance]                                
            ,A.[ClientID]                                
            ,A.[FileDisplayName]                                
            ,A.[PhysicalLocation]                                
            ,A.[FileSize]                                
            ,A.[FileName]                                
            ,A.[UserComment]                                
            ,A.[PurchaseOrder]                                
            ,A.[IsChallenged]                                
            ,A.[IsRecurring]                                
            ,A.[RecurrenceReferenceId]                                
            ,A.[IsReminder]                                
            ,A.[ReminderEmail]                                
            ,A.[ReminderInterval]                                
            ,A.[ReminderIntervalDay]                            
         ,A.CreatedOn                          
         ,A.UpdatedOn                          
         ,A.CreatedBy                          
         ,B.VendorName                                
         ,C.Value1 AS StatusName                                
         ,D.Value1 AS ReminderIntervalName                                
         ,E.Value1 AS PaymenttermName                                
         ,F.ApprovedAmount                            
         ,(ISNULL(G.FirstName,'')+' '+ISNULL(G.LastName,'')) AS ClerkName             
         ,(SELECT  [value]  FROM [dbo].[fn_GetPaymentReferenceId](A.BillID))AS PaymentReferenceID,          
         ( SELECT SUM(AmountPaid) FROM Tbl_BillApproved Where BillID=A.BillID) AS AmountPaid          
         ,( SELECT SUM(AmountDue) FROM Tbl_BillApproved Where BillID=A.BillID) AS AmountDue          
         ,F.[PaymentMethod],            
          H.[Value1] AS PaymentMode,            
          F.[PaidOn]      ,      
    I.CustomerName,      
    J.ProjectName      
 ,K.CategoryName    
  ,L.Value1 AS 'StrTypeOfPayment'
        FROM [Tbl_Bill] AS A                                
        LEFT JOIN Tbl_Vendor AS B                                
        ON A.VendorID =B.VendorID                                
        LEFT JOIN KeyList AS C                                
        ON A.Status=C.KeyListID                                
        LEFT JOIN KeyList AS D                                
        ON A.ReminderInterval=D.KeyListID AND D.KeyID=5015                                
        LEFT JOIN KeyList As E                                
        ON A.PaymentTerms =E.KeyListID AND E.KeyID=5003                                
        LEFT JOIN Tbl_BillApproved As F                                
        ON A.BillID=F.BillID                          
        LEFT JOIN Tbl_Accounts AS G                        
        ON A.CreatedBy=G.AccountID             
  LEFT JOIN Keylist As H        
  ON F.PaymentMode=H.KeylistID AND H.Keyid=5021       
  LEFT JOIN Tbl_Customers AS I      
  ON A.Customer = I.CustomerId      
  LEFT JOIN Tbl_Projects AS J      
  ON A.Project=J.ProjectID      
  LEFT JOIN Tbl_GlCodes AS K    
  ON A.BillCategory=K.IdentityID    
     LEFT JOIN KeyList AS L    
   ON F.[TypeOfPayment]=L.KeylistID AND L.KeyID=5020    

        WHERE A.BillID =@billId AND A.ClientID=@clientId                                
                                
     --Bill Descriptions                                
                                      
      SELECT * FROM [dbo].[Tbl_BillDescription] WHERE BillID=@billId                                
                                
     --split Amounts           
                                      
      SELECT A.[BillBreakageID]                                
         ,A.[BillID]                                
         ,A.[Amount]                                
         ,A.[Description]           
         ,A.[BillType]                                
         ,A.[Status]                                 
        ,ISNULL(B.[GLNumber],'')+' - '+ISNULL(B.[GLDescription],'') AS 'BillTypeName'                                   
--  ,B.[GLDescription] AS BillTypeName   
,A.GLAccountID  
   FROM [dbo].[Tbl_BillBreakage] AS A                                
       LEFT JOIN [dbo].[Tbl_GlCodes] AS B                                
      ON A.GLAccountID=B.[IdentityID]  AND B.ClientID=@clientID                             
         WHERE A.BillID=@billId                                
             
     --Approvers --3                                
        SELECT        A.[BillStageApprovalID]                                
         ,A.[BillID]                                
         ,A.[ApproverID]                                
         ,A.[Sequence]                                
 ,B.FirstName                                
         ,B.LastName                          
   ,A.ApprovedAmount                      
           FROM [BillStageApproval] AS A                                
           LEFT JOIN Tbl_Accounts AS B                   
           ON A.ApproverID=B.AccountID                                
           WHERE A.BillID=@billId                                
                                
     --Recurrence Details --4                                
                      
      SELECT  A.[RecurrenceId]                                
       ,A.[StartDate]                                
       ,A.[EndDate]                                
       ,A.[Frequency]                                
       ,C.Value1 AS FrequencyName                                
       FROM [dbo].[Tbl_Recurrence] AS A                                
       INNER JOIN Tbl_Bill AS B                                
       ON A.RecurrenceId=B.[RecurrenceReferenceId]                                
       LEFT JOIN KeyList AS C                                 
       ON A.Frequency=C.KeyListID AND C.KeyID=5016                                
       WHERE B.BillID=@billId                                
                                
     --Documents --5                                
                                
     SELECT  A.[AttatchmentId]                                
         ,A.[BillID]                                
         ,A.[FileName]                                
         ,A.[PhysicalFileName]                                
         ,A.[Size]                                
         ,A.[PhysicalPath]                                
         ,A.[Extension]                                
            ,A.[CreatedOn]                                
                             ,A.[CreatedBy]                                
        ,B.FirstName                                
        ,B.LastName                               
                           FROM [Tbl_BillAttachments] AS A                                
         INNER JOIN  Tbl_Accounts AS B                                
         ON A.CreatedBy=B.AccountID                 
         WHERE A.BillID=@billId                                
                                
         --Notes --6                                
           SELECT   A.[BillCommentID]                                
      ,A.[BillID]      
          ,A.[Comment]                                
          ,A.[CreatedOn]                                
          ,A.[CommentBy]                                
          ,A.[CommentOn]                                
          ,B.FirstName                                
          ,B.LastName                                
                       FROM   [Tbl_BillComments] AS A                            
        LEFT JOIN Tbl_Accounts AS B                                
        ON A.CommentBy=B.AccountID                                
        WHERE A.BillID=@billId                                
                                
          --Approver History--7                                
                                
    --       SELECT  A.[ApproveHistoryID]                                
    --   ,A.[BillID]                                
    --   ,A.[ApproverComment]                                
    --   ,A.[ApproverID]                                
    --   ,A.[Status]                                
    --   ,A.[CreatedOn]                                
    --   ,B.FirstName                                
    --   ,B.LastName                                
    --   --,D.Balance                                
    --   ,D.Amount              
    --   ,C.Value1 As StatusName                                
    --   ,E.ApprovedAmount                    
    --   ,(D.Amount-E.ApprovedAmount) AS Balance                    
    --        FROM [Tbl_ApproveHistory] AS A                                
    --         LEFT JOIN Tbl_Accounts AS B                                
    --         ON A.ApproverID=B.AccountID                                
    --         LEFT JOIN KeyList As C                                
    --         ON A.Status=C.KeyListID AND C.KeyID=5014                                
    --         INNER JOIN Tbl_Bill AS D                                
    --         ON A.BillID=D.BillID                         
    --INNER JOIN [dbo].[BillStageApproval] As E                    
    --ON A.BillID=E.BillID                     
    --   --INNER JOIN Tbl_BillApproved AS E                                
    --   --ON A.BillID=E.BillID                                
    --         WHERE A.BillID=@billId                          
                 
                 
         SELECT Distinct  A.[ApproveHistoryID]                        
       ,A.[ApproverComment]                        
       ,A.[ApproverID]                      
    ,A.[Status]                        
       ,A.[CreatedOn]                        
       ,B.FirstName                     
       ,B.LastName                        
       ,A.BalanceAmount AS Balance                        
       ,D.Amount                        
       ,C.Value1 As StatusName                        
       ,A.ApprovedAmount                        
       FROM [Tbl_ApproveHistory] AS A                        
       LEFT JOIN Tbl_Accounts AS B                        
       ON A.ApproverID=B.AccountID                        
       LEFT JOIN KeyList As C                        
       ON A.Status=C.KeyListID AND C.KeyID=5014                        
       INNER JOIN Tbl_Bill AS D                        
       ON A.BillID=D.BillID                        
       --INNER JOIN Tbl_BillApproved AS E                        
       --ON A.BillID=E.BillID                        
       WHERE A.BillID=@billId                 
                                        
        --RecentPayments --8                                
                                
      SET @vendorId=(SELECT Top(1) VendorID FROM Tbl_Bill Where BillID=@billId)              
                        
        SELECT TOP(5) A. [IdentityID]                        
         ,A.[BillID]                     
         ,A.[ApprovedAmount]                        
         ,A.[PayableAmount]                        
         ,A.[PaymentStatus]                        
         ,A.[PaidOn]                        
         ,A.[VendorID]                 
   ,C.InvoiceNumber              
       FROM [Tbl_BillApproved] AS A                        
       Inner JOIN Tbl_Vendor AS B     
       ON A.VendorID=B.VendorID               
    Left Join Tbl_Bill AS C              
    On A.BillId=C.BillId              
       WHERE A.VendorID=@vendorId AND A.[PaymentStatus]=50044              
              
  Select * from TBl_BillPaidAttachments Where BillId=@billID          
        END                
            
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillDueBasedReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SP_GetBillDueBasedReport 0,10,'VendorName asc',2000,'0','','2020/01/01','2020/12/01','','','0','0'
CREATE PROCEDURE [dbo].[SP_GetBillDueBasedReport]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@clientID NUMERIC(18,0)=2000,
	@vendor nvarchar(max),@dueindays nvarchar(max),@duefrom nvarchar(max),@dueTo nvarchar(max),
	@from nvarchar(max),@to nvarchar(max),@approvalstatus nvarchar(max),
	@paymentstatus nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @vendor !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
END 

IF @dueindays !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Duedays IN ('''+@dueindays+''')'               
END 

IF @duefrom !='' AND @dueTo !=''                        
BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND InvoiceDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            

SET @dynamicwhere=@dynamicwhere + ' AND InvoiceDate  BETWEEN'''+@duefrom+ ''' and  '''+@dueTo+''''
END 


IF @from !='' AND @to !=''                        
BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            

SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+@from+''' AND '''+@to+''''                            
END

IF @approvalstatus !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Status IN ('+@approvalstatus+')'               
END

IF @paymentstatus !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatusId IN ('+@paymentstatus+')'               
END

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''VendorList'' AS TableName, [VendorName],[InvoiceNumber],[InvoiceDate]        
,[DueDate],[Duedays],OverDuedays,[ApprovalStatus],[Paymentstatus],[Amount],[VendorID],[Status],[PaymentStatusId]    
 ,ClientID
 FROM [View_BillDueBasedReport] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT InvoiceNumber) AS Count FROM [View_BillDueBasedReport]'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillEditDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillEditDetails]
@accountId numeric(18,0),
@clientId numeric(18,0),
@billID numeric(18,0)
AS
BEGIN
		IF EXISTS(Select BillID from Tbl_Bill  where BillID=@billID)
		Begin
		select   A.[BillID]
				 , A.[VendorID],
				  B.VendorName,
				  A.[AccountID]
				 , A.[BillDate]
				 , A.[Amount]
				 , A.[InvoiceNumber]
				 , A.[DueDate]
				 , A.[Category]
				 , A.[Notes]
				 , A.[PaymentTerms]
				 , A.[Description]
				 , A.[IsSplitted]
				 , A.[Status]
				 , A.[Balance]
				 ,A.[PhysicalLocation],
				 A.[FileDisplayName],
				 A.FileName,
				 A.FileSize,
				 A.UserComment,
				 A.PurchaseOrder
				 ,C.Amount AS BreakageAmount,
				 C.BillBreakageID,
				 C.Description As BreakageDescription
				 ,C.BillType AS BreakageType
				 ,C.BillType AS BillBreakageStatus
				 from Tbl_Bill as A
				 inner join Tbl_BillBreakage AS C
				 on
				 A.BillID=C.BillID
				 left Join Tbl_Vendor AS B
				 on B.VendorID=A.VendorID
				 where  A.BillID=@billID


		end
		

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillOrInVoiceMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillOrInVoiceMasterData]
@ClientId numeric(18,0),
@AccountId numeric(18,0)
As
Begin
	Select * from [dbo].[Tbl_Vendor] where ClientID=@ClientId

	Select * from  [dbo].[Tbl_Bill]  where AccountID=@AccountId 

	Select * from  [dbo].[KeyList] where  KeyID=5002

	Select * from  [dbo].[KeyList] where  KeyID=5005
	
	select * from KeyList where KeyID=5010

	select * from KeyList where KeyID=5009
End
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillsorInvoiceBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillsorInvoiceBillList]
@accountId numeric(18,0)
AS
BEGIN
	select E.AccountID,
	E.BillID,
	[Status]=(CASE WHEN (E.Status=50036) Then 50015 ELSE E.Status END),
	[StatusName]=(CASE WHEN (E.StatusName='Challenged') Then 'Approved' ELSE E.StatusName END)
			 , E.[VendorID]
			  ,E.VendorName
			 , E.[BillDate]
			 , E.[Amount]
			 , E.[InvoiceNumber]
			 , E.[DueDate]
			 , E.[Category]
			 , E.[Notes]
			 , E.[PaymentTerms]
			 , E.[Description]
			 , E.[IsSplitted]
			 , E.[IsActive]
			 , E.[Balance]
			 ,E.[PurchaseOrder],
			  E. CategoryName

from
(select   A.[BillID]
			 , A.[VendorID]
			 ,D.VendorName
			 , A.[AccountID]
			 , A.[BillDate]
			 , A.[Amount]
			 , A.[InvoiceNumber]
			 , A.[DueDate]
			 , A.[Category]
			 , A.[Notes]
			 , A.[PaymentTerms]
			 , A.[Description]
			 , A.[IsSplitted]
			 , A.[Status]
			 , A.[IsActive]
			 , A.[Balance]
			 ,A.[PurchaseOrder]
			 ,B.Value1 As StatusName,
			 C.Value1 As CategoryName
			 from [dbo].[Tbl_Bill] As A
			 left join [dbo].[KeyList] AS B
			 on A.Status=B.KeyListID and B.KeyID=5005
			 left join [dbo].[KeyList] AS C
			 on A.Category=C.KeyListID and C.KeyID=5002
			 left join Tbl_Vendor AS D
			 On
			 A.VendorID=D.VendorID
			 where  A.AccountID=@accountId) E		 --where A.AccountID=@accountId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillsScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillsScreenData]            
@accountID NUMERIC(18,0),            
@userRoleID NUMERIC(18,0)    ,        
@clientID NUMERIC(18,0)  ,      
@kpiStatus NUMERIC(18,0)      
AS            
BEGIN       
      
DECLARE @dynamicwhere NVARCHAR(max)=''      
      
IF @kpiStatus !=0      
BEGIN      
SET @dynamicwhere =  @kpiStatus       
END      
      
  --Select  A.[BillID]            
  --      ,A.[VendorID]            
  --      ,A.[AccountID]            
  --      ,A.[BillDate]            
  --      ,A.[Amount]            
  --      ,A.[InvoiceNumber]            
  --      ,A.[DueDate]            
  --      ,A.[Category]            
  --      ,A.[Notes]            
  --      ,A.[PaymentTerms]            
  --      ,A.[Description]            
  --      ,A.[IsSplitted]            
  --      ,Case          
  --      WHEN A.Status=50019 Then 'Draft'          
  --      Else  'Approvals'          
  --      END AS 'StageName'          
  --      ,A.[Status]            
  --      ,A.[CreatedOn]            
  --      ,A.CreatedBy            
  --      ,B.[Value1] AS StatusName,            
  --      A.[IsRecurring],            
  --      C.[VendorName]            
  --      from [dbo].[Tbl_Bill] AS A            
  --   LEFT JOIN KeyList AS B            
  --   ON A.Status=B.KeyListID AND B.KeyID=5005            
  --   LEFT JOIN [dbo].[Tbl_Vendor] AS C            
  --   ON A.VendorID=C.[VendorID]            
  --   WHERE A.CreatedBy=@accountID   AND A.[Status] Like '%'+@dynamicwhere+'%'   
    
  
          
         SELECT  
         SQ.InvoiceNumber  
   ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate  
        ,C.Value1  AS StatusName  
        ,D.[VendorName]  
        ,B.[VendorID]      
        ,B.[AccountID]      
        ,B.[BillDate]      
        ,B.[Amount]      
        ,B.[DueDate]  
  ,Convert(date,B.[DueDate],101) AS DueOn  
        ,B.[Category]      
        ,B.[Notes]      
        ,B.[PaymentTerms]      
        ,B.[Description]      
        ,B.[IsSplitted]      
        ,Case    
         WHEN B.Status=50019 Then 'Draft'   
   WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'   
   WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'  
         END AS 'StageName'    
        ,B.[Status]      
        ,B.[CreatedOn]      
        ,B.CreatedBy      
   ,B.[BillID]     
   ,B.IsRecurring  
        from tbl_bill B join   
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )   
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status  
        LEFT JOIN KeyList AS C     
        ON B.Status=C.KeyListID AND c.KeyID=5005      
        LEFT JOIN [dbo].[Tbl_Vendor] AS D  
        ON B.VendorID=D.[VendorID]      
           WHERE B.CreatedBy=@accountID   AND B.[Status] Like '%'+@dynamicwhere+'%'   
            
            
     SELECT             
     --Total Bill Details            
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID) AS 'TotalBillsCount',            
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND             
     (CreatedOn >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CurrentWeekBillsClount',            
      (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND             
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LastWeekBillsCount',            
    ( select SUM(AMOUNT) from tbl_bill B join     
    (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber)     
     SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate      
 where createdby=@accountID) AS 'TotalAmount',            
               
   --Peding Submission Bills            
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019) AS 'PendingSubmissionBills',            
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND             
     (CreatedOn >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CWeekPendingSubmissionCount',            
      (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND             
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LWeekPendingSubmissionCount',            
    ( select SUM(AMOUNT) from tbl_bill B join     
    (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber)     
     SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate      
  where createdby=@accountID AND Status=50019) AS 'PendingSubmissionAmount',            
            
    --Rejected Submission Bills            
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017) AS 'RejectedBills',            
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND             
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',            
                 
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND             
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',            
                 
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017  ) AS 'RejectedAmount',            
            
    --UnApproved(Pending) Submission Bills            
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016) AS 'UnApprovedBills',            
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND             
     (DueDate >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
     AND DueDate< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CWeekUnApprovedCount',            
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND             
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))             
AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LWeekUnApprovedCount',            
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016  ) AS 'UnApprovedAmount'            
        
 SELECT VendorID AS KeyListID,VendorName AS Value1 FROM Tbl_Vendor Where ClientID=@clientID        
        
 SELECT KeyID,KeyListID,Value1 FROM Keylist Where Keyid=5005        
        
 SELECT [InvoiceNumber]  AS KeyListID, [InvoiceNumber]  AS Value1 FROM Tbl_Bill Where CreatedBy=@accountID  AND  ClientID=@clientID AND [Status] Like '%'+@dynamicwhere+'%'            
        
        
     END     
    
    
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBillSubmisssionDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetBillSubmisssionDetails]
@accountId numeric(18,0),
@clientId numeric(18,0),
@billID numeric(18,0)
AS
BEGIN
		IF EXISTS(Select BillID from Tbl_Bill  where BillID=@billID)
		Begin
		select   A.[BillID]
				 , A.[VendorID],
				  B.VendorName,
				  A.[AccountID]
				 , A.[BillDate]
				 , A.[Amount]
				 , A.[InvoiceNumber]
				 , A.[DueDate]
				 , A.[Category]
				 , A.[Notes]
				 , A.[PaymentTerms]
				 , A.[Description]
				 , A.[IsSplitted]
				 , A.[Status]
				 , A.[Balance]
				 ,A.[PhysicalLocation],
				 A.[FileDisplayName],
				 A.FileName,
				 A.FileSize,
				 A.UserComment,
				 A.PurchaseOrder
				 ,C.Amount AS BreakageAmount,
				 C.BillBreakageID,
				 C.Description As BreakageDescription
				 ,C.BillType AS BreakageType
				 ,C.BillType AS BillBreakageStatus
				 ,D.Comment as BillComment
				 ,D.BillCommentID
				 ,D.CreatedBy As CommentCreated
				 ,D.CreatedOn
				 ,E.FirstName
				 ,E.LastName
				 from Tbl_Bill as A
				 inner join Tbl_BillBreakage AS C
				 on
				 A.BillID=C.BillID
				 left Join Tbl_Vendor AS B
				 on B.VendorID=A.VendorID
				 left Join [dbo].[Tbl_BillComments] as D
				 on A.BillID=D.BillID
				 left join Tbl_Accounts As E
				 On D.CreatedBy=E.AccountID
				 where  A.BillID=@billID
				IF EXISTS(Select BillID from [dbo].[Tbl_ApprovedComments]  where BillID=@billID)
				begin
					select 'ApproverComments' As TableName,
												 A.[ApprovedCommentID],
												 A.[BillID],
												 A.[ApprovedComment],
												 A.[CreatedOn],
												 A.[CreatedBy],
												 B.FirstName,
												 B.LastName,
												 B.AccountID
												 from [dbo].[Tbl_ApprovedComments] As A
												 inner join Tbl_Accounts as B
												 On A.CreatedBy=B.AccountID
												 Where A.BillID=@billID
				end
				
 		end
		

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClientAdminScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetClientAdminScreenData]  
@userID NUMERIC(18,0)  
AS  
BEGIN  
    SELECT 'ClientAdminDetails' AS 'TableName',  
    A.[ClientID]  
      ,A.[ClientName]  
      ,A.[Status]  
      ,A.[CreatedOn]  
      ,A.[CreatedBy]   
   ,(C.FirstName) + ' ' + COALESCE(C.LastName, '') AS 'CreatedByName'  
      ,A.[ActivationKey]  
      ,A.[UserID]  
   ,B.AccountID,  
   B.FirstName,  
   B.LastName,  
   B.PrimaryEmailID  
   FROM Tbl_Client AS A  
   INNER JOIN Tbl_Accounts AS B  
   ON A.UserID=B.AccountID  
   LEFT JOIN Tbl_Accounts AS C  
   ON A.CreatedBy=C.AccountID  
  Where A.IsActive=1
  
  SELECT 'UserNames' As 'TableName',  
  UserName FROM Tbl_Accounts  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClientGlCodes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetClientGlCodes]
@clientID NUMERIC(18,0)
AS
BEGIN
   SELECT 'GlList' AS 'TableName',
	   A.[IdentityID]
      ,A.[ClientID]
      ,A.[GLNumber]
      ,A.[GLDescription]
      ,A.[RowStatus]
      ,A.[CreatedBy]
      ,A.[CreatedOn]
	  ,(coalesce(B.FirstName,'')+' '+coalesce(B.LastName,'')) AS 'CreatedByName'
  FROM [Tbl_GlCodes] As A
  LEFT JOIN Tbl_Accounts AS B
  ON A.CreatedBy = B.AccountID
  WHERE A.ClientID =@clientID
  



END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetConfigDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetConfigDetails]            
@clientId NUMERIC(18,0)            
AS            
BEGIN            
  SELECT 'Configs' AS TableName,            
  [IdentityID],            
  [IsChangesAllowed],            
  [IsSplitAllowed],            
  [IsRecurrenceEnabled],            
  [IsBillAssociationEnabled]           
  ,[IsBillExportEnabled]          
  ,[IsEpaymentsEnabled]          
  ,[IsOfflinePaymentsAllowed]          
  ,[IsImportVendorsAllowed]          
  ,[IsAutoApproval]          
  ,[IsMultiApproval]          
  ,[IsDefaultApproval]          
  ,[IsStandardApproval]          
  ,[IsCustomApproval] 
  ,IsPartialApprovalEnabled
  FROM [dbo].[Tbl_Configurations] WHERE ClientID=@clientID          
            
  SELECT 'Approvers' AS TableName,          
 ( ISNULL(A.FirstName,'')+' '+ISNULL(A.LastName,'')) AS ApproverName,          
  A.AccountID          
  ,A.IsDefaultAccountant,A.[ApproverSeqence]        
  FROM Tbl_Accounts                                   
 AS A                                  
 INNER JOIN ApplicationRoleENtity AS B                                  
 ON A.ApplicationRole=B.RoleID                                  
 INNER JOIN EntityAction AS C                                  
 ON B.EntityActionID=C.EntityActionID                                  
 INNER JOIN Entity AS D                                  
 ON C.EntityID=D.EntityID                                  
 WHERE A.ClientID=@clientId AND D.EntityID=2001 AND A.ApplicationRole !=1005  AND A.IsActive=50042       
       
 SELECT 'Vendors' AS TableName, VendorName AS Value1,VendorID AS KeyListID FROM Tbl_Vendor WHERE ClientID=@clientId      
      
 SELECT 'Conditions' AS TableName,KeyListID,Value1 FROM KeyList Where KeyID=5026      
      
 SELECT 'CustomApprovalConfigurations' AS TableName,    
      A.IdentityID,     
                          A.[IsVendorType],    
                          A.[IsAmountType],    
                          A.[VendorID],    
                          A.[Amount],    
                          A.[Condition],    
                          A.[SecondAmount],    
                          B.VendorName,    
                          (SELECT      
                          STUFF((SELECT ', ' + CAST((SELECT(ISNULL(FirstName,'')+' '+ISNULL(LastName,''))    
                          FROM Tbl_Accounts Where AccountID = ApproverID)     
                          AS NVARCHAR(MAX)) [text()]    
                          FROM Tbl_CustomApprovers     
                          WHERE ConfigID = t.ConfigID    
                          ORDER BY Sequence ASC    
                          FOR XML PATH(''), TYPE)    
                          .value('.','NVARCHAR(MAX)'),1,2,' ')   
                          FROM Tbl_CustomApprovers t WHERE ConfigID=A.IdentityID     
                          GROUP BY ConfigID)   AS 'Approvers'  
                          FROM [dbo].[Tbl_CustomApprovalConfigurations] AS A    
                          LEFT JOIN Tbl_Vendor AS B    
                          ON A.VendorID=B.VendorID    
                          WHERE A.ClientID=@clientId    
  
 Select 'CustomApprovers' AS TableName,  
 A.ConfigID,  
 A.ApproverID,  
 A.ApproverID AS AccountID,  
 A.Sequence  
 ,(ISNULL(B.FirstName,'')+' '+ISNULL(B.LastName,'')) AS 'ApproverName'  
 FROM Tbl_CustomApprovers AS A   
 LEFT JOIN Tbl_Accounts AS B  
 ON A.ApproverID=B.AccountID  
 WHERE A.ClientID=@clientId    
    
  
        
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetConfiguredApprovers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetConfiguredApprovers]  
@isVendor NUMERIC(18,0),  
@vendorID NUMERIC(18,0),  
@amount NUMERIC(18,2),  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
  IF(@isVendor=1)  
  BEGIN  
   SELECT 'Approvers' AS TableName,  
   A.[VendorID]   
   ,B.[ApproverID] AS AccountID  
   ,C.FirstName  
   ,C.LastName  
   ,B.[Sequence] AS ApproverSeqence 
   ,CG.IsStandardApproval
   ,CG.IsCustomApproval
   FROM [dbo].[Tbl_CustomApprovalConfigurations] AS A  
   LEFT JOIN Tbl_CustomApprovers AS B  
   ON A.[IdentityID]=B.[ConfigID]  
   LEFT JOIN Tbl_Accounts AS C  
   ON B.[ApproverID]=C.AccountID  
   JOIN Tbl_Configurations CG ON CG.ClientID=A.ClientID
   WHERE A.ClientID=@clientID AND A.VendorID=@vendorID  
  END  
  ELSE  
  BEGIN  
  SELECT 'Approvers' AS TableName,  
   A.[VendorID]   
   ,B.[ApproverID] AS AccountID  
   ,C.FirstName  
   ,C.LastName  
   ,B.[Sequence] AS ApproverSeqence  
   ,CG.IsStandardApproval
   ,CG.IsCustomApproval
   FROM [dbo].[Tbl_CustomApprovalConfigurations] AS A  
   LEFT JOIN Tbl_CustomApprovers AS B  
   ON A.[IdentityID]=B.[ConfigID]  
   LEFT JOIN Tbl_Accounts AS C  
   ON B.[ApproverID]=C.AccountID
    JOIN Tbl_Configurations CG ON CG.ClientID=A.ClientID
   WHERE A.ClientID=@clientID
   AND (@amount>=A.Amount AND @amount<=A.SecondAmount)
  END  
END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetCreateBillMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCreateBillMasterData]                            
@clientId NUMERIC(18,0)                            
AS                            
BEGIN                            
                            
                            
   SELECT * FROM KeyList WHERE KeyID=5003 --PAYMENT TERMS                            
                            
   SELECT [IdentityID],[GLNumber],              
   --ISNULL( [GLNumber],'')+' - '+ISNULL([GLDescription],'') AS '',
      CASE  
   WHEN A.[IsMasterGLCode]=1 THEN CONCAT(A.GLNumber, '-', A.CategoryName )  
   ELSE CONCAT(A.GLNumber, '-', A.GLDescription)   
   END  
   AS 'GLDescription'
  FROM   
   Tbl_GlCodes AS A WHERE A.IsActive=1 AND  ClientID=@clientId                        
                            

							


   SELECT A.[FirstName],A.LastName,A.AccountID,ClientID,IsDefaultAccountant,ApproverSeqence FROM Tbl_Accounts                         
                    AS A                        
                    INNER JOIN ApplicationRoleENtity AS B                        
                    ON A.ApplicationRole=B.RoleID                        
                    INNER JOIN EntityAction AS C                        
                    ON B.EntityActionID=C.EntityActionID                        
                    INNER JOIN Entity AS D                        
                    ON C.EntityID=D.EntityID                        
                    WHERE A.ClientID=@clientId AND D.EntityID=2001 AND A.ApplicationRole !=1005  AND A.IsActive=50042                      
                         
 -- SELECT AccountID,FirstName,LastName,ApplicationRole FROM Tbl_Accounts WHERE ClientID=@clientId AND ApplicationRole=1013 --APPROVERS                            
                            
   SELECT  * FROM KeyList WHERE KeyID=5016 --RECURRING FREQUENCY                            
                            
   SELECT * FROM KeyList WHERE KeyID=5015--REMINDER INTERVAL                            
                            
   SELECT   VendorName,[Address1],[Phone],VendorID ,[PaymentTerm],GLCode FROM Tbl_Vendor Where ClientID =@clientId--Vendors                     
                       
    SELECT                          
   KeyID,                          
   KeyListID,                          
   Value1 FROM KeyList                          
   WHERE KeyID=5020     --Preffered Payment Type                    
                        
   SELECT CustomerID AS 'KeyListID',CustomerName AS 'Value1' FROM Tbl_Customers  Where ClientID=@clientId          
             
   SELECT ProjectID AS 'KeyListID',ProjectName AS 'Value1',Customer FROM Tbl_Projects Where ProjectStatus=50085 AND ClientID=@clientId          
        
   SELECT A.IdentityId AS 'KeyListID',  
   CASE  
   WHEN A.[IsMasterGLCode]=1 THEN CONCAT(A.GLNumber, '-', A.CategoryName )  
   ELSE CONCAT(A.GLNumber, '-', A.GLDescription)   
   END  
   AS 'Value1'  
   FROM   
   Tbl_GlCodes AS A WHERE A.IsActive=1 AND  ClientID=@clientId         
    
       
        
                            
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCreateCutomerMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCreateCutomerMasterData]
@clientID NUMERIC(18,0)
As  
BEGIN  
    SELECT 'CustomerType' AS TableName,KeyListID,Value1 FROM Keylist Where Keyid=5023  
    
	SELECT 'ExistingCustomers' As TableName,[CustomerName],[Email] ,CustomerID FROM [dbo].[Tbl_Customers] WHERE ClientID=@clientID 

	 SELECT 'PaymentTerms' AS TableName,KeyListID,Value1 FROM Keylist Where Keyid=5003  

	 SELECT 'PrefferredPaymentType' AS TableName,KeyListID,Value1 FROM Keylist Where Keyid=5020  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCreateInvoiceMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCreateInvoiceMasterData]
@clientID NUMERIC(18,0),@userID NUMERIC(18,0)=null
As  
BEGIN  
    SELECT 'CustomerList' AS TableName,CustomerID AS KeyListID,CustomerName AS Value1 FROM tbl_Customers Where ClientID=@clientID  
    

	 SELECT 'PaymentTerms' AS TableName,KeyListID,Value1 FROM Keylist Where Keyid=5003  

	 SELECT 'PrefferredPaymentType' AS TableName,KeyListID,Value1 FROM Keylist Where Keyid=5020  

	 SELECT 'Product' AS TableName,ProductID AS KeyListID,ProductName AS Value1 FROM tbl_product

	 SELECT 'Preferences' AS TableName,TermsConditions,Notes
	 FROM TBL_ARPreferences where ClientId=@clientID



	 SELECT 'UserList' AS TableName, FirstName FROM Tbl_Accounts WHERE AccountID=@userID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCreateProjectMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetCreateProjectMasterData]    
@clientID NUMERIC(18,0)    
AS    
BEGIN    
 SELECT 'ProjectTypes' AS TableName,KeyListID ,Value1 FROM KeyList WHERE Keyid=5024    
    
 SELECT 'ProjectStatus' AS TableName,KeyListID ,Value1 FROM KeyList WHERE Keyid=5025    
    
 SELECT 'Customers' AS TableName,CustomerID AS KeyListID,CustomerName AS Value1 FROM Tbl_Customers Where ClientID=@clientID 
 
 SELECT 'ExistingProjects' AS TableName,[ProjectName] FROM [dbo].[Tbl_Projects] Where ClientID=@clientID
END    
    
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCreateUserMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
CREATE PROCEDURE [dbo].[SP_GetCreateUserMasterData]    
@userRoleId NUMERIC(18,0),    
@clientId NUMERIC(18,0)    
AS    
BEGIN    
 DECLARE @isCreate  NUMERIC(18,0)    
 SET @isCreate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3012)    
 IF(@isCreate IS NOT NULL)    
 BEGIN    
    SELECT * FROM KeyList WHERE KeyID=5013    
    
    SELECT * FROM ApplicationRole WHERE ClientID=@clientId    
  
    Select UserName ,[IsDefaultAccountant] ,AccountID FROM Tbl_Accounts  


 END    
 END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_GetCustomerDetails 9503,2000
CREATE PROCEDURE [dbo].[SP_GetCustomerDetails]
	@customerid NVARCHAR(max),@clientID NVARCHAR(MAX)
AS
BEGIN

	SELECT  CustomerName,Email,[State],[ContactNumber],Zip,CustomerAddress,K.Value1,C.CutomerType,C.City,C.CustomerLogo
	FROM [Tbl_Customers] C
	LEFT JOIN KEYLIST K ON K.KeyListID=C.CutomerType
	WHERE C.CustomerID=@customerid


	SELECT
      ContactId AS [ContactIdentityId]
      ,[CustomerId]
	  ,[Name] AS Fistname,
	  LastName
      ,(coalesce([Name],'') +' '+coalesce(LastName,'')) AS [Name]
      ,[Email]
      ,Phoneno [Phone]
      FROM [dbo].Tbl_CustomerContact  Where CustomerId=@customerid AND ClientID=@clientID
	  ORDER BY OrderByDate desc

	  
	  SELECT   
        A.[FileName]  
       ,A.[LastModifiedBy]  
    ,A.[ModifiedFileName]  
	,A.CreatedOn
   ,(coalesce(B.FirstName,'')+' '+ coalesce(B.LastName,'')) AS Name  
    FROM [dbo].[Tbl_CustomerDocuments] AS A  
    LEFT JOIN Tbl_Accounts As B  
    ON A.[CreatedBy]=B.AccountID  
    WHERE A.CustomerID=@customerid AND A.[ClientID]=@clientID  
	ORDER BY CreatedOn DESC

   SELECT    
   A.CustomerNotesID    
  ,A.[Notes]    
  ,A.[CreatedBy]    
  ,A.UpdatedOn  
  ,A.[CreatedOn]   
  ,B.FirstName
  ,B.LastName
  ,(COALESCE(B.FirstName,'')+' '+COALESCE(B.LastName,'')) AS Name    
  FROM [dbo].Tbl_CustomerNotes AS A    
  LEFT JOIN Tbl_Accounts AS B    
  ON A.CreatedBy=B.AccountID    
  WHERE A.CustomerID=@customerid AND A.ClientID=@clientID 
  ORDER BY OrderByDate DESC

END

--select * from [Tbl_CustomerDocuments]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerInfo]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCustomerInfo]                      
@customerID NUMERIC(18,0),                      
@clientID NUMERIC(18,0)                      
AS                      
BEGIN                      
      SELECT 'UserBills' AS Tablename,InvID,I.TotamAmount AS Dueamount,SUM(O.Discount) AS Discount,I.InvoiceId,O.ClientId
,I.Customerid,[Description],Invoicedate,K.value2,
CASE WHEN I.BillStatus=0 THEN 1 WHEN I.BillStatus=1 THEN 1 ELSE I.BillStatus END AS BillStatus,
CASE WHEN I.BillStatus=1 THEN 'Payment Pending' when I.BillStatus=2 then 'Paid Invoice' WHEN I.BillStatus=0 THEN 'Unsubmitted Invoice' when I.BillStatus=3 then 'Partially Paid'
when I.BillStatus=5 then 'Canceled' END AS [Status],
CASE WHEN I.BillStatus=1 THEN 'Payment' when I.BillStatus=2 then 'Paid' else 'Approvals' END AS [Stage],
DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate],
C.CustomerName ,I.TermCode
from Tbl_OrderInvoice O
JOIN Tbl_Invoice I ON InvID=InvoiceName AND O.ClientId=I.ClientId
JOIN Tbl_Customers C ON C.CustomerID=I.Customerid
JOIN keylist K ON K.[Value1]=I.TermCode
WHERE I.ClientId=@clientID and I.Customerid=@customerID
group by InvID,I.Customerid,[Description],Invoicedate,C.CustomerName,I.InvoiceId,
I.TermCode,I.BillStatus,K.Value2,O.ClientId,I.BillStatus,I.TotamAmount     



SELECT 'Customerlist' as Tablename,CustomerName,Email,[State],[ContactNumber],
Zip,CustomerAddress,K.Value1,C.CutomerType,C.City,C.CustomerLogo
,(SELECT cast(SUM(Amount) as decimal(10,2)) FROM tbl_Invoice I join tbl_orderinvoice O on I.InvoiceName=O.InvID WHERE Customerid=C.CustomerID AND I.BillStatus=2) AS 'RecevedAmout'
,(SELECT Top(1) cast(Amount as decimal(10,2)) From tbl_Invoice I join tbl_orderinvoice O on I.InvoiceName=O.InvID Where Customerid=C.CustomerID AND I.BillStatus=2  ORDER BY PaidOn desc) AS 'LastPayment'	
,(SELECT cast(SUM(Amount) as decimal(10,2)) FROM tbl_Invoice I join tbl_orderinvoice O on I.InvoiceName=O.InvID WHERE Customerid=C.CustomerID AND I.BillStatus <>2) AS 'RecevableAmout'
	,Shippingaddress,BillingAddress,AccountHoldername,AccountNumber,RoutingNumber
	,T.Value1 as PaymentTerm,M.Value1 AS PaymentMethod
	FROM [Tbl_Customers] C
	LEFT JOIN KEYLIST K ON K.KeyListID=C.CutomerType
	left join KEYLIST T  ON T.KeyListID=C.PaymentTerms
	left join KEYLIST M  ON M.KeyListID=C.PaymentMethod
	--left JOIN KEYLIST T ON K.KeyListID=C.CutomerType 9502
	WHERE C.CustomerID=@customerID

	

	      
   SELECT 'Note' AS Tablename,    
   A.CustomerNotesID    
  ,A.[Notes]    
  ,A.[CreatedBy]    
  ,A.UpdatedOn  
  ,A.[CreatedOn]   
  ,B.FirstName
  ,B.LastName
  ,(COALESCE(B.FirstName,'')+' '+COALESCE(B.LastName,'')) AS Name    
  FROM [dbo].Tbl_Customer3600Notes AS A    
  LEFT JOIN Tbl_Accounts AS B    
  ON A.CreatedBy=B.AccountID    
  WHERE A.CustomerID=@customerID AND A.ClientID=@clientID 
  ORDER BY OrderByDate DESC


   SELECT  'Documents' as Tablename, 
        A.[FileName]  
       ,A.[LastModifiedBy]  
    ,A.[ModifiedFileName]  
	,A.CreatedOn
   ,(coalesce(B.FirstName,'')+' '+ coalesce(B.LastName,'')) AS Name  
    FROM [dbo].[Tbl_Customer360Documents] AS A  
    LEFT JOIN Tbl_Accounts As B  
    ON A.[CreatedBy]=B.AccountID  
    WHERE A.CustomerID=@customerid AND A.[ClientID]=@clientID  
	ORDER BY CreatedOn DESC


		SELECT 'Contact' AS TableName,
      ContactId AS [ContactIdentityId]
      ,[CustomerId]
	  ,[Name] AS Fistname,
	  LastName
      ,(coalesce([Name],'') +' '+coalesce(LastName,'')) AS [Name]
      ,[Email]
      ,Phoneno [Phone]
      FROM [dbo].Tbl_Customer360Contact  Where CustomerId=@customerid AND ClientID=@clientID
	  ORDER BY OrderByDate desc



	

									
END       
     
	
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerProjects]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetCustomerProjects]
@clientID NUMERIC(18,0),
@customerID NUMERIC(18,0)
AS
BEGIN
       SELECT 'Projects' AS TableName,ProjectName,ProjectID FROM TBL_PROJECTS WHERE ClientID=@clientID AND Customer=@customerID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerScreenMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetCustomerScreenMasterData]
@clientID  NUMERIC(18,0)
AS
BEGIN
      SELECT 'Customers' AS 'TableName',[CustomerID], [CustomerName] FROM Tbl_Customers Where ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDwollatEmaildetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- SP_GetDwollatEmaildetails 'b0a7fad3-bdd4-eb11-8134-d050ab358a03'
CREATE PROCEDURE [dbo].[SP_GetDwollatEmaildetails]
	@fundIdDwolla nvarchar(max)
AS
BEGIN
 declare @IsAutoApprover nvarchar(max)

 set @IsAutoApprover=(SELECT TOP(1) isAutoApproval  FROM Tbl_BillApproved BA JOIN Tbl_Bill B ON B.BillID=BA.BillID WHERE BA.[DwollaFundID]=@fundIdDwolla)
 IF(@IsAutoApprover<>'1')
 BEGIN
	SELECT 'Payment' TableName, B.InvoiceNumber,A.FirstName,A.PrimaryEmailID,AAP.FirstName [Approvername],AAP.PrimaryEmailID [ApproverMail]
	,AU.FirstName [Username],AU.PrimaryEmailID [Usermail],CONCAT(AAP.PrimaryEmailID, ',' ,AU.PrimaryEmailID) AS [CCMAIL]
	,E.[Subject],E.Body
	FROM  Tbl_BillApproved BA
	JOIN TBL_BILL B ON BA.BILLID=B.BILLID
	JOIN Tbl_Accounts A ON BA.UpdatedBy =A.AccountID
	LEFT JOIN Tbl_ApproveHistory AP ON B.BillID=AP.BillID
	JOIN Tbl_Accounts AAP ON AP.ApproverID=AAP.AccountID
	JOIN Tbl_Accounts AU ON B.AccountID=AU.AccountID
	JOIN tbl_EmailTemplate E ON BA.PaymentStatus=E.DwollaStatus
	WHERE BA.[DwollaFundID]=@fundIdDwolla   OR  [BankTransferID]= @fundIdDwolla
END
ELSE
BEGIN
SELECT 'Payment' TableName,B.InvoiceNumber,A.FirstName,A.PrimaryEmailID
	,AU.FirstName [Username],AU.PrimaryEmailID  AS [CCMAIL]
	,E.[Subject],E.Body
	FROM  Tbl_BillApproved BA
	JOIN TBL_BILL B ON BA.BILLID=B.BILLID
	JOIN Tbl_Accounts A ON BA.UpdatedBy =A.AccountID
	JOIN Tbl_Accounts AU ON B.AccountID=AU.AccountID
	JOIN tbl_EmailTemplate E ON BA.PaymentStatus=E.DwollaStatus
	WHERE BA.[DwollaFundID]=@fundIdDwolla   OR 
	[BankTransferID]= @fundIdDwolla
END
	END


--SELECT * FROM [dbo].TBL_BILL WHERE BillID=4821

--SELECT * FROM Tbl_ApproveHistory WHERE BillID=4794

--SELECT * FROM Tbl_BillApproved WHERE [DwollaFundID]= 'b0a7fad3-bdd4-eb11-8134-d050ab358a03'


GO
/****** Object:  StoredProcedure [dbo].[SP_GetDwollaTransactions]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetDwollaTransactions]
@clientId NUMERIC(18,0)
AS
BEGIN
		SELECT 'Transactions' AS TableName
	,[FundFrom]	,[FundTo],[Amount],[Remarks],[CapturedOn],[FundId] FROM [dbo].[Tbl_DwollaTransactions]Where ClientID=@clientId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDwollavendorEmailDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetDwollavendorEmailDetails]
@fundIdDwolla nvarchar(max)
AS
BEGIN
SELECT 'Payment' TableName,B.InvoiceNumber,A.FirstName,A.PrimaryEmailID
	,AU.FirstName [Username],AU.PrimaryEmailID  AS [CCMAIL],VendorName,
	(select [Subject] FROM tbl_EmailTemplate WHERE EmailTemplateID=610057) [subject],
	(select Body FROM tbl_EmailTemplate WHERE EmailTemplateID=610057) [Body]
	,AmountPaid,BankTransferID,'U.S.Dollars' AS Currency,Email
	FROM  Tbl_BillApproved BA
	JOIN TBL_BILL B ON BA.BILLID=B.BILLID
	JOIN Tbl_Accounts A ON BA.UpdatedBy =A.AccountID
	JOIN Tbl_Accounts AU ON B.AccountID=AU.AccountID
	JOIN Tbl_Vendor V ON V.VendorID=B.VendorID
	WHERE BA.[DwollaFundID]=@fundIdDwolla   OR  [BankTransferID]= @fundIdDwolla

END
	
	
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditAccountDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetEditAccountDetails]
@accountID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
SELECT 'AccountEditDetais' As TableName,
       [AccountIdentityID]
      ,[AccountNumber]
      ,[RoutingNumber]
      ,[ReferenceID]
      ,[AccountName]
      ,[CustomerID]
      ,[IsDefault]
      ,[IsActive]
  FROM [Tbl_ClientBankAccount] WHere AccountIdentityID=@accountID AND CustomerID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditARInvoice]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetEditARInvoice]
	@InoiceId numeric(18,0)
AS
BEGIN
	SELECT 'Orderinvoice' as TableName, InvID,Amount,O.Discount,quantity,Price,O.Tax,O.Discounttype,Product,Customerid,Paymenttype,
	Referanceorder,Paymentterms,TermCode,Invoicedate,Duedate,TermCode,O.OrderInvoice
	FROM Tbl_Invoice I
	JOIN Tbl_OrderInvoice O on I.InvoiceName=O.InvID
	WHERE InvoiceId=@InoiceId


	SELECT 'Invoicelst' AS TableName,InvoiceName,Customerid,Referanceorder,Paymenttype,Subtotal,Discount,ShippingCharge,
	Tax,TotamAmount,DiscountType,TermCode,Invoicedate,Duedate,RecurringStartDate,RecurrinEendtDate,Frequency
	FROM Tbl_Invoice
	WHERE InvoiceId=@InoiceId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditCardDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_GetEditCardDetails]
@cardID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
		SELECT
		'EditCardDetails' As TableName
	  ,[CardIdentityId]
      ,[CardName]
      ,[CardNumber]
      ,[ExpiryMonth]
      ,[ExpiryYear]
      ,[CCV]
      ,[IsDefault]
      ,[ReferenceID]
      ,[CustomerID]
      ,[Status]
      ,[BankName]
      ,[IsActive]
	  from Tbl_ClientCards Where CardIdentityId=@cardID AND CustomerID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditCustomerData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetEditCustomerData]
@customerID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
	SELECT 'CustomerData' AS 'TableName',[CustomerID],[CustomerName],[CutomerType],[ContactNumber],
[Email],[CustomerAddress],[City],[State],[Zip],[CustomerLogo] ,PaymentTerms,PaymentMethod
,Shippingaddress
,BillingAddress
,AccountHoldername
,AccountNumber
,RoutingNumber

FROM Tbl_Customers Where CustomerID=@customerID
AND ClientID=@clientID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditUserData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetEditUserData]
@userRoleId NUMERIC(18,0),
@userId NUMERIC(18,0)
AS
BEGIN
	DECLARE @isUpdate  NUMERIC(18,0)
	DECLARE @role  NUMERIC(18,0)
	SET @isUpdate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleId AND EntityActionID=3013)
	IF(@isUpdate IS NOT NULL)
	BEGIN
				SELECT * FROM Tbl_Accounts WHERE AccountID=@userId

				SET @role=(SELECT ApplicationRole FROM Tbl_Accounts WHERE AccountID=@userId)
				IF(@role IS NOT NULL)
				BEGIN
					SELECT
							 A.[ApplicationRoleEntityID]
							,A.[EntityActionID]
							,A.[RoleID]
							,B.EntityID
							,B.ActionName
							,C.EntityName FROM   ApplicationRoleEntity AS A
							LEFT JOIN EntityAction AS B
							ON A.EntityActionID=B.EntityActionID
							LEFT JOIN Entity AS C
							ON B.EntityID = C.EntityID
							WHERE A.RoleID=@role
				END

	END
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEditVendorDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetEditVendorDetails]            
@vendorID NUMERIC(18,0),            
@clientID NUMERIC(18,0)            
AS            
BEGIN            
 SELECT 'VendorDetails' AS TableName, A.[VendorID]            
          ,A.[VendorName]            
          ,A.[FirstName]            
          ,A.[LastName]            
          ,A.[Email]            
          ,A.[City]            
          ,A.[Country]            
          ,A.[Address1]            
          ,A.[Address2]            
          ,A.[PostalCode]            
          ,A.[State]            
          ,A.[DOB]            
          ,A.[SSNNumber]            
          ,A.[Phone]            
          ,A.[WebsiteURL]            
          ,A.[ReferenceID]            
          ,A.[VendorType]            
          ,A.[PrefferedPaymentMethod]            
          ,A.[TaxId]            
          ,A.[PaymentTerm]            
          ,A.[LeadTimeDays]            
    ,A.[PaypalEmailAddress]        
    ,A.[PaypalMobileNumber]        
    ,A.[GLCode]       
 ,A.[VendorLogo]    
 ,A.ExternalNumber  
 ,A.[DwollaCustomerID] 
 ,A.[DwollaFundID] 
    FROM Tbl_Vendor AS A   WHERE A.VendorID=@vendorID and A.ClientID=@clientID          
            
    SELECT 'VendorBankDetails' AS TableName,            
    B.[IdentityID]            
      ,B.[VendorID]            
      ,B.[AccountHolderName]            
      ,B.[AccountNumber]            
      ,B.[RoutingNumber]            
      ,B.[ClientID] FROM Tbl_VendorBankAccount AS B WHERE B.VendorID=@vendorID and B.ClientID=@clientID           
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetExistingGlCodes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetExistingGlCodes]
@clientID NUMERIC(18,0)
AS
BEGIN
			SELECT 'GLCodes' AS TableName,[GLNumber] FROM [dbo].[Tbl_GlCodes] Where ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetExportScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_GetExportScreenData]  
@dueFromDate NVARCHAR(MAX),  
@dueToDate NVARCHAR(MAX),  
@paymentStatus NUMERIC(18,0),  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
  
       SELECT 'ExportBills' As 'TableName',  
             A.[IdentityID]  
               ,A.[BillID]  
               ,A.[ApprovedAmount]  
               ,A.[Status]  
               ,A.[PaymentStatus]  
               ,A.[DueOn]  
               ,A.[VendorID]  
      ,B.[VendorName]  
      ,C.Description  
      ,C.InvoiceNumber  
      FROM TBl_BillApproved AS A  
      LEFT JOIN Tbl_Vendor AS B  
      ON A.VendorID=B.VendorID  
      LEFT JOIN Tbl_Bill As C  
      ON A.BillID =C.BillID  
      WHERE A.DueOn Between @dueFromDate AND @dueToDate  
      AND  A.PaymentStatus= @paymentStatus  
      AND A.ClientId=@clientID  
      
      
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetFinancerHomeData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetFinancerHomeData]
@clientId numeric(18,0)
As
Begin

Declare @weekstart as datetime
Declare @WeekEnd as datetime

set @weekstart=(DATEADD(day, DATEDIFF(day, 0, GETUTCDATE()) /7*7, -1) )
set @WeekEnd=(DATEADD(day, DATEDIFF(day, 6, GETUTCDATE()-1) /7*7 + 7, 5))

declare @Date datetime = GETUTCDATE()
declare @CurrentDay datetime = CAST(FLOOR(CAST(@Date as float)) as datetime)


select
(SELECT SUM(ApprovedAmount)  FROM Tbl_BillApproved where not PaymentStatus=50036 and Status=50015 ) as 'TotalOutStatndingPaymentAmount',

(Select SUM(ApprovedAmount)  FROM Tbl_BillApproved where Status=50015 and  @CurrentDay > DueOn)as 'OverDueAmount',

(select SUM(ApprovedAmount)  from Tbl_BillApproved where DueOn>=@weekstart and  DueOn<=@WeekEnd) as 'DueWeekAmount',

(Select SUM(ApprovedAmount) from Tbl_BillApproved where PaymentStatus=50036 )as 'UnPaidAmount',

(select count(BillId) from Tbl_BillApproved where not PaymentStatus=50036 and Status=50015) as 'TotalOverDuePaymentCount' ,

(select count(BillID)  from Tbl_BillApproved where PaymentStatus=50026) as 'PostedPaymentCount',

(select Count(BillId) from Tbl_BillApproved where Status=50015 and  @CurrentDay > DueOn)as 'OverDuePayment',

(select count(BillId) from Tbl_BillApproved where PaymentStatus=50024	) as 'UnsucessFullPaymnets' 

Select 'ApprovedBillList' AS TableName,
									A.IdentityID,
									A.[BillID],
									A.[ApprovedAmount],
									A.[Status],
									A.[DueOn],
									A.[PaymentStatus],
									B.PaymentTerms,
									B.InvoiceNumber,
									D.Value1 as PaymentTermsName,
									C.VendorName,
									A.VendorID
									from Tbl_BillApproved As A
									left join Tbl_Bill as B
									On
									A.BillID=B.BillID
									left join Tbl_Vendor As C
									on A.VendorID=C.VendorID
									left join KeyList As D
									On B.PaymentTerms =D.KeyListID and KeyID=5003
									where not A.PaymentStatus=50036 and A.Status=50015 and B.ClientID=2000

								
End
GO
/****** Object:  StoredProcedure [dbo].[SP_GetGLCategoryEditDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetGLCategoryEditDetails]
@glIdentityID NUMERIC(18,0)
AS
BEGIN
		SELECT 'Category' AS TableName,[CategoryName],[IsActive],[GLNumber],[GLDescription] 
		FROM Tbl_GlCodes Where IdentityID=@glIdentityID

		SELECT 'SubCategory' AS TableName,[GLNumber],[GLDescription],IdentityId FROM Tbl_GlCodes  Where MasterGLCode=@glIdentityID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetICustomerEmaildetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetICustomerEmaildetails]
	@customerid numeric(18,0),@accountID numeric(18,0)
AS
BEGIN
	

select 'customerlst' AS TableName, CustomerName,Email,Shippingaddress,
BillingAddress from tbl_customers
where CustomerID=@customerid


select 'cclist' AS TableName, UserName,PrimaryEmailID AS Email from tbl_accounts
where AccountID=@accountID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoice360KPIDataList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoice360KPIDataList] 
@clientID NUMERIC(18,0)
AS
BEGIN


		-- All Invoice
SELECT cast(sum(TotamAmount) as decimal(10,2)) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID) [Invoice],
(Select COUNT(InvoiceId) FROM tbl_invoice Where O.ClientId=@clientID and CreatedOn BETWEEN DATEADD(DAY, -7, GETDATE()) AND DATEADD(DAY, 1, GETDATE())) 'Currentweekdata'
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE O.ClientId=@clientID 
GROUP BY O.ClientId



--RELEASED INVOICE SEND MAIL
SELECT cast(sum(TotamAmount) as decimal(10,2)) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=1) [Invoice],
(Select COUNT(InvoiceId) FROM tbl_invoice Where O.ClientId=@clientID and BillStatus=1 and CreatedOn BETWEEN DATEADD(DAY, -7, GETDATE()) AND DATEADD(DAY, 1, GETDATE())) 'ReleseCurrentweekdata'
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE O.ClientId=@ClientId AND I.BillStatus=1 
GROUP BY O.ClientId

--PAID INVOICE
SELECT cast(sum(TotamAmount) as decimal(10,2)) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=2) [Invoice],
(Select COUNT(InvoiceId) FROM tbl_invoice Where O.ClientId=@clientID and BillStatus=2 and CreatedOn BETWEEN DATEADD(DAY, -7, GETDATE()) AND DATEADD(DAY, 1, GETDATE())) 'PaidCurrentweekdata'
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId 
WHERE O.ClientId=@ClientId AND I.BillStatus=2
GROUP BY O.ClientId

--OVERDUE INCOICE
SELECT cast(sum(TotamAmount) as decimal(10,2)) Amount,count(InvoiceId) Invoice
--(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=2000 AND BillStatus=5) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId 
WHERE convert(datetime ,I.Invoicedate ,105) > getdate()
GROUP BY O.ClientId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceCustomerLst]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoiceCustomerLst]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@cutmetid nvarchar(max)
	,@clientID nvarchar(max)
AS
BEGIN
DECLARE @orderbydynamic NVARCHAR(max) ='' 
DECLARE @dynamicsql NVARCHAR(max) =''   

SET @orderByDynamic = ' ORDER BY '+@orderBy

	SET @dynamicsql='SELECT ''Customerlst'' AS TableName, CustomerName [NextDueDate],
	[NextDueAmount],Balance [Totalamtreceved],LastPayment,AssociatedInvoice
	 
	FROM [View_InvoiceCustomer] 
	
	WHERE Clientid='+ CAST(@cutmetid AS VARCHAR(MAX)) +'
	' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'          
	
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql) 

DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM [TBL_BILL]'              
+ '              
 WHERE  Customer = ' + CAST(@cutmetid AS VARCHAR(MAX)) + '' 
 
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END



GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceDataList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoiceDataList] 
		@clientID numeric(18,0)
AS
BEGIN
	SELECT CustomerID AS KeyListID, CustomerName AS Value1 FROM Tbl_Customers
	WHERE ClientID=@clientID

	SELECT InvoiceName AS KeyListID, InvoiceName AS Value1 ,* FROM Tbl_Invoice
	where ClientId=@clientID

		-- UN SUBMITTED 
SELECT sum(TotamAmount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=0) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE O.ClientId=@ClientId AND I.BillStatus=0
GROUP BY O.ClientId

--RELEASED INVOICE SEND MAIL
SELECT sum(TotamAmount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=1) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE O.ClientId=@ClientId AND I.BillStatus=1
GROUP BY O.ClientId

--PAID INVOICE
SELECT sum(TotamAmount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=2) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE O.ClientId=@ClientId AND I.BillStatus=2
GROUP BY O.ClientId

--OVERDUE INCOICE
SELECT sum(TotamAmount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=@clientID AND BillStatus=5) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID AND I.ClientId=O.ClientId
WHERE convert(datetime ,I.Invoicedate ,105) > getdate()
GROUP BY O.ClientId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceEmail4Bulk]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [SP_GetInvoiceEmail4Bulk]

CREATE PROCEDURE [dbo].[SP_GetInvoiceEmail4Bulk]
	
AS
BEGIN

select SUNJECT, BODY from tbl_InvoiceEmailTemplate WHERE TEMPLATEID = 2002

	SELECT 'Invoice' AS TableName,I.InvoiceID, I.InvoiceName,I.Invoicedate,I.TermCode,I.TotamAmount AS TOTAL,
'You have an invoice form '+ClientName+' due on ' AS [SUBJECT],CustomerName,ClientName,C.Email,
DATEADD(DAY,convert(int,K.Value2),convert(date, Invoicedate, 105)) [Duedate],PrimaryEmailID,I.BillStatus,I.[Description],
I.Subtotal,I.Tax,C.ContactNumber,C.City,C.[State],C.Zip,C.BillingAddress
FROM Tbl_Invoice I 
left JOIN Tbl_OrderInvoice O  ON I.InvoiceName=O.InvID
JOIN Tbl_customers C on C.CustomerID=I.Customerid
JOIN Tbl_client CL on CL.ClientID=I.ClientId
JOIN keylist K ON K.[Value1]=I.TermCode
JOIN TBL_ACCOUNTS ON AccountID=I.CreatedBY
WHERE I.InvoiceId in (Select invoiceid from tbl_InvMailSts where sts = 'P')


select 'OrderList' AS TableName,I.InvoiceID, OO.[Description],O.Amount 
,O.Price,O.quantity
from tbl_invoice I
join tbl_orderinvoice O on I.InvoiceName=O.InvID
left join Tbl_Order OO on o.OrderId=OO.OrderId
where I.InvoiceId in (Select invoiceid from tbl_InvMailSts where sts = 'P')

SELECT 'Partial' as TableName,OF_INVOICE_ID, OF_INVOICE_DATE,OF_INVOICE_AMOUNT,OF_PAID_AMT,OF_BALANCE_AMT,
'Partially Paid' as [Status],Value1 AS Mode,OF_PAID_DATE
FROM Tbl_Offline_Payment 
join keylist on keylistid=OF_PAY_TYPE
where OF_INVOICE_ID in (Select invoiceid from tbl_InvMailSts where sts = 'P')


END


--

--select * from tbl_orderinvoice order by 1 desc

--select * from tbl_invoice where invoicename='INVO1736'
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceEmaildetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoiceEmaildetails]
	@invoiceid numeric(18,0),@userid numeric(18,0)=null
AS
BEGIN
DECLARE @INVOICE NVARCHAR(200)
SET @INVOICE=(SELECT MasterInvoice FROM Tbl_Invoice where InvoiceId=@invoiceid)
IF(@INVOICE!='')
BEGIN
	SELECT 'Invoice' AS TableName, I.InvoiceName,I.Invoicedate,I.TermCode,I.TotamAmount AS TOTAL,
'You have an invoice form '+ClientName+' due on ' AS [SUBJECT],CustomerName,ClientName,C.Email,
DATEADD(DAY,convert(int,K.Value2),convert(date, Invoicedate, 105)) [Duedate],PrimaryEmailID,I.BillStatus,I.[Description],
I.TotamAmount AS Subtotal,I.Tax,C.ContactNumber,C.City,C.[State],C.Zip,C.BillingAddress
,I.CreatedBY
FROM Tbl_Invoice I 
left JOIN Tbl_OrderInvoice O  ON I.InvoiceName=O.InvID
JOIN Tbl_customers C on C.CustomerID=I.Customerid
JOIN Tbl_client CL on CL.ClientID=I.ClientId
JOIN keylist K ON K.[Value1]=I.TermCode
JOIN TBL_ACCOUNTS ON AccountID=I.CreatedBY
WHERE I.InvoiceId=@invoiceid
END
ELSE
BEGIN
	SELECT 'Invoice' AS TableName, I.InvoiceName,I.Invoicedate,I.TermCode,I.TotamAmount AS TOTAL,
'You have an invoice form '+ClientName+' due on ' AS [SUBJECT],CustomerName,ClientName,C.Email,
DATEADD(DAY,convert(int,K.Value2),convert(date, Invoicedate, 105)) [Duedate],PrimaryEmailID,I.BillStatus,I.[Description],
I.Subtotal,I.Tax,C.ContactNumber,C.City,C.[State],C.Zip,C.BillingAddress
FROM Tbl_Invoice I 
left JOIN Tbl_OrderInvoice O  ON I.InvoiceName=O.InvID
JOIN Tbl_customers C on C.CustomerID=I.Customerid
JOIN Tbl_client CL on CL.ClientID=I.ClientId
JOIN keylist K ON K.[Value1]=I.TermCode
JOIN TBL_ACCOUNTS ON AccountID=I.CreatedBY
WHERE I.InvoiceId=@invoiceid
END
--GROUP BY I.InvoiceName,I.Invoicedate,I.TermCode,I.TermCode,CustomerName,ClientName,C.Email,
--K.Value2,PrimaryEmailID,I.BillStatus,I.[Description],I.TotamAmount


IF(@INVOICE!='')
BEGIN
select 'OrderList' AS TableName, P.ProductName as [Description],O.Amount 
,O.Price,O.quantity
from tbl_invoice I
join tbl_orderinvoice O on I.MasterInvoice=O.InvID
left join Tbl_Order OO on o.OrderId=OO.OrderId
JOIN Tbl_product P on P.ProductID=O.Product
where I.InvoiceId=@invoiceid
END
ELSE

BEGIN
select 'OrderList' AS TableName, P.ProductName as [Description],O.Amount 
,O.Price,O.quantity
from tbl_invoice I
join tbl_orderinvoice O on I.InvoiceName=O.InvID
left join Tbl_Order OO on o.OrderId=OO.OrderId
JOIN Tbl_product P on P.ProductID=O.Product
where I.InvoiceId=@invoiceid
END

SELECT 'Partial' as TableName, OF_INVOICE_DATE,OF_INVOICE_AMOUNT,OF_PAID_AMT,OF_BALANCE_AMT,
'Partially Paid' as [Status],Value1 AS Mode,OF_PAID_DATE
FROM Tbl_Offline_Payment 
join keylist on keylistid=OF_PAY_TYPE
where OF_INVOICE_ID=@invoiceid


SELECT 'Maildetail' as TableName, PrimaryEmailID FROM Tbl_Accounts where AccountID=@userid

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceEmaildetailsPaynow]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoiceEmaildetailsPaynow]
	@invoiceid numeric(18,0)
AS
BEGIN
DECLARE @INVOICE NVARCHAR(200)
SET @INVOICE=(SELECT MasterInvoice FROM Tbl_Invoice where InvoiceId=@invoiceid)
IF(@INVOICE!='')
BEGIN
	SELECT 'Invoice' AS TableName, I.InvoiceName,I.Invoicedate,I.TermCode,TotamAmount AS TOTAL,
'You have an invoice form ISC Term Code Is '+I.TermCode+'' AS [SUBJECT],CustomerName,ClientName,C.Email
,DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate]
,I.Subtotal
FROM Tbl_Invoice I
LEFT JOIN Tbl_OrderInvoice O ON I.MasterInvoice=O.InvID
JOIN Tbl_customers C on C.CustomerID=I.Customerid
JOIN Tbl_client CL on CL.ClientID=O.ClientId
JOIN keylist K ON K.[Value1]=I.TermCode
WHERE I.InvoiceId=@invoiceid AND I.BillStatus=1
--GROUP BY I.InvoiceName,I.Invoicedate,I.TermCode,I.TermCode,CustomerName,ClientName,C.Email,I.TotamAmount,K.Value2
END

ELSE
BEGIN
SELECT 'Invoice' AS TableName, I.InvoiceName,I.Invoicedate,I.TermCode,TotamAmount AS TOTAL,
'You have an invoice form ISC Term Code Is '+I.TermCode+'' AS [SUBJECT],CustomerName,ClientName,C.Email
,DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate]
,I.Subtotal
FROM Tbl_Invoice I
left JOIN Tbl_OrderInvoice O ON I.InvoiceName=O.InvID
JOIN Tbl_customers C on C.CustomerID=I.Customerid
JOIN Tbl_client CL on CL.ClientID=O.ClientId
JOIN keylist K ON K.[Value1]=I.TermCode
WHERE I.InvoiceId=@invoiceid AND I.BillStatus=1
--GROUP BY I.InvoiceName,I.Invoicedate,I.TermCode,I.TermCode,CustomerName,ClientName,C.Email,I.TotamAmount,K.Value2
END

IF(@INVOICE!='')
BEGIN

select 'OrderList' AS TableName, OO.ProductName as [Description],O.Amount 
,O.quantity,O.Price
from tbl_invoice I
join tbl_orderinvoice O on I.MasterInvoice=O.InvID
left join tbl_product OO on OO.ProductID=O.Product
where I.InvoiceId=@invoiceid
END

ELSE

BEGIN   
select 'OrderList' AS TableName, OO.ProductName as [Description],O.Amount 
,O.quantity,O.Price
from tbl_invoice I
join tbl_orderinvoice O on I.InvoiceName=O.InvID
left join tbl_product OO on OO.ProductID=O.Product
where I.InvoiceId=@invoiceid
END 
END


GO
/****** Object:  StoredProcedure [dbo].[SP_Getinvoiceemailtemplte]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Getinvoiceemailtemplte]
	@TempId numeric(18,0)
AS
BEGIN
	SELECT TemplateID,Sunject,Body FROM tbl_InvoiceEmailTemplate
	WHERE TemplateID=@TempId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceKPI]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetInvoiceKPI] 
	@ClientId numeric(18,0)
AS
BEGIN
	-- UN SUBMITTED 
SELECT sum(Amount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=2000) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID
WHERE O.ClientId=2000 AND BillStatus=0
GROUP BY O.ClientId

--RELEASED INVOICE SEND MAIL
SELECT sum(Amount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=2000) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID
WHERE O.ClientId=2000 AND BillStatus=1
GROUP BY O.ClientId

--PAID INVOICE
SELECT sum(Amount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=2000) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID
WHERE O.ClientId=2000 AND BillStatus=2
GROUP BY O.ClientId

--OVERDUE INCOICE
SELECT sum(Amount) Amount,
(SELECT DISTINCT  COUNT(InvoiceId) FROM tbl_invoice WHERE O.ClientId=2000) [Invoice]
FROM  Tbl_OrderInvoice O
JOIN tbl_invoice I ON I.InvoiceName=O.InvID
WHERE O.ClientId=2000 AND BillStatus=2
GROUP BY O.ClientId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceLineItem]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetInvoiceLineItem]
                       
@invId numeric(18,0)
AS
BEGIN

DECLARE @INVOICE NVARCHAR(200)
SET @INVOICE=(SELECT MasterInvoice FROM Tbl_Invoice where InvoiceId=@invId)
IF(@INVOICE!='')
BEGIN
	select   A.[Product]
			 ,A.[quantity]
			 ,A.[Price]
			 ,A.[Discount]
			 ,A.[Tax]
			 ,B.[TotamAmount]
			 ,C.[ProductName]
			 ,A.[InvID]
			 from [dbo].[Tbl_OrderInvoice] As A
			 Left join [dbo].[Tbl_Invoice] As B on B.MasterInvoice = A.[InvID]
			 left join [dbo].[Tbl_Product] AS C On A.[Product]=C.[ProductID]
			 where InvoiceId = @invId
 END
 ELSE

 BEGIN
 	select   A.[Product]
			 ,A.[quantity]
			 ,A.[Price]
			 ,A.[Discount]
			 ,A.[Tax]
			 ,B.[TotamAmount]
			 ,C.[ProductName]
			 ,A.[InvID]
			 from [dbo].[Tbl_OrderInvoice] As A
			 Left join [dbo].[Tbl_Invoice] As B on B.[InvoiceName] = A.[InvID]
			 left join [dbo].[Tbl_Product] AS C On A.[Product]=C.[ProductID]
			 where InvoiceId = @invId
 END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_GetInvoiceList 0,10,'CustomerName asc','9502','0',2000
CREATE PROCEDURE [dbo].[SP_GetInvoiceList]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',
	@customerid NVARCHAR(MAX),@invoiceno NVARCHAR(max),
	@clientID NVARCHAR(MAX),@status nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 
DECLARE @wher NVARCHAR(max) ='' 

IF @customerid !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + 'and Customerid IN ('+@customerid+')'               
END 

IF @invoiceno !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + 'and InvID IN ('''+@invoiceno+''')'               
END

IF @status !='6'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + 'and BillStatus IN ('+@status+')'               
END 

IF @customerid!='0' OR @invoiceno !='0'
BEGIN
SET @wher=@wher+'WHERE'
END

--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
--END




SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''Invoicelist'' AS TableName, [InvID],[Dueamount],[Description]        
,[Invoicedate],[Status],CustomerName,Customerid,InvoiceId,TermCode,Duedate,ClientId,BillStatus,MasterInvoice
 FROM [View_InvoiceList] WHERE ClientId= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +     
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
 
 @dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT InvID) AS Count FROM [View_InvoiceList]'              
+ '              
 WHERE  ClientId= '+ CAST(@clientID AS VARCHAR(MAX))  + ' '          
 + @dynamicwhere    

PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)
END





GO
/****** Object:  StoredProcedure [dbo].[SP_GetLoginSummary]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetLoginSummary]  
AS   
BEGIN  
SELECT  
 Convert(date, A.LoginTime) as 'Date',  
ISNULL( C.ClientName,'Unauthorised ') AS 'Company',  
 Count(LoginName)  AS 'Total Logins',  
Count(Distinct LoginName) AS 'Unique Logins'  ,
C.ClientName
FROM Tbl_LoginAudit AS A  
LEFT JOIN Tbl_Accounts AS B  
ON A.LoginName=B.UserName  
LEFT JOIN TBl_Client AS C  
ON C.ClientID=B.ClientID  
group by   Convert(date, A.LoginTime),C.ClientName  
order by 1  desc  
END

select * from Tbl_LoginAudit
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMarkaspaid_Emaildetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetMarkaspaid_Emaildetails]
	@Billid NUMERIC(18,0)
AS
BEGIN
	SELECT PAI.FirstName [User],PAI.PrimaryEmailID, BA.FirstName,BA.PrimaryEmailID [Clerkmail],
	APP.FirstName,APP.PrimaryEmailID [Approvevermail],BAP.CreatedOn [PaidOn]
	,BLA.AmountPaid,B.InvoiceNumber [BillNo],BLA.DueOn,K.Value1
	FROM 
	Tbl_Bill B
	JOIN Tbl_Accounts BA ON BA.AccountID=B.AccountID
	JOIN Tbl_BillPaidAttachments BAP ON B.BillID =BAP.BillID
	JOIN Tbl_Accounts PAI ON BAP.CreatedBy=PAI.AccountID
	JOIN Tbl_ApproveHistory AH ON B.BillID=AH.BillID
	JOIN Tbl_Accounts APP ON AH.ApproverID=APP.AccountID
	JOIN Tbl_BillApproved BLA ON BLA.BillID =B.BillID 
	JOIN KEYLIST K ON BLA.PaymentMode=K.KEYLISTID
	WHERE B.BillID=@Billid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateBillCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_GetPaginateBillCategory]     
@start INT,    
@skip INT,    
@orderby NVARCHAR(max),     
@clientID NUMERIC(18,0),
@status Numeric(18,0),
@billCategory NVARCHAR(max) 
AS  
BEGIN    
    
DECLARE @dynamicwhere NVARCHAR(max)=''    
DECLARE @dynamicsql NVARCHAR(max) =''    
DECLARE @orderbydynamic NVARCHAR(max) =''

IF(@status!=0)
BEGIN
SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '
END

IF(@billCategory!='')
BEGIN
SET @dynamicwhere = @dynamicwhere + ' AND BillCategory = '+CAST(@billCategory AS VARCHAR(MAX))+'  '
END

SET @orderByDynamic = ' ORDER BY '+@orderBy    
    
 

SET @dynamicsql='SELECT ''BillCategoryList'' AS TableName,[BillCategoryId],[BillCategory],[Description],[Status],[StrStatus]
FROM [View_BillCategory] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '    
+ Cast(@start AS NVARCHAR(max))    
+ ' ROWS FETCH NEXT '    
+ Cast(@skip AS NVARCHAR(max))     
+ ' ROWS ONLY'   
    
PRINT ( @dynamicsql )    
    
EXEC(@dynamicsql)    
    
DECLARE    
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillCategoryId) AS Count FROM View_BillCategory'    
+ '    
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '
 + @dynamicwhere
PRINT( @dynamiccountsql )    
    
EXEC(@dynamiccountsql)    
    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [SP_GetPaginateBillList]  0,10,'DueDate asc',30040,0,0,0,0,'0','01/01/2001','01/01/2022',0,0,0      
          
CREATE PROCEDURE [dbo].[SP_GetPaginateBillList]                   
@start INT,                  
@skip INT,                  
@orderby NVARCHAR(max),                   
@accountID NUMERIC(18,0),              
@statusCondition NUMERIC(18,0),              
@status NUMERIC(18,0),              
@isRecurring NUMERIC(18,0)    ,          
@vendor NUMERIC(18,0)    ,          
@invoiceNumber NVARCHAR(max),                   
@dueFrom NVARCHAR(MAX),                
@dueTo NVARCHAR(MAX),             
@dStatus NUMERIC(18,0)  ,        
@kpiStatus NUMERIC(18,0),
@Isallbill NUMERIC(18,0)  
AS                  
BEGIN                  
                  
DECLARE @dynamicwhere NVARCHAR(max)=''                  
DECLARE @dynamicsql NVARCHAR(max) =''                  
DECLARE @orderbydynamic NVARCHAR(max) =''         
    
              
IF @status!=0              
BEGIN              
IF @statusCondition !=0                  
BEGIN                  
SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '                  
END               
ELSE              
BEGIN              
SET @dynamicwhere = @dynamicwhere + ' AND Status != '+CAST(@status AS VARCHAR(MAX))+'  '                  
END              
END              
IF @isRecurring!=0              
BEGIN              
SET @dynamicwhere = @dynamicwhere + ' AND IsRecurring = '+CAST(1 AS VARCHAR(MAX))+'  '                  
END            
    --      IF @Isallbill!=0
		  --BEGIN
		  --SET @dynamicwhere = @dynamicwhere + ' AND Status IN(50044,50044)'                  
		  --END
IF @vendor !=0          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '          
END          
          
IF @invoiceNumber !='0'          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '          
END          
          
--IF @dStatus !=0          
--BEGIN          
--SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '          
--END          
          
IF @dueFrom !='' AND @dueTo !=''                        
BEGIN                            
SET @dynamicwhere = @dynamicwhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
END            
        
IF @kpiStatus !=0        
 BEGIN        
 SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@kpiStatus AS VARCHAR(MAX))+'  '          
 END        
 ELSE IF @kpiStatus =0  AND @dStatus !=0        
 BEGIN        
 SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '          
 END        
        
              
              
SET @orderByDynamic = ' ORDER BY '+@orderBy                  
                  
 SET @dynamicsql=' SELECT   ''BillList'' AS TableName,  [BillID],[VendorID],[AccountID],[BillDate],[Amount],[InvoiceNumber],[DueDate],[Category]              
      ,[Notes],[PaymentTerms],[Description],[IsSplitted],[StageName],[Status] ,[CreatedOn],[CreatedBy] ,NextDueDate             
      ,[StatusName],[IsRecurring],[VendorName] ,[PaymentMode],ApprovalStage          
  FROM [View_BillRead]              
  WHERE CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) +' '+  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '                  
+ Cast(@start AS NVARCHAR(max))                  
+ ' ROWS FETCH NEXT '                  
+ Cast(@skip AS NVARCHAR(max))                  
+ ' ROWS ONLY'                
                  
PRINT ( @dynamicsql )                  
                  
EXEC(@dynamicsql)                  
                  
DECLARE                  
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT InvoiceNumber) AS Count FROM View_BillRead'                  
+ '                  
WHERE CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + ' ' +  @dynamicwhere              
PRINT( @dynamiccountsql )                  
                  
EXEC(@dynamiccountsql)         
    
--GetTab counts for search    
    
DECLARE @dynamicTabCountWhere NVARCHAR(max)=''      
    
IF  @dStatus !=0        
BEGIN        
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND Status = '+CAST(@dStatus AS VARCHAR(MAX))+'  '          
END      
    
IF @dueFrom !='' AND @dueTo !=''                        
BEGIN                            
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
END      
    
IF @vendor !=0          
BEGIN          
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '          
END          
          
IF @invoiceNumber !='0'          
BEGIN          
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '          
END     
    
DECLARE                  
@dynamicTabCountSql NVARCHAR(max) = 'SELECT ''SearchedTabCounts'' AS TableName,    
 (Select Count(BillId) FROM View_BillRead WHERE CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + '    
 AND Status  in (''50015'',''50016'',''50017'',''50018'',''50019'',''50034'',''50036'')  ' +  @dynamicTabCountWhere+ ')AS ''UnPaidCount'',    
 (Select Count(BillId) FROM View_BillRead WHERE  CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + '    
 AND Status ='+ CAST(50044 AS VARCHAR(MAX)) + '  ' +  @dynamicTabCountWhere + ') AS ''PaidCount'',    
 (Select Count(Distinct InvoiceNumber) FROM View_BillRead WHERE  CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + '    
 AND IsRecurring='+ CAST(1 AS VARCHAR(MAX)) + ' ' +  @dynamicTabCountWhere + ') AS ''RecurringCount'',
 (Select Count(Distinct InvoiceNumber) FROM View_BillRead WHERE  CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + '    
  ' +  @dynamicTabCountWhere + ') AS ''AllBillcount'''    
    
PRINT( @dynamicTabCountSql )                  
                  
EXEC(@dynamicTabCountSql)      
    
    
    
                  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateCustomers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_GetPaginateCustomers 0,10,'Email Asc',2000,'sdlvnk',0.00,0,0  
  
CREATE PROCEDURE [dbo].[SP_GetPaginateCustomers]         
@start INT,        
@skip INT,        
@orderby NVARCHAR(max),         
@clientID NUMERIC(18,0),    
@customerName NVARCHAR(max),    
@expenses NUMERIC(18,2),    
@associatedProject NUMERIC(18,0),    
@associatedBill NUMERIC(18,0)  
AS      
BEGIN        
        
DECLARE @dynamicwhere NVARCHAR(max)=''        
DECLARE @dynamicsql NVARCHAR(max) =''        
DECLARE @orderbydynamic NVARCHAR(max) =''    
    
IF(@customerName!='')    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND CustomerName = '''+CAST(@customerName AS VARCHAR(MAX))+'''  '    
END   
  
IF(@expenses!=0)    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND Expenses = '+CAST(@expenses AS VARCHAR(MAX))+'  '    
END   
  
IF(@associatedProject!=0)    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND AssociatedProjects = '+CAST(@associatedProject AS VARCHAR(MAX))+'  '    
END   
  
IF(@associatedBill!=0)    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND AssociatedBills = '+CAST(@associatedBill AS VARCHAR(MAX))+'  '    
END   
    
--IF(@billCategory!='')    
--BEGIN    
--SET @dynamicwhere = @dynamicwhere + ' AND BillCategory = '+CAST(@billCategory AS VARCHAR(MAX))+'  '    
--END    
    
SET @orderByDynamic = ' ORDER BY '+@orderBy        
        
     
    
SET @dynamicsql='SELECT ''CustomersList'' AS TableName,[CustomerID],[CustomerName],[Email],[ContactNumber],[CustomerAddress],AssociatedProjects,Expenses,AssociatedBills,AssociatedCounts   
FROM [View_Customers] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '        
+ Cast(@start AS NVARCHAR(max))        
+ ' ROWS FETCH NEXT '        
+ Cast(@skip AS NVARCHAR(max))         
+ ' ROWS ONLY'       
        
PRINT ( @dynamicsql )        
        
EXEC(@dynamicsql)        
        
DECLARE        
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT CustomerID) AS Count FROM View_Customers'        
+ '        
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '    
 + @dynamicwhere    
PRINT( @dynamiccountsql )        
        
EXEC(@dynamiccountsql)        
        
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateDenaliSyncList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec [SP_GetPaginateBillList]  0,10,' CreatedOn ASC',30040,0,50044,0,0,'0','01/01/2000','01/01/2025',50015,0        
          
--Execute SP_GetPaginateDenaliSyncList 0,10,'id ASC',30040,'Sync Completed','',''

CREATE PROCEDURE [dbo].[SP_GetPaginateDenaliSyncList]                   
@start INT,                  
@skip INT,                  
@orderby NVARCHAR(max),                   
@accountID NUMERIC(18,0),                         
@status NVARCHAR(MAX),                  
@startDate NVARCHAR(MAX),                
@endDate NVARCHAR(MAX)             
    
AS                  
BEGIN                  
                  
DECLARE @dynamicwhere NVARCHAR(max)=''                  
DECLARE @dynamicsql NVARCHAR(max) =''                  
DECLARE @orderbydynamic NVARCHAR(max) =''         
    
              
IF @status !='999999999'                 
BEGIN                  
SET @dynamicwhere = @dynamicwhere + ' AND syncsts ='''+@status+'''  '                  
END  

IF @accountID !=0                  
BEGIN                  
SET @dynamicwhere = @dynamicwhere + ' AND syncby = '+CAST(@accountID AS VARCHAR(MAX))+'  '                  
END  
  
IF @startDate !='' AND @endDate !=''                        
BEGIN                            
SET @dynamicwhere = @dynamicwhere + ' AND syncdate  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),101)+''''                            
END            
                 
SET @orderByDynamic = ' ORDER BY '+@orderBy                  
                  
 SET @dynamicsql=' SELECT   ''SyncList'' AS TableName,  [id],[syncdate],[syncby],[syncsts],[syncDesc],[syncbyname]
  FROM [View_SyncList]              
  WHERE id !=0 '+  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '                  
+ Cast(@start AS NVARCHAR(max))                  
+ ' ROWS FETCH NEXT '                  
+ Cast(@skip AS NVARCHAR(max))                  
+ ' ROWS ONLY'                
                  
PRINT ( @dynamicsql )                  
                  
EXEC(@dynamicsql)                  
                  
DECLARE                  
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT id) AS Count FROM View_SyncList'                  
+ '                  
WHERE id !=0 ' +  @dynamicwhere              
PRINT( @dynamiccountsql )                  
                  
EXEC(@dynamiccountsql)         
                   
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateExportBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
  
 --EXEC SP_GetPaginateExportBillList 0,10,'DueOn desc','2000','04/01/2020','04/01/2021','50023'      
       
 CREATE PROCEDURE [dbo].[SP_GetPaginateExportBillList]                 
@start INT,                
@skip INT,                
@orderby NVARCHAR(max),                 
@clientID NUMERIC(18,0)  ,          
@dueFrom NVARCHAR(MAX),          
@dueTo NVARCHAR(MAX),          
@paymentStatus NVARCHAR(MAX)           
AS          
BEGIN                
                
DECLARE @dynamicwhere NVARCHAR(max)=''                
DECLARE @dynamicsql NVARCHAR(max) =''                
DECLARE @orderbydynamic NVARCHAR(max) =''            
            
IF @dueFrom !='' AND @dueTo !=''                  
BEGIN   
Set @dueFrom=Convert(date,@dueFrom)  
SET @dueTo=Convert(date,@dueTo)  
SET @dynamicwhere = @dynamicwhere + ' AND Convert(date, DueOn)  BETWEEN '''+@dueFrom+''' AND '''+@dueTo+''''                      
END           
IF @paymentStatus !='0'                 
BEGIN                  
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus IN ('''+@paymentStatus+''')'                 
END          
ELSE      
BEGIN       
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus IN (''50023'',''50044'')'                 
END      
          
SET @orderByDynamic = ' ORDER BY '+@orderBy                
                
 SET @dynamicsql=' SELECT ''ExportBills'' As ''TableName'',  [IdentityID],[BillID],[ApprovedAmount],[Status]        
,[PaymentStatus],Convert(varchar,[DueOn],101)   AS ''DueOn'' ,[VendorID],[VendorName] ,Description,InvoiceNumber ,PaymentMode       
 FROM [dbo].[View_ExportBillRead] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +        
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '                
+ Cast(@start AS NVARCHAR(max))                
+ ' ROWS FETCH NEXT '                
+ Cast(@skip AS NVARCHAR(max))                 
+ ' ROWS ONLY'      
           
PRINT ( @dynamicsql )                
                
EXEC(@dynamicsql)                
                
DECLARE                
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT IdentityID) AS Count FROM View_ExportBillRead'                
+ '                
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '            
 + @dynamicwhere            
PRINT( @dynamiccountsql )                
                
EXEC(@dynamiccountsql)                
                
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateGLCodes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[SP_GetPaginateGLCodes]       
@start INT,      
@skip INT,      
@orderby NVARCHAR(max),       
@clientID NUMERIC(18,0)  
AS    
BEGIN      
      
DECLARE @dynamicwhere NVARCHAR(max)=''      
DECLARE @dynamicsql NVARCHAR(max) =''      
DECLARE @orderbydynamic NVARCHAR(max) =''  
  
SET @orderByDynamic = ' ORDER BY '+@orderBy      
      
   
  
SET @dynamicsql='SELECT ''GlList'' AS TableName,[IdentityID],[ClientID],[GLNumber],[GLDescription],[RowStatus]  
,[CreatedBy],[CreatedOn],[CreatedByName]  
FROM [View_GlCodeRead] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '      
+ Cast(@start AS NVARCHAR(max))      
+ ' ROWS FETCH NEXT '      
+ Cast(@skip AS NVARCHAR(max))       
+ ' ROWS ONLY'     
      
PRINT ( @dynamicsql )      
      
EXEC(@dynamicsql)      
      
DECLARE      
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT IdentityID) AS Count FROM View_GlCodeRead'      
+ '      
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '  
 + @dynamicwhere  
PRINT( @dynamiccountsql )      
      
EXEC(@dynamiccountsql)      
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateProjects]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SP_GetPaginateCustomers 0,10,'Email Asc',2000,'sdlvnk',0.00,0,0  
  
CREATE PROCEDURE [dbo].[SP_GetPaginateProjects]         
@start INT,        
@skip INT,        
@orderby NVARCHAR(max),         
@clientID NUMERIC(18,0), 
@projectName NVARCHAR(max)='',
@customerName NVARCHAR(max)='',    
@projectType NVARCHAR(max)='',    
@status NUMERIC(18,0) 
AS      
BEGIN        
        
DECLARE @dynamicwhere NVARCHAR(max)=''        
DECLARE @dynamicsql NVARCHAR(max) =''        
DECLARE @orderbydynamic NVARCHAR(max) =''  

IF @projectName <> '0' AND @projectName <> ''          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND ProjectID IN ( SELECT [value] from dbo.[fn_split]('''+@projectName+''','','')) '          
END     

IF @customerName <> '0' AND @customerName <> ''          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND Customer IN ( SELECT [value] from dbo.[fn_split]('''+@customerName+''','','')) '          
END     

IF @projectType <> '0' AND @projectType <> ''          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND ProjectType IN ( SELECT [value] from dbo.[fn_split]('''+@projectType+''','','')) '          
END     
      
  
IF(@status!=0)    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND ProjectStatus = '+CAST(@status AS VARCHAR(MAX))+'  '    
END   
    
--IF(@billCategory!='')    
--BEGIN    
--SET @dynamicwhere = @dynamicwhere + ' AND BillCategory = '+CAST(@billCategory AS VARCHAR(MAX))+'  '    
--END    
    
SET @orderByDynamic = ' ORDER BY '+@orderBy        
        
     
    
SET @dynamicsql='SELECT ''ProjectList'' AS TableName,[ProjectID],[ProjectName],[Customer],[ProjectDescription],[ProjectType],[ProjectStatus],StrCustomerName,StrProjectType  ,StrStatus  
FROM [View_Projects] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '        
+ Cast(@start AS NVARCHAR(max))        
+ ' ROWS FETCH NEXT '        
+ Cast(@skip AS NVARCHAR(max))         
+ ' ROWS ONLY'       
        
PRINT ( @dynamicsql )        
        
EXEC(@dynamicsql)        
        
DECLARE        
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT ProjectID) AS Count FROM View_Projects'        
+ '        
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '    
 + @dynamicwhere    
PRINT( @dynamiccountsql )        
        
EXEC(@dynamiccountsql)        
        
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateUserHomeBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec SP_GetPaginateUserHomeBillList 0,10,'CreatedOn Desc',30040,50019,0,'05/01/2020','05/31/2021',0        
          
CREATE PROCEDURE [dbo].[SP_GetPaginateUserHomeBillList]                   
@start INT,                  
@skip INT,                  
@orderby NVARCHAR(max),                   
@accountID NUMERIC(18,0),                 
@status NUMERIC(18,0),              
@isOverDue NUMERIC(18,0)  ,          
@startDate NVARCHAR(MAX),          
@endDate NVARCHAR(MAX)  ,        
@kpiStatus NUMERIC(18,0)  ,  
@isDueFilter NUMERIC(18,0)  
AS                  
BEGIN                  
                  
DECLARE @dynamicwhere NVARCHAR(max)=''                  
DECLARE @dynamicsql NVARCHAR(max) =''                  
DECLARE @orderbydynamic NVARCHAR(max) =''              
              
IF( @isOverDue=0   AND    @isDueFilter=0 )       
 BEGIN              
                    
    -- SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '           
  SET @dynamicwhere = @dynamicwhere + ' AND Convert(varchar, CreatedOn,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''          
                 
END    
ELSE IF( @isOverDue=0   AND    @isDueFilter=1 )       
 BEGIN              
                    
    -- SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '           
  SET @dynamicwhere = @dynamicwhere + ' AND Convert(varchar, DueDate,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''          
                 
END    
ELSE          
BEGIN          
   --SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '           
   SET @dynamicwhere = @dynamicwhere + ' AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) '          
END          
              
IF @kpiStatus !=0        
BEGIN        
  SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@kpiStatus AS VARCHAR(MAX))+'  '           
END        
ELSE        
BEGIN         
 SET @dynamicwhere = @dynamicwhere + ' AND Status = '+CAST(@status AS VARCHAR(MAX))+'  '           
END        
              
SET @orderByDynamic = ' ORDER BY '+@orderBy                  
                  
 SET @dynamicsql=' SELECT   ''BillList'' AS TableName,  [BillID],[VendorID],[AccountID],[BillDate],[Amount],[InvoiceNumber],[DueDate],[Category]              
      ,[Notes],[PaymentTerms],[Description],[IsSplitted],[StageName],[Status] ,[CreatedOn],[CreatedBy]     ,NextDueDate         
      ,[StatusName],[IsRecurring],[VendorName] ,ApprovalStage             
  FROM [View_BillRead]              
  WHERE CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) +' '+  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '                  
+ Cast(@start AS NVARCHAR(max))                  
+ ' ROWS FETCH NEXT '                  
+ Cast(@skip AS NVARCHAR(max))                  
+ ' ROWS ONLY'                
                  
PRINT ( @dynamicsql )                  
                  
EXEC(@dynamicsql)                  
                  
DECLARE                  
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM View_BillRead'                  
+ '                  
WHERE CreatedBy= '+ CAST(@accountID AS VARCHAR(MAX)) + ' ' +  @dynamicwhere              
PRINT( @dynamiccountsql )                  
                  
EXEC(@dynamiccountsql)                  
                  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateUserList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_GetPaginateUserList]           
@start INT,          
@skip INT,          
@orderby NVARCHAR(max),           
@clientID NUMERIC(18,0)  ,    
@userID NVARCHAR(MAX),    
@role NVARCHAR(MAX),    
@status NVARCHAR(MAX)     
AS        
BEGIN          
          
DECLARE @dynamicwhere NVARCHAR(max)=''          
DECLARE @dynamicsql NVARCHAR(max) =''          
DECLARE @orderbydynamic NVARCHAR(max) =''      
      
IF @userID !=0            
BEGIN                       
SET @dynamicwhere = @dynamicwhere + ' AND AccountID IN ('+@userID+')'           
END     
IF @role !=0            
BEGIN            
SET @dynamicwhere = @dynamicwhere + ' AND ApplicationRole IN ('+@role+')'           
END     
IF @status !=0           
BEGIN            
SET @dynamicwhere = @dynamicwhere + ' AND IsActive IN ('+@status+')'           
END     
    
    
    
SET @orderByDynamic = ' ORDER BY '+@orderBy          
          
       
      
SET @dynamicsql='SELECT ''UserList'' AS TableName, [AccountID],[Role],[UserName],[Password],[FirstName],[LastName],[PrimaryEmailID]
,[PhoneNumber],[Address1],[Address2],[Zipcode],[IsActive],[EntityStatus],[CreatedOn]
,[CreatedBy],[UpdatedOn],[UpdatedBy],[ClientID],[AdministrationRole],[ApplicationRole]
,[StrStatus],[RoleName]
FROM [View_UserRead]  WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +  
@dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '          
+ Cast(@start AS NVARCHAR(max))          
+ ' ROWS FETCH NEXT '          
+ Cast(@skip AS NVARCHAR(max))           
+ ' ROWS ONLY'        
          
PRINT ( @dynamicsql )          
          
EXEC(@dynamicsql)          
          
DECLARE          
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT AccountID) AS Count FROM View_UserRead'          
+ '          
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '      
 + @dynamicwhere      
PRINT( @dynamiccountsql )          
          
EXEC(@dynamiccountsql)          
          
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaginateVendorList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --Execute SP_GetPaginateVendorList 0,10,'VendorName ASC ',2000,'','',''
 
 CREATE PROCEDURE [dbo].[SP_GetPaginateVendorList]               
@start INT,              
@skip INT,              
@orderby NVARCHAR(max),               
@clientID NUMERIC(18,0)  ,        
@vendorName NVARCHAR(MAX),        
@balance NVARCHAR(MAX),        
@lastPayment NVARCHAR(MAX)         
AS            
BEGIN              
              
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) =''          
          
IF @vendorName !=''                
BEGIN                
--AND (AccountName LIKE ''%'+REPLACE(@name, '%', '[%]')+'%''  OR OfficeEmailID LIKE ''%' + REPLACE(@name, '%', '[%]')+'%'')'          
--SET @dynamicwhere = @dynamicwhere + ' AND VendorName like  %'''+CAST(@vendorName AS NVARCHAR(MAX))+'''%  '                
SET @dynamicwhere = @dynamicwhere + ' AND (VendorName LIKE ''%'+REPLACE(@vendorName, '%', '[%]')+'%'')'                    
END         
IF @balance !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND Balance IN ('+@balance+')'               
END         
IF @lastPayment !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND PaidOn IN ('''+@lastPayment+''')'               
END         
        
SET @dynamicwhere = @dynamicwhere + ' AND VendorName IS NOT NULL AND VendorName != '''''          
        
SET @orderByDynamic = ' ORDER BY '+@orderBy              
              
           
          
 SET @dynamicsql='SELECT ''VendorList'' AS TableName, [VendorID],[VendorName],[Address]        
,[Email],[Balance],[PaidOn] ,NextDueDate,NextDueAmount,TotalPaidAmount    
  FROM [View_VendorRead] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT VendorID) AS Count FROM View_VendorRead'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)              
              
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayerPaginateBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec SP_GetPayerPaginateBillList 0,10,' DueOn asc',0,0,2000,0,'0','','',0,1,'04/11/2021','04/17/2021',''        
--Exec SP_GetPayerPaginateBillList 0,10,' PaidOn asc',50044,0,2000,0,'0','01/01/2001','12/31/2022',0,0,'','','','',''        
      
CREATE PROCEDURE [dbo].[SP_GetPayerPaginateBillList]               
@start INT,              
@skip INT,              
@orderby NVARCHAR(max),               
@status NUMERIC(18,0),          
@isRecurring NUMERIC(18,0),          
@clientID NUMERIC(18,0)  ,          
@vendor NUMERIC(18,0)    ,            
@invoiceNumber NVARCHAR(max),                     
@dueFrom NVARCHAR(MAX),                  
@dueTo NVARCHAR(MAX),               
@dStatus NUMERIC(18,0),      
@kpiStatus NUMERIC(18,0),       
@fromDate NVARCHAR(MAX),      
@toDate NVARCHAR(MAX),      
@overDueDate NVARCHAR(MAX)  ,
@createdDate NVARCHAR(MAX)  ,
@paidDate  NVARCHAR(MAX)  
AS            
BEGIN              
              
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) =''          
          
            
IF @status!=0            
BEGIN            
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus = '+CAST(@status AS VARCHAR(MAX))+'  '                
END            
ELSE          
BEGIN          
IF @dStatus!=0          
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus in ('''+CAST(@status AS VARCHAR(MAX))+''','''+CAST(@dStatus AS VARCHAR(MAX))+''')  '            
END          
          
IF @isRecurring!=0          
BEGIN          
SET @dynamicwhere = @dynamicwhere + ' AND IsRecurring = '+CAST(1 AS VARCHAR(MAX))+'  '              
END          
          
  IF @vendor !=0            
BEGIN            
SET @dynamicwhere = @dynamicwhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '            
END            
            
IF @invoiceNumber !='0'            
BEGIN            
SET @dynamicwhere = @dynamicwhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '            
END            
            
--IF @dStatus !=0  AND @status!=0           
--BEGIN            
--SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus = '+CAST(@dStatus AS VARCHAR(MAX))+'  '            
--END            
            
IF @dueFrom !='' AND @dueTo !=''                          
BEGIN                              
SET @dynamicwhere = @dynamicwhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                              
END
IF @paidDate !=''                           
BEGIN                              
SET @dynamicwhere = @dynamicwhere + ' AND PaidDate  = '''+Convert(varchar(50),Convert(date,@paidDate,101),101)+''' '
END
IF @createdDate !=''              
BEGIN                              
SET @dynamicwhere = @dynamicwhere + ' AND CreatedOn  = '''+Convert(varchar(50),Convert(date,@createdDate,101),101)+''' '
END
IF @kpiStatus !=0  AND @kpiStatus!=1      
 BEGIN        
 SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus = '+CAST(@kpiStatus AS VARCHAR(MAX))+'  '          
 END        
ELSE IF @kpiStatus =0  AND @dStatus !=0        
BEGIN        
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus = '+CAST(@dStatus AS VARCHAR(MAX))+'  '          
END             
IF @fromDate !='' AND @toDate !=''      
BEGIN      
SET @dynamicwhere = @dynamicwhere + ' AND  PaymentStatus='+CAST(50023 AS VARCHAR(MAX))+'  AND  Status='+CAST(50015 AS VARCHAR(MAX))+' AND  DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@fromDate,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@toDate,101),101)+''''        
END      
IF @overDueDate !=''      
BEGIN      
SET @dynamicwhere = @dynamicwhere +' AND   PaymentStatus='+CAST(50023 AS VARCHAR(MAX))+'  AND  Status='+CAST(50015 AS VARCHAR(MAX))+'  AND  [DueOn] < '''+Convert(varchar(50),Convert(date,@overDueDate,101),101)+''''      
END   


      
SET @orderByDynamic = ' ORDER BY '+@orderBy              
              
 SET @dynamicsql='SELECT ''BillList'' AS TableName, [IdentityID],[BillID],[ApprovedAmount],[Status],[PayableAmount],[DueOn],[PaidOn]          
,[VendorID],[PaymentStatus],[Description],[PurchaseOrder],[InvoiceNumber],[IsRecurring]          
,[VendorName],[StageName],[PaymentStatusName],PaymentMode,IsSplitted   
  FROM [View_PayerBillRead]  WHERE ClientID = '+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ' ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))              
+ ' ROWS ONLY'             
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT IdentityID) AS Count FROM View_PayerBillRead'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)              
              
--Get Searched Tab counts    
    
    
DECLARE @dynamicTabCountWhere NVARCHAR(max)=''      
    
IF  @dStatus !=0        
BEGIN        
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND PaymentStatus = '+CAST(@dStatus AS VARCHAR(MAX))+'  '          
END      
    
IF @dueFrom !='' AND @dueTo !=''                        
BEGIN                            
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
END      
    
IF @vendor !=0          
BEGIN          
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND VendorID = '+CAST(@vendor AS VARCHAR(MAX))+'  '          
END          
          
IF @invoiceNumber !='0'          
BEGIN          
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND InvoiceNumber ='''+CAST(@invoiceNumber AS VARCHAR(MAX))+''' '          
END  
IF @paidDate !=''                           
BEGIN                              
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND PaidDate  = '''+Convert(varchar(50),Convert(date,@paidDate,101),101)+''' '
END
IF @createdDate !=''              
BEGIN                              
SET @dynamicTabCountWhere = @dynamicTabCountWhere + ' AND CreatedOn  = '''+Convert(varchar(50),Convert(date,@createdDate,101),101)+''' '
END
    
DECLARE                  
@dynamicTabCountSql NVARCHAR(max) = 'SELECT ''SearchedTabCounts'' AS TableName,    
 (Select Count(DISTINCT IdentityID) FROM View_PayerBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + '     
 AND PaymentStatus  in (''50023'',''50024'',''50025'',''50026'',''50033'',''50044'')  ' +  @dynamicTabCountWhere+ ')AS ''AllCount'',    
 (Select Count(DISTINCT IdentityID) FROM View_PayerBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + '    
 AND PaymentStatus ='+ CAST(50023 AS VARCHAR(MAX)) + '  ' +  @dynamicTabCountWhere + ') AS ''PaymentPendingCount'',    
 (Select Count(DISTINCT IdentityID) FROM View_PayerBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + '    
 AND PaymentStatus ='+ CAST(50033 AS VARCHAR(MAX)) + ' ' +  @dynamicTabCountWhere + ') AS ''DisputedCount'',    
 (Select Count(DISTINCT IdentityID) FROM View_PayerBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + '    
 AND IsRecurring ='+ CAST(1 AS VARCHAR(MAX)) + ' ' +  @dynamicTabCountWhere + ') AS ''RecurringCount'',
  (Select Count(DISTINCT IdentityID) FROM View_PayerBillRead WHERE ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + '    
 AND PaymentStatus ='+ CAST(50044 AS VARCHAR(MAX)) + ' ' +  @dynamicTabCountWhere + ') AS ''Paidbillcount'''    
    
PRINT( @dynamicTabCountSql )                  
                  
EXEC(@dynamicTabCountSql)      
    
    
    
END         
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentBillDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetPaymentBillDetails]
@IdentityId numeric(18,0),
@BillId numeric(18,0),
@ClinetId numeric(18,0)
AS 
Begin

select A.[IdentityID],
	   A.[BillID],
	   A.[ApprovedAmount],
	   b.[VendorID],
	   b.[AccountID],
	   b.[DueDate],
	   b.[InvoiceNumber],
	   b.[PaymentTerms],
	   b.[Description],
	   b.[FileDisplayName],
	   b.[PhysicalLocation],
	   b.[FileName],
	   C.BillBreakageID,
	   C.BillType,
	   C.Description AS BreakageDescription,
	   C.Amount As BreakageAmount,
	   D.ApprovedComment,
	   E.Value1 As PaymentTermName,
	   F.Value1 AS BreakageTypeName,
	   G.VendorName
	   from Tbl_BillApproved As A
	   inner join Tbl_Bill as B
	   On A.BillID=B.BillID
	    left join  Tbl_BillBreakage AS C
		On A.BillID=C.BillID
		left join Tbl_ApprovedComments as D
		On A.IdentityID=D.[ApprovedBillID]
		left join KeyList AS E
		On B.PaymentTerms = E.KeyListID and KeyID =5003
		left join KeyList AS F
		on C.BillType =F.KeyListID and F.KeyID=5007
		left join Tbl_Vendor as G
		On B.VendorID = G.VendorID
	   where A.BillID=@BillId and A.IdentityID=@IdentityId and B.ClientID=@ClinetId
End

GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentBillInfo]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetPaymentBillInfo]                              
@billId NUMERIC(18,0),                              
@clientId NUMERIC(18,0)  ,            
@payBillId NUMERIC(18,0)            
AS                              
BEGIN                      
DECLARE @vendorId NUMERIC(18,0)                    
  IF EXISTS(SELECT BillId FROM Tbl_Bill WHERE BillID=@billId AND ClientID=@clientId)                              
  BEGIN                              
     --Bill Details                              
                                  
      SELECT A.[BillID]                              
            ,A.[VendorID]                              
            ,A.[AccountID]                              
            ,A.[BillDate]                              
            ,A.[Amount]                              
            ,A.[InvoiceNumber]                              
            ,A.[DueDate]                              
            ,A.[Category]                              
            ,A.[Notes]                              
            ,A.[PaymentTerms]                              
            ,A.[Description]                              
            ,A.[Status]                              
            ,A.[Balance]                              
            ,A.[ClientID]                              
            ,A.[FileDisplayName]                              
            ,A.[PhysicalLocation]                              
            ,A.[FileSize]                              
            ,A.[FileName]                              
            ,A.[UserComment]                              
            ,A.[PurchaseOrder]                              
            ,A.[IsChallenged]                              
            ,A.[IsRecurring]                              
            ,A.[RecurrenceReferenceId]                              
            ,A.[IsReminder]                              
            ,A.[ReminderEmail]                              
            ,A.[ReminderInterval]                              
            ,A.[ReminderIntervalDay]                          
            ,A.CreatedBy                        
            ,B.VendorName                              
            ,C.Value1 AS StatusName                              
            ,D.Value1 AS ReminderIntervalName                              
            ,E.Value1 AS PaymenttermName                              
            ,F.ApprovedAmount                              
            ,A.isAutoApproval ,                        
            F.UpdatedBy AS LastApprover ,                
            F.PaymentStatus  ,              
            F.[PaymentReferenceID],              
            F.[AmountPaid],              
            F.[AmountDue],              
            F.[PaymentMethod],              
            G.[Value1] AS PaymentMode,              
            F.[PaidOn]            
           ,F .UpdatedBy        
           ,(ISNULL(H.FirstName,'')+' '+ISNULL(H.LastName,'')) AS 'CreatedByName' ,      
           I.CustomerName,      
           J.ProjectName     
           ,K.CategoryName    
     ,L.Value1 AS 'StrTypeOfPayment'  
            FROM [Tbl_Bill] AS A                              
            LEFT JOIN Tbl_Vendor AS B                              
            ON A.VendorID =B.VendorID                              
            LEFT JOIN KeyList AS C                              
            ON A.Status=C.KeyListID                              
            LEFT JOIN KeyList AS D                              
            ON A.ReminderInterval=D.KeyListID AND D.KeyID=5015                              
            LEFT JOIN KeyList As E                              
            ON A.PaymentTerms =E.KeyListID AND E.KeyID=5003                              
            LEFT JOIN Tbl_BillApproved As F                              
            ON A.BillID=F.BillID AND F.IdentityId=@payBillId            
            LEFT JOIN Keylist AS G          
            ON F.PaymentMode=G.KeylistID AND G.Keyid=5021          
            LEFT JOIN  TBl_Accounts AS H          
            ON A.CreatedBy=H.AccountID         
            LEFT JOIN Tbl_Customers AS I      
            ON A.Customer = I.CustomerId      
            LEFT JOIN Tbl_Projects AS J      
            ON A.Project=J.ProjectID      
            LEFT JOIN Tbl_GlCodes AS K    
            ON A.BillCategory=K.IdentityID    
   LEFT JOIN KeyList AS L  
   ON F.[TypeOfPayment]=L.KeylistID AND L.KeyID=5020  
            WHERE A.BillID =@billId AND A.ClientID=@clientId                              
                              
     --Bill Descriptions                              
                                   
      SELECT * FROM [dbo].[Tbl_BillDescription] WHERE BillID=@billId                              
                              
     --split Amounts                              
                                    
      SELECT A.[BillBreakageID]                              
         ,A.[BillID]                 
         ,A.[Amount]                              
         ,A.[Description]                              
         ,A.[BillType]                              
         ,A.[Status]                  
, ISNULL( B.[GLNumber],'')+' - '+ISNULL(B.[GLDescription],'') AS 'BillTypeName'                    
 --,B.[GLDescription] AS BillTypeName 
 		,A.GLAccountID
   FROM [dbo].[Tbl_BillBreakage] AS A                              
        LEFT JOIN [dbo].[Tbl_GlCodes] AS B                              
     ON A.GLAccountID=B.[IdentityID]  AND B.ClientID=@clientID                     
         WHERE A.BillID=@billId                              
                              
     --Approvers --3                              
        SELECT        A.[BillStageApprovalID]             
         ,A.[BillID]                              
         ,A.[ApproverID]                              
         ,A.[Sequence]                              
         ,B.FirstName                              
         ,B.LastName                              
                        FROM [BillStageApproval] AS A                              
           LEFT JOIN Tbl_Accounts AS B                              
           ON A.ApproverID=B.AccountID                              
           WHERE A.BillID=@billId                              
                              
     --Recurrence Details --4                              
                    
      SELECT  A.[RecurrenceId]                              
       ,A.[StartDate]                              
       ,A.[EndDate]                              
       ,A.[Frequency]                              
       ,C.Value1 AS FrequencyName                     
       FROM [dbo].[Tbl_Recurrence] AS A                              
       INNER JOIN Tbl_Bill AS B                              
       ON A.RecurrenceId=B.[RecurrenceReferenceId]                              
       LEFT JOIN KeyList AS C                               
       ON A.Frequency=C.KeyListID AND C.KeyID=5016                              
      WHERE B.BillID=@billId                              
                              
     --Documents --5                              
                              
     SELECT  A.[AttatchmentId]                              
         ,A.[BillID]                              
         ,A.[FileName]                              
         ,A.[PhysicalFileName]                            
         ,A.[Size]                              
         ,A.[PhysicalPath]                              
         ,A.[Extension]                              
            ,A.[CreatedOn]                              
                             ,A.[CreatedBy]                              
        ,B.FirstName                              
     ,B.LastName                              
                           FROM [Tbl_BillAttachments] AS A                              
         INNER JOIN  Tbl_Accounts AS B                              
         ON A.CreatedBy=B.AccountID                   
         WHERE A.BillID=@billId                              
                              
         --Notes --6                              
           SELECT   A.[BillCommentID]                              
          ,A.[BillID]                              
          ,A.[Comment]                              
          ,A.[CreatedOn]                              
          ,A.[CommentBy]                              
          ,A.[CommentOn]                              
          ,B.FirstName                              
      ,B.LastName                              
                       FROM   [Tbl_BillComments] AS A                              
        LEFT JOIN Tbl_Accounts AS B                              
        ON A.CommentBy=B.AccountID                              
        WHERE A.BillID=@billId                              
                              
          --Approver History--7         
                              
       --    SELECT  A.[ApproveHistoryID]                              
       --,A.[BillID]                              
       --,A.[ApproverComment]                              
       --,A.[ApproverID]         ,A.[Status]                              
       --,A.[CreatedOn]                              
       --,B.FirstName                              
       --,B.LastName                              
       --,D.Balance                              
       --,D.Amount                              
       --,C.Value1 As StatusName                              
       --,E.ApprovedAmount                              
       --      FROM [Tbl_ApproveHistory] AS A                              
       --      LEFT JOIN Tbl_Accounts AS B                              
       --      ON A.ApproverID=B.AccountID                              
 --      LEFT JOIN KeyList As C                              
       --      ON A.Status=C.KeyListID AND C.KeyID=5014                              
       --      INNER JOIN Tbl_Bill AS D                              
       --      ON A.BillID=D.BillID                              
       --INNER JOIN Tbl_BillApproved AS E                              
       --ON A.BillID=E.BillID                              
       --      WHERE A.BillID=@billId                      
                          
         SELECT Distinct  A.[ApproveHistoryID]                              
       ,A.[ApproverComment]                              
       ,A.[ApproverID]                            
    ,A.[Status]                              
       ,A.[CreatedOn]                              
    ,B.FirstName                              
       ,B.LastName                              
       ,A.BalanceAmount AS Balance                              
       ,D.Amount                              
       ,C.Value1 As StatusName                              
       ,A.ApprovedAmount                              
       FROM [Tbl_ApproveHistory] AS A                              
       LEFT JOIN Tbl_Accounts AS B                              
       ON A.ApproverID=B.AccountID                              
       LEFT JOIN KeyList As C                              
       ON A.Status=C.KeyListID AND C.KeyID=5014                              
       INNER JOIN Tbl_Bill AS D                              
       ON A.BillID=D.BillID                              
       INNER JOIN Tbl_BillApproved AS E                              
       ON A.BillID=E.BillID                              
       WHERE A.BillID=@billId                         
                                      
        --RecentPayments --8                       
                      
  SET @vendorId=(SELECT Top(1) VendorID FROM Tbl_Bill Where BillID=@billId)                    
                              
        SELECT TOP(5) A. [IdentityID]                              
         ,A.[BillID]                              
         ,A.[ApprovedAmount]                              
         ,A.[PayableAmount]                              
  ,A.[PaymentStatus]                              
         ,A.[PaidOn]                              
         ,A.[VendorID]                       
   ,C.InvoiceNumber                    
FROM [Tbl_BillApproved] AS A                              
       Inner JOIN Tbl_Vendor AS B                              
       ON A.VendorID=B.VendorID                     
    Left Join Tbl_Bill AS C                    
    On A.BillId=C.BillId                    
       WHERE A.VendorID=@vendorId AND A.[PaymentStatus]=50044                    
    ORDER BY A.PaidOn DESC                    
                    
    --SELECt * From Tbl_Vendor                    
                        
          Select * from [dbo].[Tbl_BillPaidAttachments] Where BillID=@billId       
      
    SELECT KeyListID,Value1 FROM Keylist Where Keyid=5020  
                      
                    
        END                              
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentMethodListScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_GetPaymentMethodListScreenData]      
@clientID Numeric(18,0)      
AS      
BEGIN      
  SELECT  ( 'TabCounts')  AS  [TableName],      
  (SELECT Count(CardIdentityId) FROM [dbo].[Tbl_ClientCards] WHERE CustomerID=@clientID )  AS 'cardCount',      
  (SELECT Count(AccountIdentityID) FROM [dbo].[Tbl_ClientBankAccount] WHERE CustomerID=@clientID) AS 'achCount'      
      
   SELECT 'cardData' As TableName,      
   [CardIdentityId]      
      ,[CardName]      
      ,[CardNumber]      
      ,[ExpiryMonth]      
      ,[ExpiryYear]      
      ,[CCV]      
      ,[IsDefault]      
      ,[ReferenceID]      
      ,[CustomerID]      
      ,[Status]      
      ,[BankName]      
   ,IsActive    
      FROM[dbo].[Tbl_ClientCards] WHERE CustomerID=@clientID      
      
   SELECT  'achData' As TableName,  A. [AccountIdentityID]      
      , A.[AccountNumber]      
      , A.[RoutingNumber]      
      , A.[ReferenceID]      
      , A.[AccountName]      
      , A.[CustomerID]  
	  ,A.ACHCustomer
   , A.[Status] 
   ,A.IsDefault
   ,B.Value1 As StatusName  
   ,B.Value2 AS StatusColor  
  FROM [Tbl_ClientBankAccount]  AS A  
  LEFT JOIN KeyList AS B  
  ON A.[Status]=B.KeyListID AND B.KeyID=5017  
  WHERE CustomerID=@clientID      
        
END      
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetPaymentScreenData]          
@clientID NUMERIC(18,0),          
@billID NUMERIC(18,0)          
AS          
BEGIN          
DECLARE @vendorID NUMERIC(18,0)        
 SELECT           
  'PrefferedPayments' AS TableName,          
  'Card' AS [Source],          
  CardIdentityId AS 'ID',          
  CardName AS 'Name',          
  CardNumber AS 'Number' ,        
  ReferenceID AS 'ReferenceID'        
          
  FROM Tbl_ClientCards          
  WHERE IsDefault=1 AND CustomerID=@clientID          
          
  UNION          
          
  SELECT           
   'PrefferedPayments' AS TableName,          
   'ACH' AS [Source],          
   AccountIdentityID AS 'ID',          
   AccountName AS 'Name',          
   AccountNumber AS 'Number',        
   ReferenceID AS 'ReferenceID'        
   FROM Tbl_ClientBankAccount          
   WHERE IsDefault=1  AND CustomerID=@clientID AND Status=50057          
          
          
    SELECT 'Cards' AS TableName,          
    CardIdentityId,          
    CardName ,          
    CardNumber,        
    ReferenceID AS 'ReferenceID'  ,        
    ExpiryMonth,        
    ExpiryYear,        
    CCV        
    FROM Tbl_ClientCards          
    WHERE CustomerID=@clientID          
          
   SELECT 'ACH' AS TableName,          
   AccountIdentityID ,          
   AccountName ,          
   AccountNumber ,        
  [ACHCustomer],        
  [ReferenceID],        
  ReferenceID AS 'ReferenceID'          
   FROM Tbl_ClientBankAccount          
   WHERE  CustomerID=@clientID AND Status=50057          
          
         
   SELECT 'BillDetails' AS TableName,          
   A.ApprovedAmount As Amount,          
   B.BillDate,          
   A.DueON,          
  B.[Description],          
  B. [FileName],          
   B.InvoiceNumber         
   ,A.BillID 
   ,A.IdentityId
  FROM Tbl_BillApproved AS A       
  LEFT JOIN Tbl_Bill AS B      
  ON A.BillID=B.BillID      
  WHERE A.IdentityID=@billID AND B.ClientID=@clientID       
        
  SET @vendorID=(SELECT VendorID From Tbl_BillApproved Where IdentityId=@billID)        
        
  SELECT 'VendorBankDetails' AS TableName,        
       [IdentityID]        
      ,[VendorID]        
      ,[AccountHolderName]        
      ,[AccountNumber]        
      ,[RoutingNumber]        
   FROM Tbl_VendorBankAccount WHERE VendorID =@vendorID        
          
          
       SELECT 'VendorDetails' As TableName,        
       [VendorID]        
      ,[VendorName]        
      ,[ClientID]        
      ,[IsActive]        
      ,[FirstName]        
      ,[LastName]        
      ,[Email]        
      ,[City]        
      ,[Country]        
      ,[Address1]        
      ,[Address2]        
      ,[PostalCode]        
      ,[State]        
      ,[DOB]        
      ,[SSNNumber]        
      ,[Phone]        
      ,[WebsiteURL]      
   ,[VendorLogo]    
   ,[Address1]    
   ,ReferenceID  
   ,[DwollaCustomerID]  
   ,[DwollaFundID]  
   FROM Tbl_Vendor WHERE VendorID=@vendorID        
            
          
          
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentScreenDataV2]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_GetPaymentScreenDataV2]  
@clientID NUMERIC(18,0),  
@billID NUMERIC(18,0)  
AS  
BEGIN  
DECLARE @vendorID NUMERIC(18,0)
  
  
   SELECT 'BillDetails' AS TableName,  
   Amount,  
   BillDate,  
   DueDate,  
   [Description],  
   [FileName],  
   InvoiceNumber 
   ,BillID
  FROM Tbl_Bill WHERE BillID=@billID AND ClientID=@clientID  

  SET @vendorID=(SELECT VendorID From Tbl_Bill Where BillID=@billID)
  
  
       SELECT 'VendorDetails' As TableName,
       [VendorID]
      ,[VendorName]
      ,[ClientID]
      ,[IsActive]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[City]
      ,[Country]
      ,[Address1]
      ,[Address2]
      ,[PostalCode]
      ,[State]
      ,[DOB]
      ,[SSNNumber]
      ,[Phone]
      ,[WebsiteURL]
	  ,ReferenceID
	  FROM Tbl_Vendor WHERE VendorID=@vendorID
    
  
  select 'Paypal' as TableName, [IdentityID] from [dbo].[CustomePaypalSettings]
  where [CustomerID] = @clientID
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPayMentStatusFilterlst]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetPayMentStatusFilterlst]
	@clientID nvarchar(max)
AS
BEGIN
	SELECT VendorName AS Value1,VendorID AS KeyListID FROM TBL_VENDOR
	WHERE ClientID=@clientid

	SELECT FirstName AS Value1,AccountID AS KeyListID FROM Tbl_Accounts
	WHERE ClientID=@clientid AND FirstName IS NOT NULL

	SELECT KeyListID,Value1  FROM  KEYLIST 
	WHERE KeyID=5021

	SELECT KeyListID,Value1 FROM  KEYLIST 
	WHERE KeyID=5008 AND KeyListID IN(50091,50092,50026,50024,50023,50088)
	ORDER BY Value1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentStatusReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================50026
--SP_GetPaymentStatusReport 0,10,'TransactionId asc',2000,'0','','','0','','0','50044'
CREATE PROCEDURE [dbo].[SP_GetPaymentStatusReport]
	@start INT,@skip INT,@orderby NVARCHAR(max)='BillID',@clientID NUMERIC(18,0)=2000,
	@vendor nvarchar(max),@billno nvarchar(max),@Transactionid nvarchar(max),@paidby nvarchar(max),
	@mode nvarchar(max),@status nvarchar(max),@dueFrom nvarchar(max),
	@dueTo nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @vendor !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
END 

IF @billno !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND BillNo IN ('''+@billno+''')'               
END 

IF @Transactionid !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND TransactionId IN ('''+@Transactionid+''')'               
END

IF @paidby !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND AccountID IN ('+@paidby+')'               
END

IF @mode !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND PaymentModeID IN ('+@mode+')'               
END

IF @status !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus IN ('+@status+')'               
END

IF @dueFrom !='' AND @dueTo !=''                        
BEGIN                            
SET @dynamicwhere = @dynamicwhere + ' AND PaidOn  > '''+Convert(varchar(50),Convert(date,@dueFrom,101),101)+''' AND PaidOn <'''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
END  

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''VendorList'' AS TableName, [BillID],[VendorName],[BillNo]        
,[TotalBillableAmount],[TotalPaid],Balance,[TransactionId],[Fee],[PaidBy],[PaidOn],[PaymentMode],[Status],VendorID    
 ,AccountID,PaymentModeID,PaymentStatus,DueOn
 FROM [View_PaymentStatusReport] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT BillID) AS Count FROM [View_PaymentStatusReport]'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentSummaryBillData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetPaymentSummaryBillData]            
@currentweekstartDate NVARCHAR(MAX),            
@currentweekendDate NVARCHAR(MAX),            
@lastweekstartDate NVARCHAR(MAX),            
@lasttweekendDate NVARCHAR(MAX),            
@currentDay NVARCHAR(MAX),            
@clientID NUMERIC(18,0)   ,      
@kpiStatus NUMERIC(18,0),       
@fromDate NVARCHAR(MAX),      
@toDate NVARCHAR(MAX),      
@overDueDate NVARCHAR(MAX)      
AS            
BEGIN           
DECLARE @dynamicwhere NVARCHAR(max)=''        
DECLARE @dynamicSql NVARCHAR(max)=''      
        
IF @kpiStatus !=0 AND @kpiStatus!=1        
BEGIN        
SET @dynamicwhere = ' AND A.[PaymentStatus] = '+CAST(@kpiStatus AS VARCHAR(MAX))+' '      
END      
      
IF @fromDate !='' AND @toDate !=''      
BEGIN      
SET @dynamicwhere = @dynamicwhere + ' AND A.DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@fromDate,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@toDate,101),101)+''''        
END      
IF @overDueDate !=''      
BEGIN      
SET @dynamicwhere = @dynamicwhere +' AND A.[DueOn] < '''+Convert(varchar(50),Convert(date,@overDueDate,101),101)+''''      
END      
      
IF @kpiStatus =1        
BEGIN        
SET @dynamicwhere = ' AND A.[PaymentStatus] = '+CAST(50023 AS VARCHAR(MAX))+' '      
END     
      
 SELECT             
  --outstanding payments            
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015 and ClientId=@clientID) AS 'OutStandingCount',            
                     
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND             
       ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))             
       AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID ) AS 'CurrentWeekOutStandingBillsClount',            
            
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND            
      (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))             
      AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID ) AS 'LastWeekOutStandingBillsCount',             
                 
      ( SELECT SUM(ApprovedAmount) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 and ClientId=@clientID ) AS 'TotalOutStandingAmount',            
            
      --Over Due Submission Bills            
   (   Select SUM(ApprovedAmount)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015 and convert(date, @currentDay )> convert(date, DueOn) and ClientId=@clientID) as 'OverDueAmount',            
                
     (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND             
     convert(date, CreatedOn) =Convert(date, getutcdate()) and ClientId=@clientID ) AS 'CWeekOverDueCount',            
            
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND             
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) and ClientId=@clientID)  AS 'LWeekOverDueCount',            
               
   (   Select Count(BillID)  FROM Tbl_BillApproved where PaymentStatus=50023  and Status=50015 and convert(date, @currentDay )> convert(date, DueOn) and ClientId=@clientID) as 'OverDueCount',            
            
            
   --   --flagged payments            
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50025 and ClientId=@clientID) AS 'FlaggedCount',            
                     
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50025 and            
       ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))             
       AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID) AS 'CurrentFlaggedBillsClount',            
            
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50025 and            
      (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))             
      AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID) AS 'LastWeekFlaggedBillsCount',             
                 
   (SELECT Sum(ApprovedAmount)    FROM Tbl_BillApproved where  PaymentStatus=50025 and ClientId=@clientID) AS 'FlaggedAmount',            
            
--   --Due this week payments            
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and  Status=50015 AND             
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))             
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID) AS 'DuethisWeekCount',            
                     
   (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and  Status=50015 AND             
     convert(date, CreatedOn) =Convert(date, getutcdate()) and ClientId=@clientID) AS 'CWeekDueThisWeekCount',            
            
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE   PaymentStatus=50023  and  Status=50015 AND             
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekDueThisWeekCount',            
              (SELECT SUM(ApprovedAmount)  FROM Tbl_BillApproved where   PaymentStatus=50023  and  Status=50015 AND             
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))             
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID) AS 'DuethisWeekAmount'            
             
 --select 'ApprovedBillList' As TableName,            
 --          A.[IdentityID],            
 --          A.[BillID],            
 --          A.[ApprovedAmount],            
 --          A.[Status],            
 --          A.[PayableAmount],            
 --          A.[DueOn],            
 --          A.[PaidOn],            
 --          A.[VendorID],            
 --          A.[PaymentStatus],            
 --          B.Description,            
 --          B.PurchaseOrder,            
 --          B.InvoiceNumber,            
 --         B.[InvoiceNumber] AS KeyListID          
 --          ,B.[InvoiceNumber] AS Value1          
 --        ,  B.IsRecurring,            
 --          C.VendorName,            
 --          D.Value1 AS PaymentStatusName            
 --         from Tbl_BillApproved as A            
 --         left join Tbl_Bill As B            
 --         On A.BillID=B.BillID            
 --         left join Tbl_Vendor As C            
 --         On A.VendorID=C.VendorID            
 --         left join KeyList AS D            
 --         On A.PaymentStatus=D.KeyListID             
 --         where  B.ClientID=@clientId     AND A.PaymentStatus Like '%'+@dynamicwhere+'%'       
       
       
           SET @dynamicSql='      
           select ''ApprovedBillList'' As TableName,            
                      A.[IdentityID],            
                      A.[BillID],            
                      A.[ApprovedAmount],            
                      A.[Status],            
                      A.[PayableAmount],            
                      B.[DueDate] AS ''DueOn'',            
                      A.[PaidOn],            
                      A.[VendorID],            
                      A.[PaymentStatus],            
                      B.Description,            
                      B.PurchaseOrder,            
                      B.InvoiceNumber,            
                     B.[InvoiceNumber] AS KeyListID          
                      ,B.[InvoiceNumber] AS Value1          
                    ,  B.IsRecurring,            
                      C.VendorName,            
                      D.Value1 AS PaymentStatusName            
                     from Tbl_BillApproved as A            
                     left join Tbl_Bill As B            
                     On A.BillID=B.BillID            
                     left join Tbl_Vendor As C            
                     On A.VendorID=C.VendorID            
                     left join KeyList AS D            
                     On A.PaymentStatus=D.KeyListID             
                     where B.ClientID='+CAST(@clientID AS VARCHAR(MAX))+' '+@dynamicwhere+''      
           EXEC (@dynamicSql)      
                         
 SELECT VendorID AS KeyListID,VendorName AS Value1 FROM Tbl_Vendor Where ClientID=@clientID            
            
 SELECT KeyID,KeyListID,Value1 FROM Keylist Where Keyid=5008
 
 SELECT KeyID,KeyListID,Value1 FROM Keylist Where Keyid=5020
        
        
         
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentSummaryBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetPaymentSummaryBillList]
@clientId numeric(18,0)
As
Begin
			select 'ApprovedBillList' As TableName,
										 A.[IdentityID],
										 A.[BillID],
										 A.[ApprovedAmount],
										 A.[Status],
										 A.[PayableAmount],
										 A.[DueOn],
										 A.[PaidOn],
										 A.[VendorID],
										 A.[PaymentStatus],
										 B.Description,
										 B.PurchaseOrder,
										 B.InvoiceNumber,
										 C.VendorName,
										 D.Value1 AS PaymentStatusName
										from Tbl_BillApproved as A
										left join Tbl_Bill As B
									
										On A.BillID=B.BillID
										left join Tbl_Vendor As C
										On A.VendorID=C.VendorID
										left join KeyList AS D
										On A.PaymentStatus=D.KeyListID 
										where  A.Status=50015 and B.ClientID=@clientId
End

GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentSummaryHomeScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec SP_GetPaymentSummaryHomeScreenData '04/05/2021','05/01/2021','04/18/2021','04/24/2021','04/26/2021','05/01/2021',1,2000,'04/26/2021',0    
    
CREATE PROCEDURE [dbo].[SP_GetPaymentSummaryHomeScreenData]                  
@currentweekstartDate NVARCHAR(MAX),                  
@currentweekendDate NVARCHAR(MAX),                  
@lastweekstartDate NVARCHAR(MAX),                  
@lasttweekendDate NVARCHAR(MAX),                  
@startDate NVARCHAR(MAX),                  
@endDate NVARCHAR(MAX),                  
@isOverDue NUMERIC(18,0),                  
@clientID NUMERIC(18,0),                  
@currentDay NVARCHAR(MAX)   ,        
@status Numeric(18,0)      ,  
@isOnload NUMERIC(18,0)  
AS                   
BEGIN                  
DECLARE @dynamicwhere NVARCHAR(max)=''            
IF @status !=0          
BEGIN           
SET @dynamicwhere =@status          
END               
IF(@isOverDue=0)                  
 BEGIN                  
      SELECT                   
  --outstanding payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015 and ClientId=@clientID                  
     AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'OutStandingCount',                  
                           
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID ) AS 'CurrentWeekOutStandingBillsClount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND                  
      (Convert(DATE,DueOn) >= CONVERT(DATE,@lastweekstartDate))                   
      AND Convert(date,DueOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID ) AS 'LastWeekOutStandingBillsCount',                   
                       
      ( SELECT SUM(ApprovedAmount) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 and ClientId=@clientID                  
      AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'TotalOutStandingAmount',                  
                  
      --Over Due Submission Bills                  
   (   Select SUM(ApprovedAmount)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015                   
   and convert(date, @currentDay )> convert(date, DueOn) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) as 'OverDueAmount',            
            
   (Select  COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015                   
   and convert(date, @currentDay )> convert(date, DueOn) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) as 'CWeekOverDueCount',            
                      
     --(SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND                   
     --convert(date, CreatedOn) =Convert(date, getutcdate()) and ClientId=@clientID ) AS 'CWeekOverDueCount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND                   
      convert(date, DueOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) and ClientId=@clientID)  AS 'LWeekOverDueCount',                  
                     
   (   Select Count(BillID)  FROM Tbl_BillApproved where PaymentStatus=50023  and Status=50015                   
   and convert(date, @currentDay )> convert(date, DueOn ) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))     
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) as 'OverDueCount',                  
                  
     --   --Due this week payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and  Status=50015 AND                   
      ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'DuethisWeekCount',            
              
  (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and  Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'CWeekDueThisWeekCount',            
                           
   --(SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and  Status=50015 AND                   
   --  convert(date, CreatedOn) =Convert(date, getutcdate()) and ClientId=@clientID) AS 'CWeekDueThisWeekCount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE   PaymentStatus=50023  and  Status=50015 AND                   
      convert(date, DueOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekDueThisWeekCount',                  
                       
   (SELECT SUM(ApprovedAmount)  FROM Tbl_BillApproved where   PaymentStatus=50023  and  Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'DuethisWeekAmount',                  
                  
   --   --Disputed payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and ClientId=@clientID  AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'disputedCount',                  
                           
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and                  
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID) AS 'CurrentDisputedBillsClount',                  
                  
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and                  
      (Convert(DATE,DueOn) >= CONVERT(DATE,@lastweekstartDate))                   
      AND Convert(date,DueOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID) AS 'LastWeekDisputedBillsCount',                   
                       
   (SELECT Sum(ApprovedAmount)    FROM Tbl_BillApproved where  PaymentStatus=50033 and ClientId=@clientID  AND                   
     ( Convert(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
     AND Convert(date,DueOn)<= CONVERT(DATE,@endDate)) AS 'DisputedAmount'             
          
      select 'ApprovedBillList' As TableName,                  
           A.[IdentityID],                  
           A.[BillID],                  
            B.[DueDate] AS 'DueOn',                  
            A.ApprovedAmount                  
            ,B.Description               
            ,B.InvoiceNumber              
          from Tbl_BillApproved as A                  
          left join Tbl_Bill As B                  
          On A.BillID=B.BillID                  
          left join Tbl_Vendor As C                  
          On A.VendorID=C.VendorID                  
          left join KeyList AS D                  
          On A.PaymentStatus=D.KeyListID                   
          where  A.Status=50015 and A.PaymentStatus=50023                     
          AND  ((Convert(DATE,A.DueOn) >= CONVERT(DATE,@startDate))                   
          AND Convert(date,A.DueOn)<= CONVERT(DATE,@endDate)) AND B.ClientID=@clientId AND A.PaymentStatus Like '%'+@dynamicwhere+'%'         
      
     IF(@isOnload=0)  
  BEGIN  
          SELECT YEAR(DueOn) AS 'Year',MONTH(DueOn) AS 'Month',DATEPART(week, DueOn) AS 'Week',SUM(ApprovedAmount) AS 'Amount',PaymentStatus AS 'Status',                
            0 AS 'IsOverDue'                
           FROM Tbl_BillApproved                  
           WHERE  PaymentStatus  = 50023 AND ClientID= @clientId AND                
            (CONVERT(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
           AND CONVERT(date,DueOn)<= CONVERT(DATE,@endDate)  AND PaymentStatus Like '%'+@dynamicwhere+'%'                            
           GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus ,DATEPART(week, DueOn)                     
                        
            SELECT YEAR(DueOn) AS 'Year',MONTH(DueOn) AS 'Month',DATEPART(week, DueOn) AS 'Week',SUM(ApprovedAmount) AS 'Amount',PaymentStatus AS 'Status',                  
           1 AS 'IsOverDue'                
           FROM Tbl_BillApproved                  
           WHERE  PaymentStatus  = 50023 AND  ClientID= @clientId                 
           AND                
            (CONVERT(DATE,DueOn) >= CONVERT(DATE,@startDate))                   
           AND CONVERT(date,DueOn)<= CONVERT(DATE,@endDate)   
     AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE()) AND PaymentStatus Like '%'+@dynamicwhere+'%'                             
           GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus   ,DATEPART(week, DueOn)  
  END  
  ELSE  
  BEGIN  
      SELECT YEAR(DueOn) AS 'Year',MONTH(DueOn) AS 'Month',DATEPART(week, DueOn) AS 'Week',SUM(ApprovedAmount) AS 'Amount',PaymentStatus AS 'Status',                
         0 AS 'IsOverDue'                
        FROM Tbl_BillApproved                  
        WHERE  PaymentStatus  = 50023 AND ClientID= @clientId AND                
         (CONVERT(DATE,DueOn) >= CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)))                   
        AND CONVERT(date,DueOn)<= CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1))  
  AND PaymentStatus Like '%'+@dynamicwhere+'%'                            
        GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus       ,DATEPART(week, DueOn)             
                     
         SELECT YEAR(DueOn) AS 'Year',MONTH(DueOn) AS 'Month',DATEPART(week, DueOn) AS 'Week',SUM(ApprovedAmount) AS 'Amount',PaymentStatus AS 'Status',                  
        1 AS 'IsOverDue'                
        FROM Tbl_BillApproved                  
        WHERE  PaymentStatus  = 50023 AND  ClientID= @clientId                 
        AND                
         (CONVERT(DATE,DueOn) >= CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)))  
        AND CONVERT(date,DueOn)<= CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1))   
  AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE()) AND PaymentStatus Like '%'+@dynamicwhere+'%'                             
        GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus  ,DATEPART(week, DueOn)   
  END  
                            
                     
                
                  
 END                  
 ELSE                  
 BEGIN                  
   SELECT                   
  --outstanding payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015 and ClientId=@clientID                  
     AND                   
    Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'OutStandingCount',                  
                           
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID ) AS 'CurrentWeekOutStandingBillsClount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023 and Status=50015 AND                  
      (Convert(DATE,DueOn) >= CONVERT(DATE,@lastweekstartDate))                   
      AND Convert(date,DueOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID ) AS 'LastWeekOutStandingBillsCount',                   
                       
      ( SELECT SUM(ApprovedAmount) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 and ClientId=@clientID                  
     AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'TotalOutStandingAmount',                  
                  
      --Over Due                  
   (   Select SUM(ApprovedAmount)  FROM Tbl_BillApproved where  PaymentStatus=50023  and Status=50015                   
   and ClientId=@clientID                    
    AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) as 'OverDueAmount',                  
                      
     (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND                   
     convert(date, DueOn) =Convert(date, getutcdate()) and ClientId=@clientID ) AS 'CWeekOverDueCount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and Status=50015 AND                   
      convert(date, DueOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) and ClientId=@clientID)  AS 'LWeekOverDueCount',                  
                     
   (   Select Count(BillID)  FROM Tbl_BillApproved where PaymentStatus=50023  and Status=50015            
   and convert(date, @currentDay )> convert(date, DueOn ) and ClientId=@clientID  AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) as 'OverDueCount',                  
                  
     --   --Due this week payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50023  and  Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID AND                   
    Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'DuethisWeekCount',                  
                           
   (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE  PaymentStatus=50023  and  Status=50015 AND                   
     convert(date, DueOn) =Convert(date, getutcdate()) and ClientId=@clientID) AS 'CWeekDueThisWeekCount',                  
                  
      (SELECT COUNT(BillID) FROM Tbl_BillApproved WHERE   PaymentStatus=50023  and  Status=50015 AND     
    ( Convert(DATE,DueOn) >= CONVERT(DATE,@lastweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@lasttweekendDate)and ClientId=@clientID AND                   
     Convert(Date,DueOn)< CONVERT(date,GETUTCDATE()))  AS 'LWeekDueThisWeekCount',                  
                       
   (SELECT SUM(ApprovedAmount)  FROM Tbl_BillApproved where   PaymentStatus=50023  and  Status=50015 AND                   
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID AND                   
     Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'DuethisWeekAmount',                  
                  
   --   --Disputed payments                  
    (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and ClientId=@clientID  AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'disputedCount',                  
                           
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and                  
       ( Convert(DATE,DueOn) >= CONVERT(DATE,@currentweekstartDate))                   
       AND Convert(date,DueOn)<= CONVERT(DATE,@currentweekendDate) and ClientId=@clientID) AS 'CurrentDisputedBillsClount',                  
                  
      (SELECT COUNT(BillID)  FROM Tbl_BillApproved where  PaymentStatus=50033 and                  
      (Convert(DATE,DueOn) >= CONVERT(DATE,@lastweekstartDate))                   
      AND Convert(date,DueOn)<= CONVERT(DATE,@lasttweekendDate) and ClientId=@clientID) AS 'LastWeekDisputedBillsCount',                   
                       
   (SELECT Sum(ApprovedAmount)    FROM Tbl_BillApproved where  PaymentStatus=50033 and ClientId=@clientID  AND Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())) AS 'DisputedAmount'                   
                    
      
        
Set @dynamicwhere=''    
    
IF @status !=0          
BEGIN        
SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatus = '+CAST(@status AS VARCHAR(MAX))+'  '                
END      
    
IF @startDate !='' AND @endDate !=''                          
BEGIN                              
SET @dynamicwhere = @dynamicwhere + ' AND DueOn  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),101)+''''                              
END        
DECLARE                    
@dynamicSql NVARCHAR(max) ='    
    
  select ''ApprovedBillList'' As TableName,                  
           A.[IdentityID],                  
           A.[BillID],                  
           B.[DueDate] AS ''DueOn'',                  
           B.Description,                  
          A.[ApprovedAmount]                
         ,B.InvoiceNumber              
          from Tbl_BillApproved as A                  
          left join Tbl_Bill As B                  
          On A.BillID=B.BillID                  
          left join Tbl_Vendor As C                  
          On A.VendorID=C.VendorID            
          left join KeyList AS D                  
          On A.PaymentStatus=D.KeyListID                   
          where  A.Status=50015 and A.PaymentStatus=50023                     
          AND Convert(Date,A.DueOn)< CONVERT(date,GETUTCDATE()) AND B.ClientID='+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + ''       
        
PRINT ( @dynamicsql )                
                
EXEC(@dynamicsql)      
                  
    
    DECLARE @OutstandingGrapSql  NVARCHAR(max)='    
    
      SELECT YEAR(DueOn) AS ''Year'',MONTH(DueOn) AS ''Month'',DATEPART(week, DueOn) AS ''Week'',SUM(ApprovedAmount) AS ''Amount'',PaymentStatus AS ''Status'',                
      0 AS ''IsOverDue''                
     FROM Tbl_BillApproved                  
     WHERE  PaymentStatus  = 50023 AND             
     Convert(Date,DueOn)< CONVERT(date,GETUTCDATE())  AND   ClientID ='+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + '                          
     GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus   ,DATEPART(week, DueOn)    '    
PRINT ( @OutstandingGrapSql )                
                
EXEC(@OutstandingGrapSql)      
    
    
     DECLARE @OverDueGrapSql  NVARCHAR(max) ='             
      SELECT YEAR(DueOn) AS ''Year'',MONTH(DueOn) AS ''Month'',DATEPART(week, DueOn) AS ''Week'',SUM(ApprovedAmount) AS ''Amount'',PaymentStatus AS ''Status'' ,                
     1 AS ''IsOverDue''                
     FROM Tbl_BillApproved                  
     WHERE  PaymentStatus  = 50023 AND                    
     Convert(Date,DueOn)< CONVERT(date,GETUTCDATE()) AND ClientID ='+ CAST(@clientID AS VARCHAR(MAX)) +' ' +  @dynamicwhere + '                        
     GROUP BY YEAR(DueOn),MONTH(DueOn),PaymentStatus  ,DATEPART(week, DueOn)'          
      
  PRINT ( @OverDueGrapSql )                
                
EXEC(@OverDueGrapSql)      
 END                  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPaymentSummaryMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetPaymentSummaryMasterData]
@ClientId numeric(18,0)
As 
Begin

			select A.[IdentityID],
					A.[BillID],
					A.[VendorID] ,
					B.InvoiceNumber,
					C.VendorName
					from Tbl_BillApproved AS A
					left join Tbl_Bill as B
					on
					A.BillID=B.BillID
					left join Tbl_Vendor as C
					on A.VendorID =C.VendorID
					where A.Status=50015 and B.ClientID=@ClientId



			select * from KeyList where KeyID=5008

End
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetProductList]
	@clientID numeric(18,0),@productid numeric(18,0)
AS
BEGIN
	SELECT 'Product' AS TableName, UnitPrice as price FROM TBL_product
	WHERE ProductID=@productid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetProjectDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GetProjectDetails]
@clientID NUMERIC(18,0),
@projectID NUMERIC(18,0)
AS
BEGIN
			SELECT 'EditDetails' AS TableName ,ProjectID,ProjectName,ProjectType,ProjectStatus,ProjectDescription,Customer
			from Tbl_Projects 
			Where ProjectID=@projectID AND ClientID=@clientID
ENd
GO
/****** Object:  StoredProcedure [dbo].[SP_GetProjectListMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetProjectListMasterData]
@clientID NUMERIC(18,0)
AS
BEGIN
			SELECT 'ProjectTypes' As TableName,KeyListID,KeyID,Value1 FROM KeyList WHERE Keyid=5024
			SELECT 'ProjectStatus' As TableName,KeyListID,KeyID,Value1 FROM KeyList WHERE Keyid=5025
			SELECT 'Projects' As TableName,ProjectID AS 'KeyListID',ProjectName AS 'Value1' FROM Tbl_Projects WHERE ClientId=@clientID
			SELECT 'Customers' As TableName,CustomerID AS 'KeyListID',CustomerName AS 'Value1' FROM Tbl_Customers WHERE ClientID=@clientID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRecurringList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRecurringList] 
	
AS
BEGIN
	SELECT InvoiceId
,InvoiceName
,Billtoaddressid
,Customerid
,Customeridtype
,Datedelivered
,[Description]
,Discountamount
,Transactioncurrencyid
,Exchangerate
,Discountamountbase
,Discountpercentage
,Duedate
,Freightamount
,Freightamountbase
,Invoicenumber
,Ispricelocked
,Lastbackofficesubmit
,Opportunityid
,Paymenttermscode
,PaymenttermscodeDisplay
,Pricelevelid
,Pricingerrorcode
,Prioritycode
,Salesorderid
,Shippingmethodcode
,Shiptoaddressid
,Statecode
,Statuscode
,Totalamount
,Totalamountbase
,Totalamountlessfreight
,Totalamountlessfreightbase
,Totaldiscountamount
,Totaldiscountamountbase
,Totallineitemamount
,Totallineitemamountbase
,Totallineitemdiscountamount
,Totallineitemdiscountamountbase
,Totaltax
,Totaltaxbase
,Willcall
,Invoicedate
,TermCode
,BillStatus
,Ismarkaspaid
,CreatedBy
,CreatedOn
,ClientId
,PaidOn
,Paymentterms
,Referanceorder
,Paymenttype
,Subtotal
,Discount
,ShippingCharge
,Tax
,TotamAmount
,DiscountType
,UpdatedBy
,Updatedon
,IsRecurring
,RecurringStartDate
,RecurrinEendtDate
,Frequency
,RecurringLastdate
FROM tbl_Invoice where IsRecurring=1

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRecurringmasterlist]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRecurringmasterlist]
	@CliendId numeric(18,0)
AS
BEGIN
	SELECT 'Recurring' AS TableName,C.CustomerName,I.RecurringStartDate,I.RecurrinEendtDate,
	I.Frequency,'' LastInvoicedate,'' NextInvoicedate,I.InvoiceId,I.RecurringLastdate
	FROM tbl_invoice I
	JOIN Tbl_customers C on C.CustomerID=I.Customerid
	WHERE I.IsRecurring=1 AND I.ClientId=@CliendId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoleAssignedUserCount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRoleAssignedUserCount]
@roleId NUMERIC(18,0)
AS
BEGIN
	SELECT COUNT(AccountID) AS 'AssignedUserCount' FROM Tbl_Accounts WHERE ApplicationRole=@roleId AND IsActive=50042
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoleCreationScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRoleCreationScreenData]    
@userRoleID NUMERIC(18,0)    
,@clientID NUMERIC(18,0)  
AS    
BEGIN    
 --   DECLARE @isCreate  NUMERIC(18,0)    
 --SET @isCreate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleID AND EntityActionID in ('3009','3010'))    
 --IF(@isCreate IS NOT NULL)    
 --BEGIN    
        SELECT * FROM KeyList WHERE KeyID=5012    
  SELECT A.[EntityID]    
        ,A.[EntityName]    
        ,A.[CreatedBy]    
        ,A.[CreatedOn]    
        ,A.[UpdatedBy]    
        ,A.[UpdatedOn]    
     ,B.EntityActionID    
     ,B.ActionName    
    FROM [dbo].[Entity] As A    
    LEFT JOIN [dbo].[EntityAction] AS B    
    ON A.EntityID=B.EntityID    
    
    Select   
  A.MasterRoleID,A.MasterRoleName  
  FROM MasterRole As A  
  WHERE A.MasterRoleID !=1005 AND A.MasterRoleID NOT IN (SELECT MasterRoleID FROM ApplicationRole WHERE ClientID=@clientID)  
--END    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoleEditDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRoleEditDetails]
@userRoleID NUMERIC(18,0),
@editRoleID NUMERIC(18,0)
AS
BEGIN
DECLARE @isUpdate  NUMERIC(18,0)
	SET @isUpdate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleID AND EntityActionID=3010)
	IF(@isUpdate IS NOT NULL)
	BEGIN
	SELECT * FROM ApplicationRole WHERE RoleID=@editRoleID
	SELECT * FROM ApplicationRoleEntity WHERE RoleID=@editRoleID
	SELECT * FROM [dbo].[MasterRole]
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRolePermission]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRolePermission]      
@roleId NUMERIC(18,0) ,    
@clientID NUMERIC(18,0)    
AS      
BEGIN      
  SELECT      
    A.[ApplicationRoleEntityID]      
      ,A.[EntityActionID]      
      ,A.[RoleID]      
   ,B.EntityID      
   ,B.ActionName      
   ,C.EntityName FROM   ApplicationRoleEntity AS A      
   LEFT JOIN EntityAction AS B      
   ON A.EntityActionID=B.EntityActionID      
   LEFT JOIN Entity AS C      
   ON B.EntityID = C.EntityID      
   WHERE A.RoleID=@roleId      
      
  SELECT [IsChangesAllowed],[IsSplitAllowed],[IsRecurrenceEnabled],[IsBillAssociationEnabled],  
  [IsBillExportEnabled],[IsEpaymentsEnabled],[IsOfflinePaymentsAllowed],[IsImportVendorsAllowed]  
  ,[IsAutoApproval],[IsMultiApproval],[IsDefaultApproval],[IsStandardApproval],[IsCustomApproval]  ,IsPartialApprovalEnabled
  FROM [dbo].[Tbl_Configurations]    
  WHERE ClientID=@clientID    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoleSreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetRoleSreenData]    
@roleID NUMERIC(18,0) ,   
@clientID NUMERIC(18,0)
AS    
BEGIN    
  SELECT * FROM KeyList WHERE KeyID=5012 --Table 0 Role Status    
    
  SELECT    
    A.[RoleID]    
      ,A.[RoleName]    
      ,A.[Description]    
      ,A.[Status]    
      ,B.Value1 AS StrStatus    
      ,A.[CreatedBy]    
      ,A.[CreatedOn]    
      ,A.[UpdatedBy]    
      ,A.[UpdatedOn]    
   ,A.MasterRoleID FROM ApplicationRole AS A    
   LEFT JOIN KeyList AS B    
   ON A.Status=B.KeyListID AND B.KeyID=5012    
WHERE  A.ClientId=@clientID  
 --Table 1 Roles    
    
  SELECT * FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@roleID--Table 2 Role Action    
END    
GO
/****** Object:  StoredProcedure [dbo].[SP_GetSignUpUserDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetSignUpUserDetails]      
@linkId NUMERIC(18,0)      
AS      
BEGIN      
   SELECT 'SignUpUserDetails' AS 'TableName',      
     A.FirstName,      
     A.LastName,      
     A.PrimaryEmailID      
     ,B.ClientName      
     ,A.AccountID      
     ,A.IsPasswordGenerated      
  ,B.ActivationKey    
  ,B.ClientID  
    FROM Tbl_Accounts As A      
    INNER JOIN Tbl_Client AS B      
    ON A.ClientID=B.ClientID      
    WHERE A.LinkID=@linkId AnD A.IsPasswordGenerated=0     
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetSplitBillList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetSplitBillList]
@Billid nvarchar(max)
AS
BEGIN
	SELECT 'SplitBill' AS TableName,CONCAT(GL.GLNumber,'-',GL.GLDescription) AS [AccountName],[Description],Amount
	
	FROM Tbl_BillBreakage
	JOIN [Tbl_GlCodes] GL ON GL.IdentityID=GLAccountID
	
	WHERE BillID=@Billid
END


GO
/****** Object:  StoredProcedure [dbo].[Sp_GetTimeLineList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetTimeLineList]
	@invoiceid numeric(18,0)
AS
BEGIN
	SELECT 'Timelinelst' AS TableName, T.[Action],I.InvoiceName,C.CustomerName,T.Invoiceid,I.TotamAmount,I.Invoicedate
,I.TermCode,A.FirstName,
DATEADD(DAY,convert(int,K.Value2),convert(datetime, Invoicedate, 105)) [Duedate]
FROM  tbl_InvoiceTimeline T
JOIN Tbl_invoice I ON I.InvoiceId=T.Invoiceid
JOIN Tbl_customers C ON I.Customerid=C.CustomerID
JOIN Tbl_Accounts A ON I.CreatedBy=A.AccountID
JOIN keylist K ON K.[Value1]=I.TermCode
WHERE T.Invoiceid=@invoiceid
END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetUnpaidBillStatusReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUnpaidBillStatusReport]
	-- Add the parameters for the stored procedure here
@clientID nvarchar(max)
AS
BEGIN
		SELECT VendorName AS Value1,VendorID AS KeyListID FROM TBL_VENDOR
	    WHERE ClientID=@clientid

			SELECT KeyListID,Value1 FROM  KEYLIST 
	        WHERE KeyListID in(50015,50016,50017,50034)

			SELECT KeyListID,Value1 FROM  KEYLIST 
	        WHERE KeyID=5008

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUpdateBillDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUpdateBillDetails]                      
@billID NUMERIC(18,0),                      
@clientID NUMERIC(18,0),                      
@accountID NUMERIC(18,0)                      
AS                      
BEGIN                      
   SELECT A.[BillID]                
      ,A.[VendorID]                
      ,A.[AccountID]                
      ,A.[BillDate]                
      ,A.[Amount]                
      ,A.[InvoiceNumber]                
      ,A.[DueDate]                
      ,A.[Category]                
      ,A.[Notes]                
      ,A.[PaymentTerms]                
      ,A.[Description]                
      ,A.[IsSplitted]                
      ,A.[Status]                
      ,A.[Balance]                
      ,A.[ClientID]                
      ,A.[FileDisplayName]                
      ,A.[PhysicalLocation]                
      ,A.[FileSize]                
      ,A.[FileName]                
      ,A.[UserComment]                
      ,A.[PurchaseOrder]                
      ,A.[IsChallenged]                
      ,A.[IsRecurring]                
      ,A.[RecurrenceReferenceId]                
      ,A.[IsReminder]                
      ,A.[ReminderEmail]                
      ,A.[ReminderInterval]                
      ,A.[ReminderIntervalDay]                
      ,A.[isAutoApproval]                
      ,A.[RecurrenceStartDate]                
      ,A.[RecurrenceEndDate]                
      ,A.[RecurrenceFrequency]                
      ,A.[RecurrenceBatchNumber]                
      ,B.VendorName        
   ,A.Customer    
   ,A.Project    
   ,A.BillCategory  
      ,(SELECT  [value]  FROM [dbo].[fn_GetPaymentReferenceId](A.BillID))AS PaymentReferenceID,        
      ( SELECT SUM(AmountPaid) FROM Tbl_BillApproved Where BillID=A.BillID) AS AmountPaid        
      ,( SELECT SUM(AmountDue) FROM Tbl_BillApproved Where BillID=A.BillID) AS AmountDue        
      ,c.[PaymentMethod],          
      D.[Value1] AS PaymentMode,          
      c.[PaidOn]          
      FROM Tbl_Bill AS A                 
      LEFT JOIN Tbl_Vendor AS B                
      ON A.VendorID=B.VendorID            
      LEFT JOIN Tbl_BillApproved AS C        
      ON A.BillID=C.BillID        
   LEFT JOIN Keylist As D      
   ON C.PaymentMode=D.KeylistID AND D.Keyid=5021      
   WHERE A.BillID=@billID AND A.AccountID=@accountID AND A.ClientID=@clientID --Bill Details                      
                      
  SELECT * FROM Tbl_BillDescription WHERE BillID=@billID --Bill Descriptions                      
                      
  SELECT                       
      A.[BillBreakageID]                      
        ,A.[BillID]                      
        ,A.[Amount]                      
        ,A.[Description]                      
        ,A.[BillType]             
  , ISNULL( B.[GLNumber],'')+' - '+ISNULL(B.[GLDescription],'') AS 'BillTypeName'            
       -- ,(ISNULL(B.GLNumber,'')+' - '+ ISNULL(B.[GLDescription],'') )AS BillTypeName                      
        ,A.[Status]                       
        ,A.[IsActive]                    
        ,A.[AccountName] 
		,A.GLAccountID
     FROM Tbl_BillBreakage AS A                       
     LEFT JOIN [dbo].[Tbl_GlCodes] AS B                      
     ON A.GLAccountID=B.[IdentityID]  AND B.ClientID=@clientID                      
     where a.BillID=@billID --Bill Breakages                      
                      
                      
  SELECT  A.[AttatchmentId]                      
       ,A.[BillID]                      
       ,A.[FileName]                      
       ,A.[PhysicalFileName]                      
       ,A.[Size]                      
       ,A.[PhysicalPath]                      
       ,A.[Extension]                      
       ,A.[CreatedOn]                      
       ,A.[CreatedBy]                      
       ,A.[IsBillFile]                      
       ,B.FirstName                      
          ,B.LastName                      
             FROM [Tbl_BillAttachments] AS A                      
    LEFT JOIN Tbl_Accounts  AS B                      
       ON A.CreatedBy=B.AccountID                      
    WHERE A.BillID=@billID --Bill Attchments                      
                     
  SELECT  A.[BillCommentID]                      
      ,A.[BillID]                      
      ,A.[Comment]                      
      ,A.[CommentBy]                      
      ,A.[CommentOn]       
      ,B.FirstName                      
      ,B.LastName                      
           FROM [Tbl_BillComments] AS A                      
     LEFT JOIN Tbl_Accounts  AS B                      
     ON A.CommentBy=B.AccountID                      
      WHERE A.BillID=@billID --Bill Comments            
                      
  SELECT   A.[BillStageApprovalID]                      
        ,A.[BillID]                      
        ,A.[ApproverID]                      
        ,A.[Status]                      
        ,A.[Sequence]                      
        ,A.[StageInitiated]                      
        ,A.[CurrentStageApproval]                      
        ,B.FirstName                      
           ,B.LastName                      
                         FROM [BillStageApproval] AS A                      
       LEFT JOIN Tbl_Accounts  AS B                      
                   ON A.ApproverID=B.AccountID                      
                   WHERE A.BillID=@billID --Bill Approvers            
              
                     
    --       SELECT  A.[ApproveHistoryID]                              
    --   ,A.[BillID]                              
    --   ,A.[ApproverComment]                              
    --   ,A.[ApproverID]                              
    --   ,A.[Status]                              
    --   ,A.[CreatedOn]                              
    --   ,B.FirstName                 
    --   ,B.LastName                              
    --   --,D.Balance                              
    --   ,D.Amount                              
    --   ,C.Value1 As StatusName                              
    --   ,E.ApprovedAmount                  
    --   ,(D.Amount-E.ApprovedAmount) AS Balance                  FROM [Tbl_ApproveHistory] AS A                              
    --         LEFT JOIN Tbl_Accounts AS B                              
    --         ON A.ApproverID=B.AccountID                              
    --         LEFT JOIN KeyList As C                              
    --         ON A.Status=C.KeyListID AND C.KeyID=5014                              
    --         INNER JOIN Tbl_Bill AS D                              
    --         ON A.BillID=D.BillID                       
    --INNER JOIN [dbo].[BillStageApproval] As E                  
    --ON A.BillID=E.BillID                   
    --   --INNER JOIN Tbl_BillApproved AS E                              
    --   --ON A.BillID=E.BillID                              
    --         WHERE A.BillID=@billID --Approval History              
    SELECT Distinct  A.[ApproveHistoryID]                    
       ,A.[ApproverComment]                    
       ,A.[ApproverID]                  
    ,A.[Status]                    
       ,A.[CreatedOn]                    
       ,B.FirstName                    
       ,B.LastName                    
       ,A.BalanceAmount AS Balance                    
       ,D.Amount                    
       ,C.Value1 As StatusName                    
       ,A.ApprovedAmount                    
       FROM [Tbl_ApproveHistory] AS A                    
       LEFT JOIN Tbl_Accounts AS B                    
       ON A.ApproverID=B.AccountID                    
       LEFT JOIN KeyList As C                    
       ON A.Status=C.KeyListID AND C.KeyID=5014                    
       INNER JOIN Tbl_Bill AS D                    
       ON A.BillID=D.BillID                    
       --INNER JOIN Tbl_BillApproved AS E                    
       --ON A.BillID=E.BillID                    
       WHERE A.BillID=@billID           
            
        
Select * from TBl_BillPaidAttachments Where BillId=@billID        
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUploadBill_FilterList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUploadBill_FilterList]  
@accountID numeric(18,0),  
@clientId numeric(18,0)  
AS   
begin  
Select * from KeyList where KeyID=5003  
  
Select *  from KeyList where KeyID=5002  
  
Select * from KeyList where KeyID=5007  

SELECT CustomerID AS 'KeyListID',CustomerName AS 'Value1' FROM Tbl_Customers Where ClientID=@clientId

SELECT ProjectID AS 'KeyListID',ProjectName AS 'Value1',Customer FROM Tbl_Projects Where ClientID=@clientId
  
end  
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserBillsInPendingSubmission]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserBillsInPendingSubmission]
@accountID numeric(18,0),
@clientID numeric(18,0)
AS
Begin
	Select          A.[BillID]
				   ,A.[VendorID]
				   ,B.VendorName
				   ,A.[AccountID]
				   ,A.[BillDate]
				   ,A.[Amount]
				   ,A.[InvoiceNumber]
				   ,A.[DueDate]
				   ,A.[Category]
				   ,A.[Notes]
				   ,A.[PaymentTerms]
				   ,A.[Description]
				   ,A.[IsSplitted]
				   ,A.[Status]
				   ,A.[Balance]
	
	  from  Tbl_Bill AS A
	  Left Join [dbo].[Tbl_Vendor] As B 
	  ON
	  A.VendorID=B.VendorID
	  where A.AccountID=@accountID and A.Status=50019 and A.ClientID=@clientID


End
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserHomeBillDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserHomeBillDetails]
@accountID numeric(18,0)
AS
Begin
Select  A.[BillID]
      ,A.[VendorID]
      ,A.[AccountID]
      ,A.[BillDate]
      ,A.[Amount]
      ,A.[InvoiceNumber]
      ,A.[DueDate]
      ,A.[Category]
      ,A.[Notes]
      ,A.[PaymentTerms]
      ,A.[Description]
      ,A.[IsSplitted]
      ,A.[Status]
      ,A.[CreatedOn]
	  ,B.[Value1] AS StatusName,
	  C.[VendorName]
       from [dbo].[Tbl_Bill] AS A
	  LEFT JOIN KeyList AS B
	  ON A.Status=B.KeyListID AND B.KeyID=5005
	  LEFT JOIN [dbo].[Tbl_Vendor] AS C
	  ON A.VendorID=C.[VendorID]
	  where A.AccountID=@accountID and Status in('50016','50017','50019')

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserHomeMasterData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserHomeMasterData]
@ClientId numeric(18,0),
@AccountId numeric(18,0)
AS
BEGIN
	
	Select * from [dbo].[Tbl_Vendor] where ClientID=@ClientId

	Select * from  [dbo].[Tbl_Bill]  where AccountID=@AccountId and Status in('50016','50017','50019')

	Select * from  [dbo].[KeyList] where  KeyID=5005
	 
	 select 'TableName' As TableName, count(BillID) as PendingSubmissionCount from Tbl_Bill where Status=50019 and AccountID=@AccountId
    select 'TableName' As TableName, count(BillID) as ApprovedCount from Tbl_Bill where Status=50015 and AccountID=@AccountId
    select 'TableName' As TableName, count(BillID) as PendingCount from Tbl_Bill where Status=50016 and AccountID=@AccountId
    select 'TableName' As TableName, count(BillID) as RejectedCount from Tbl_Bill where Status=50017 and AccountID=@AccountId
    select 'TableName' As TableName, count(BillID) as FlaggedCount from Tbl_Bill where Status=50018 and AccountID=@AccountId
    select 'TableName' As TableName, count(BillID) as TotalBillCount from Tbl_Bill where  not Status=50036 and AccountID=@AccountId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserHomeScreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserHomeScreenData]              
@accountID NUMERIC(18,0),              
@currentweekstartDate NVARCHAR(MAX),              
@currentweekendDate NVARCHAR(MAX),              
@lastweekstartDate NVARCHAR(MAX),              
@lasttweekendDate NVARCHAR(MAX),              
@startDate NVARCHAR(MAX),              
@endDate NVARCHAR(MAX),              
@isOverDue NUMERIC(18,0) ,        
@status NUMERIC(18,0)    ,
@isOnload  NUMERIC(18,0)  
AS						
BEGIN              
DECLARE @dynamicwhere NVARCHAR(max)=''          
IF @status !=0        
BEGIN         
SET @dynamicwhere =@status        
END             
        
 IF(@isOverDue=0)              
 BEGIN           
     SELECT              
     --Total Bill Details              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID  AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate) ) AS 'TotalBillsCount',               
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CurrentWeekBillsClount',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LastWeekBillsCount',                
     (select SUM(AMOUNT) from tbl_bill B join         
     (select invoicenumber,min(duedate) duedate      
     from tbl_bill group by InvoiceNumber)         
     SQ on B.invoicenumber = SQ.InvoiceNumber      
     and B.DueDate = sq.duedate          
     where createdby=@accountID  AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'TotalAmount',              
                 
   --Peding Submission Bills              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'PendingSubmissionBills',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekPendingSubmissionCount',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate)  ) AS 'LWeekPendingSubmissionCount',              
     (select SUM(AMOUNT) from tbl_bill B join         
     (select invoicenumber,min(duedate) duedate      
     from tbl_bill group by InvoiceNumber)         
     SQ on B.invoicenumber = SQ.InvoiceNumber      
     and B.DueDate = sq.duedate          
     where createdby=@accountID    AND Status=50019  AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'PendingSubmissionAmount',              
              
    --Rejected Submission Bills              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017  AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'RejectedBills',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND               
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND               
     convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',              
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017 AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)   ) AS 'RejectedAmount',              
              
                   
    --Approved Counts              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50015 AND               
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekApprovedCount',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50015 AND               
     convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekApprovedCount',              
                 
              
                 
                 
   --UnApproved(Pending) Submission Bills              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'UnApprovedBills',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekUnApprovedCount',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LWeekUnApprovedCount',              
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016  AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'UnApprovedAmount'              
                 
   --Select  A.[BillID]              
   --     ,A.[VendorID]              
   --     ,A.[AccountID]              
   --     ,A.[BillDate]              
   --     ,A.[Amount]              
   --     ,A.[InvoiceNumber]              
   --     ,A.[DueDate]              
   --     ,A.[Category]              
   --     ,A.[Notes]              
   --     ,A.[PaymentTerms]              
   --     ,A.[Description]              
   --     ,A.[IsSplitted]              
   --     ,A.[Status]              
   --     ,A.[CreatedOn]              
   --  ,A.CreatedBy              
   --  ,B.[Value1] AS StatusName,              
   --  A.[IsRecurring],              
   --  C.[VendorName]              
   --      from [dbo].[Tbl_Bill] AS A              
   --  LEFT JOIN KeyList AS B              
   --  ON A.Status=B.KeyListID AND B.KeyID=5005              
   --  LEFT JOIN [dbo].[Tbl_Vendor] AS C              
   --  ON A.VendorID=C.[VendorID]              
   --  WHERE A.CreatedBy=@accountID AND A.Status in('50015','50016','50017','50019')  AND A.Status Like '%'+@dynamicwhere+'%'            
   --  AND  ((Convert(DATE,A.CreatedOn) >= CONVERT(DATE,@startDate))               
   --  AND Convert(date,A.CreatedOn)<= CONVERT(DATE,@endDate))         
         
     SELECT      
         SQ.InvoiceNumber      
         ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate      
        ,C.Value1  AS StatusName      
        ,D.[VendorName]      
        ,B.[VendorID]          
        ,B.[AccountID]          
        ,B.[BillDate]          
        ,B.[Amount]          
      ,B.[DueDate]      
        ,Convert(date,B.[DueDate],101) AS DueOn      
        ,B.[Category]          
        ,B.[Notes]          
        ,B.[PaymentTerms]          
        ,B.[Description]          
        ,B.[IsSplitted]          
        ,Case        
         WHEN B.Status=50019 Then 'Draft'       
         WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'       
         WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'      
         END AS 'StageName'        
        ,B.[Status]          
        ,B.[CreatedOn]          
        ,B.CreatedBy          
        ,B.[BillID]         
        ,B.IsRecurring      
        from tbl_bill B join       
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )       
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status      
        LEFT JOIN KeyList AS C         
        ON B.Status=C.KeyListID AND c.KeyID=5005          
        LEFT JOIN [dbo].[Tbl_Vendor] AS D      
        ON B.VendorID=D.[VendorID]       
        WHERE B.CreatedBy=@accountID-- AND B.Status in('50015','50016','50017','50019')    
        AND B.Status Like '%'+@dynamicwhere+'%'            
        AND  ((Convert(DATE,B.CreatedOn) >= CONVERT(DATE,@startDate))               
        AND Convert(date,B.CreatedOn)<= CONVERT(DATE,@endDate))         

    IF (@isOnload=0)
	BEGIN
           
     SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'              
     FROM Tbl_Bill              
     WHERE  Status in('50015','50017','50016')AND   CreatedBy=@accountID  AND            
     (CONVERT(DATE,CreatedOn) >= CONVERT(DATE,@startDate))               
     AND CONVERT(date,CreatedOn)<= CONVERT(DATE,@endDate)    AND Status Like '%'+@dynamicwhere+'%'                
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS              
    END
	ELSE
	BEGIN
	SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'              
     FROM Tbl_Bill              
     WHERE  Status in('50015','50017','50016')AND   CreatedBy=@accountID  AND            
     (CONVERT(DATE,CreatedOn) >= CONVERT(DATE, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)))               
     AND CONVERT(date,CreatedOn)<= CONVERT(DATE,  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1))    AND Status Like '%'+@dynamicwhere+'%'                
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS 
	 ORDER BY 'Year' ASC
    END        

 END              
 ELSE              
 BEGIN              
              
  SELECT               
     --Total Bill Details              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalBillsCount',               
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CurrentWeekBillsClount',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LastWeekBillsCount',                
     (select SUM(AMOUNT) from tbl_bill B join         
     (select invoicenumber,min(duedate) duedate      
     from tbl_bill group by InvoiceNumber)         
     SQ on B.invoicenumber = SQ.InvoiceNumber      
     and B.DueDate = sq.duedate          
     where createdby=@accountID   AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalAmount',              
                 
   --Peding Submission Bills              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'PendingSubmissionBills',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekPendingSubmissionCount',              
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND               
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate)  ) AS 'LWeekPendingSubmissionCount',              
     ( select SUM(AMOUNT) from tbl_bill B join         
     (select invoicenumber,min(duedate) duedate      
     from tbl_bill group by InvoiceNumber)         
     SQ on B.invoicenumber = SQ.InvoiceNumber      
     and B.DueDate = sq.duedate          
     where createdby=@accountID  AND  Status=50019 AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE())  ) AS 'PendingSubmissionAmount',              
              
    --Rejected Submission Bills              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'RejectedBills',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND               
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',              
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND               
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',              
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   ) AS 'RejectedAmount',              
              
    --Approved Counts              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50015 AND               
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekApprovedCount',              
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50015 AND               
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekApprovedCount',              
                 
   --UnApproved(Pending) Submission Bills              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016   AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedBills',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekUnApprovedCount',              
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND               
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))               
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'LWeekUnApprovedCount',              
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016    AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedAmount'              
                
  --Select  A.[BillID]              
  --      ,A.[VendorID]              
  --      ,A.[AccountID]              
  --      ,A.[BillDate]              
  --      ,A.[Amount]              
  --      ,A.[InvoiceNumber]              
  --      ,A.[DueDate]              
  --      ,A.[Category]              
  --      ,A.[Notes]              
  --      ,A.[PaymentTerms]              
  --      ,A.[Description]              
  --      ,A.[IsSplitted]              
  --      ,A.[Status]              
  --      ,A.[CreatedOn]              
  --   ,A.CreatedBy              
  --   ,B.[Value1] AS StatusName,              
  --   A.[IsRecurring],              
  --   C.[VendorName]              
  --       from [dbo].[Tbl_Bill] AS A              
  --   LEFT JOIN KeyList AS B              
  --   ON A.Status=B.KeyListID AND B.KeyID=5005              
  --   LEFT JOIN [dbo].[Tbl_Vendor] AS C              
  --   ON A.VendorID=C.[VendorID]              
  --   WHERE A.CreatedBy=@accountID AND A.Status in('50015','50016','50017','50019')    AND Status Like '%'+@dynamicwhere+'%'               
  --   AND Convert(Date,A.DueDate)< CONVERT(date,GETUTCDATE())              
      
         SELECT      
         SQ.InvoiceNumber      
        ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate      
        ,C.Value1  AS StatusName      
        ,D.[VendorName]      
        ,B.[VendorID]          
        ,B.[AccountID]          
        ,B.[BillDate]          
        ,B.[Amount]          
        ,B.[DueDate]      
        ,Convert(date,B.[DueDate],101) AS DueOn      
        ,B.[Category]          
        ,B.[Notes]          
        ,B.[PaymentTerms]          
        ,B.[Description]          
        ,B.[IsSplitted]          
        ,Case        
         WHEN B.Status=50019 Then 'Draft'       
         WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'       
         WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'      
         END AS 'StageName'        
        ,B.[Status]          
        ,B.[CreatedOn]          
        ,B.CreatedBy          
        ,B.[BillID]         
        ,B.IsRecurring      
        from tbl_bill B join       
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )       
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status      
        LEFT JOIN KeyList AS C         
        ON B.Status=C.KeyListID AND c.KeyID=5005          
        LEFT JOIN [dbo].[Tbl_Vendor] AS D      
        ON B.VendorID=D.[VendorID]       
        WHERE B.CreatedBy=@accountID --AND B.Status in('50015','50016','50017','50019')       
        AND B.Status Like '%'+@dynamicwhere+'%'               
        AND Convert(Date,SQ.DueDate)< CONVERT(date,GETUTCDATE())        
              
      SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'              
      FROM Tbl_Bill              
      WHERE  Status in('50015','50017','50016')AND CreatedBy=@accountID  AND               
      Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   AND Status Like '%'+@dynamicwhere+'%'                
      GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS              
 END              
                  
              
              
END   
  
  
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserHomeScreenDataNew]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  --SP_GetUserHomeScreenDataNew 30166,'08/29/2021','09/04/2021','08/22/2021','08/28/2021','09/01/2021','09/30/2021',0,0,1,'0'
CREATE PROCEDURE [dbo].[SP_GetUserHomeScreenDataNew]                  
@accountID NUMERIC(18,0),                  
@currentweekstartDate NVARCHAR(MAX),                  
@currentweekendDate NVARCHAR(MAX),                  
@lastweekstartDate NVARCHAR(MAX),                  
@lasttweekendDate NVARCHAR(MAX),                  
@startDate NVARCHAR(MAX),                  
@endDate NVARCHAR(MAX),                  
@isOverDue NUMERIC(18,0) ,            
@status NUMERIC(18,0)    ,    
@isOnload  NUMERIC(18,0)   ,  
@isDueDateFilter NVARCHAR(MAX)  
AS          
BEGIN                  
DECLARE @dynamicStatus NVARCHAR(MAX)=''  
DECLARE @dynamicwhere NVARCHAR(max)=''     
DECLARE @dynamicStartAndEndwhere NVARCHAR(max)=''   
DECLARE @dynamicJoinwhere NVARCHAR(max)=''  
DECLARE @dynamicCWeekwhere NVARCHAR(max)=''  
DECLARE @dynamicLWeekwhere NVARCHAR(max)=''  
  
  
DECLARE @QUERY  VARCHAR(max)  
IF @status !=0            
BEGIN             
SET @dynamicwhere =@status     
SET @dynamicStatus=' AND Status ='+ CAST(@status AS VARCHAR(MAX)) +''  
END      
  
IF(@isDueDateFilter=0)  
BEGIN  
IF(@startDate!=''AND @endDate!='')  
BEGIN   
SET @dynamicJoinwhere=' AND Convert(varchar, b.CreatedOn,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''  
SET @dynamicStartAndEndwhere=' AND Convert(varchar, CreatedOn,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''  
print @dynamicStartAndEndwhere
END  
END  
ELSE  
BEGIN  
IF(@startDate!='' AND @endDate!='')  
BEGIN  
SET @dynamicStartAndEndwhere=' AND Convert(varchar, DueDate,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''  
SET @dynamicJoinwhere=' AND Convert(varchar, b.DueDate,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@startDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@endDate,101),112)+''''  
END  
END  
IF(@currentweekstartDate!=''AND @currentweekendDate!='')  
BEGIN  
SET @dynamicCWeekwhere=' AND Convert(varchar, CreatedOn,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@currentweekstartDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@currentweekendDate,101),112)+''''  
END  
IF(@lastweekstartDate!=''AND @lasttweekendDate!='')  
BEGIN  
SET @dynamicLWeekwhere=' AND Convert(varchar, CreatedOn,112)  BETWEEN '''+Convert(varchar(50),Convert(date,@lastweekstartDate,101),112)+''' AND '''+Convert(varchar(50),Convert(date,@lasttweekendDate,101),112)+''''  
END  
            
 IF(@isOverDue=0)                  
 BEGIN               
      SET @QUERY='  SELECT   
     --Total Bill Details                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+' ) AS ''TotalBillsCount'',                   
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicCWeekwhere+'  ) AS ''CurrentWeekBillsClount'',                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicLWeekwhere+' ) AS ''LastWeekBillsCount'',  
	 (SELECT SUM(AMOUNT) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+' ) AS ''TotalAmount'',                   
     (select SUM(AMOUNT) from tbl_bill B join             
     (select invoicenumber,min(duedate) duedate          
     from tbl_bill group by InvoiceNumber)             
     SQ on B.invoicenumber = SQ.InvoiceNumber          
     and B.DueDate = sq.duedate              
     where b.createdby='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicJoinwhere+'  ) AS ''TotalAmount1''  , -- changed by govind form wrong selection               
   --Peding Submission Bills                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+'  AND Status='+ CAST(50019 AS VARCHAR(MAX)) +') AS ''PendingSubmissionBills'',                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicCWeekwhere+'  AND Status='+ CAST(50019 AS VARCHAR(MAX)) +' ) AS ''CWeekPendingSubmissionCount'',                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicLWeekwhere+'  AND Status='+ CAST(50019 AS VARCHAR(MAX)) +' ) AS ''LWeekPendingSubmissionCount'',                  
     (select SUM(AMOUNT) from tbl_bill B join             
     (select invoicenumber,min(duedate) duedate          
     from tbl_bill group by InvoiceNumber)             
     SQ on B.invoicenumber = SQ.InvoiceNumber          
     and B.DueDate = sq.duedate              
     where b.createdby='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicJoinwhere+'  AND Status=''50019''   ) AS ''PendingSubmissionAmount'',  
    --Rejected Submission Bills                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+'  AND Status='+ CAST(50017 AS VARCHAR(MAX)) +') AS ''RejectedBills'',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicCWeekwhere+'  AND Status='+ CAST(50017 AS VARCHAR(MAX)) +' ) AS ''CWeekRejectedCount'',                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicLWeekwhere+'  AND Status='+ CAST(50017 AS VARCHAR(MAX)) +' )  AS ''LWeekRejectedCount'',                  
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+'  AND Status='+ CAST(50017 AS VARCHAR(MAX)) +'   ) AS ''RejectedAmount'',                              
     
   --Approved Counts                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy='+ CAST(@accountID AS VARCHAR(MAX))+' '+@dynamicStartAndEndwhere+'  AND Status='+ CAST(50015 AS VARCHAR(MAX)) +' ) AS ''CWeekApprovedCount'',                  
       
  (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicLWeekwhere+'  AND Status='+ CAST(50015 AS VARCHAR(MAX)) +'   )  AS ''LWeekApprovedCount'',  
   --UnApproved(Pending)                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+'  AND Status='+ CAST(50016 AS VARCHAR(MAX)) +' ) AS ''UnApprovedBills'',                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicCWeekwhere+'  AND Status='+ CAST(50016 AS VARCHAR(MAX)) +'  ) AS ''CWeekUnApprovedCount'',                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicLWeekwhere+'  AND Status='+ CAST(50016 AS VARCHAR(MAX)) +'  ) AS ''LWeekUnApprovedCount'',                  
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID='+ CAST(@accountID AS VARCHAR(MAX)) +@dynamicStartAndEndwhere+'  AND Status='+ CAST(50016 AS VARCHAR(MAX)) +' ) AS ''UnApprovedAmount'' '  
   
   
 PRINT @QUERY  
 EXEC(@QUERY)  
 SET @QUERY=''  
    
 SET @QUERY='  
     SELECT          
         SQ.InvoiceNumber          
         ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate          
        ,C.Value1  AS StatusName          
        ,D.[VendorName]          
        ,B.[VendorID]              
        ,B.[AccountID]              
        ,B.[BillDate]              
        ,B.[Amount]              
        ,B.[DueDate]          
        ,Convert(date,B.[DueDate],101) AS DueOn          
        ,B.[Category]              
        ,B.[Notes]              
        ,B.[PaymentTerms]              
        ,B.[Description]              
        ,B.[IsSplitted]              
        ,Case            
         WHEN B.Status=50019 Then ''Draft''           
         WHEN B.Status IN (''50017'',''50015'',''50016'',''50034'') Then ''Approvals''             
         WHEN B.Status IN (''50036'',''50018'',''50044'')  Then ''Payments''            
         END AS ''StageName''            
        ,B.[Status]              
        ,B.[CreatedOn]              
        ,B.CreatedBy              
        ,B.[BillID]             
        ,B.IsRecurring          
        from tbl_bill B join           
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )           
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status          
        LEFT JOIN KeyList AS C             
        ON B.Status=C.KeyListID AND c.KeyID=''5005''       
        LEFT JOIN [dbo].[Tbl_Vendor] AS D          
        ON B.VendorID=D.[VendorID]           
        WHERE B.CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +''+  
      @dynamicStatus+' '+' '+@dynamicJoinwhere+'  '            
           
 PRINT @QUERY  
 EXEC(@QUERY)  
 SET @QUERY=''  
   
    
    IF (@isOnload=0)    
 BEGIN    
               
    SET @QUERY='             
     SELECT YEAR(DueDate) AS ''Year'',MONTH(DueDate) AS ''Month'',DATEPART(week, DueDate) AS ''Week'',SUM(Amount) AS ''Amount'',Status AS ''Status''                  
     FROM Tbl_Bill                  
     WHERE  Status in(''50015'',''50017'',''50016'')AND   CreatedBy='+ CAST(@accountID AS VARCHAR(MAX)) +' '+  
      @dynamicStatus+' '+' '+@dynamicStartAndEndwhere+'                    
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS, DATEPART(week, DueDate)'    
  PRINT @QUERY  
  EXEC(@QUERY)  
  SET @QUERY=''  
    END    
 ELSE    
 BEGIN    
 SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',DATEPART(WEEK, DueDate) AS 'Week',SUM(Amount) AS 'Amount',Status AS 'Status'                  
     FROM Tbl_Bill                  
     WHERE  Status in('50015','50017','50016')AND   CreatedBy=@accountID  AND                
     (CONVERT(DATE,CreatedOn) >= CONVERT(DATE, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)))                   
     AND CONVERT(date,CreatedOn)<= CONVERT(DATE,  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1))    AND Status Like '%'+@dynamicwhere+'%'                    
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS,DATEPART(WEEK, DueDate)     
  ORDER BY 'Year' ASC    
    END            
    
 END                  
 ELSE                  
 BEGIN                  
                  
      SELECT    
     --Total Bill Details                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalBillsCount',                   
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                   
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CurrentWeekBillsClount',                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                   
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LastWeekBillsCount',                    
     (select SUM(AMOUNT) from tbl_bill B join             
     (select invoicenumber,min(duedate) duedate          
     from tbl_bill group by InvoiceNumber)             
     SQ on B.invoicenumber = SQ.InvoiceNumber          
     and B.DueDate = sq.duedate              
     where createdby=@accountID   AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalAmount',                  
                     
   --Peding Submission Bills                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'PendingSubmissionBills',                  
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND                   
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekPendingSubmissionCount',             
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND                   
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate)  ) AS 'LWeekPendingSubmissionCount',                  
     ( select SUM(AMOUNT) from tbl_bill B join             
     (select invoicenumber,min(duedate) duedate          
     from tbl_bill group by InvoiceNumber)             
     SQ on B.invoicenumber = SQ.InvoiceNumber          
     and B.DueDate = sq.duedate              
     where createdby=@accountID  AND  Status=50019 AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE())  ) AS 'PendingSubmissionAmount',                  
                  
    --Rejected Submission Bills                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'RejectedBills',                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND                   
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',                  
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND                   
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',                  
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   ) AS 'RejectedAmount',                  
                  
    --Approved Counts                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50015 AND                   
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekApprovedCount',                  
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50015 AND                   
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekApprovedCount',                  
                     
   --UnApproved(Pending) Submission Bills                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016   AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedBills',                  
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND                   
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekUnApprovedCount',                  
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND                   
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                   
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'LWeekUnApprovedCount',                  
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016    AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedAmount'                                 
          
      SELECT    
         SQ.InvoiceNumber          
        ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate          
        ,C.Value1  AS StatusName          
        ,D.[VendorName]          
        ,B.[VendorID]              
        ,B.[AccountID]              
        ,B.[BillDate]              
        ,B.[Amount]              
        ,B.[DueDate]          
        ,Convert(date,B.[DueDate],101) AS DueOn          
        ,B.[Category]              
        ,B.[Notes]              
        ,B.[PaymentTerms]              
        ,B.[Description]              
        ,B.[IsSplitted]              
        ,Case            
         WHEN B.Status=50019 Then 'Draft'           
         WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'           
         WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'          
         END AS 'StageName'            
        ,B.[Status]              
        ,B.[CreatedOn]              
        ,B.CreatedBy              
        ,B.[BillID]             
        ,B.IsRecurring          
        from tbl_bill B join           
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )           
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status          
        LEFT JOIN KeyList AS C             
        ON B.Status=C.KeyListID AND c.KeyID=5005              
        LEFT JOIN [dbo].[Tbl_Vendor] AS D          
        ON B.VendorID=D.[VendorID]           
        WHERE B.CreatedBy=@accountID --AND B.Status in('50015','50016','50017','50019')           
        AND B.Status Like '%'+@dynamicwhere+'%'                   
        AND Convert(Date,SQ.DueDate)< CONVERT(date,GETUTCDATE())            
                  
      SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',DATEPART(week, DueDate) AS 'Week',SUM(Amount) AS 'Amount',Status AS 'Status'                  
      FROM Tbl_Bill                  
      WHERE  Status in('50015','50017','50016')AND CreatedBy=@accountID  AND                   
      Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   AND Status Like '%'+@dynamicwhere+'%'                    
      GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS,DATEPART(WEEK, DueDate)                  
 END                  
                      
                  
                  
END       
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserHomeScreenDataOld]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserHomeScreenDataOld]                
@accountID NUMERIC(18,0),                
@currentweekstartDate NVARCHAR(MAX),                
@currentweekendDate NVARCHAR(MAX),                
@lastweekstartDate NVARCHAR(MAX),                
@lasttweekendDate NVARCHAR(MAX),                
@startDate NVARCHAR(MAX),                
@endDate NVARCHAR(MAX),                
@isOverDue NUMERIC(18,0) ,          
@status NUMERIC(18,0)    ,  
@isOnload  NUMERIC(18,0)    
AS        
BEGIN                
DECLARE @dynamicwhere NVARCHAR(max)=''            
IF @status !=0          
BEGIN           
SET @dynamicwhere =@status          
END               
          
 IF(@isOverDue=0)                
 BEGIN             
     SELECT 
     --Total Bill Details                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID  AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate) ) AS 'TotalBillsCount',                 
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CurrentWeekBillsClount',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LastWeekBillsCount',                  
     (select SUM(AMOUNT) from tbl_bill B join           
     (select invoicenumber,min(duedate) duedate        
     from tbl_bill group by InvoiceNumber)           
     SQ on B.invoicenumber = SQ.InvoiceNumber        
     and B.DueDate = sq.duedate            
     where createdby=@accountID  AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'TotalAmount',                
                   
   --Peding Submission Bills                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'PendingSubmissionBills',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekPendingSubmissionCount',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate)  ) AS 'LWeekPendingSubmissionCount',                
     (select SUM(AMOUNT) from tbl_bill B join           
     (select invoicenumber,min(duedate) duedate        
     from tbl_bill group by InvoiceNumber)           
     SQ on B.invoicenumber = SQ.InvoiceNumber        
     and B.DueDate = sq.duedate            
     where createdby=@accountID    AND Status=50019  AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'PendingSubmissionAmount',                
                
    --Rejected Submission Bills                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017  AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)) AS 'RejectedBills',              
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND                 
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND                 
     convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',                
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017 AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)   ) AS 'RejectedAmount',                
                
                     
    --Approved Counts                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50015 AND                 
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekApprovedCount',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50015 AND                 
     convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekApprovedCount',                
                   
   --UnApproved(Pending) Submission Bills                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'UnApprovedBills',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekUnApprovedCount',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LWeekUnApprovedCount',                
     (SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016  AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@endDate)  ) AS 'UnApprovedAmount'  
	 
     SELECT        
         SQ.InvoiceNumber        
         ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate        
        ,C.Value1  AS StatusName        
        ,D.[VendorName]        
        ,B.[VendorID]            
        ,B.[AccountID]            
        ,B.[BillDate]            
        ,B.[Amount]            
      ,B.[DueDate]        
        ,Convert(date,B.[DueDate],101) AS DueOn        
        ,B.[Category]            
        ,B.[Notes]            
        ,B.[PaymentTerms]            
        ,B.[Description]            
        ,B.[IsSplitted]            
        ,Case          
         WHEN B.Status=50019 Then 'Draft'         
         WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'         
         WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'        
         END AS 'StageName'          
        ,B.[Status]            
        ,B.[CreatedOn]            
        ,B.CreatedBy            
        ,B.[BillID]           
        ,B.IsRecurring        
        from tbl_bill B join         
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )         
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status        
        LEFT JOIN KeyList AS C           
        ON B.Status=C.KeyListID AND c.KeyID=5005            
        LEFT JOIN [dbo].[Tbl_Vendor] AS D        
        ON B.VendorID=D.[VendorID]         
        WHERE B.CreatedBy=@accountID-- AND B.Status in('50015','50016','50017','50019')      
        AND B.Status Like '%'+@dynamicwhere+'%'              
        AND  ((Convert(DATE,B.CreatedOn) >= CONVERT(DATE,@startDate))                 
        AND Convert(date,B.CreatedOn)<= CONVERT(DATE,@endDate))           
  
    IF (@isOnload=0)  
 BEGIN  
             
     SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'                
     FROM Tbl_Bill                
     WHERE  Status in('50015','50017','50016')AND   CreatedBy=@accountID  AND              
     (CONVERT(DATE,CreatedOn) >= CONVERT(DATE,@startDate))                 
     AND CONVERT(date,CreatedOn)<= CONVERT(DATE,@endDate)    AND Status Like '%'+@dynamicwhere+'%'                  
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS                
    END  
 ELSE  
 BEGIN  
 SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'                
     FROM Tbl_Bill                
     WHERE  Status in('50015','50017','50016')AND   CreatedBy=@accountID  AND              
     (CONVERT(DATE,CreatedOn) >= CONVERT(DATE, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)))                 
     AND CONVERT(date,CreatedOn)<= CONVERT(DATE,  DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1))    AND Status Like '%'+@dynamicwhere+'%'                  
     GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS   
  ORDER BY 'Year' ASC  
    END          
  
 END                
 ELSE                
 BEGIN                
                
  SELECT                 
     --Total Bill Details                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalBillsCount',                 
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CurrentWeekBillsClount',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate) ) AS 'LastWeekBillsCount',                  
     (select SUM(AMOUNT) from tbl_bill B join           
     (select invoicenumber,min(duedate) duedate        
     from tbl_bill group by InvoiceNumber)           
     SQ on B.invoicenumber = SQ.InvoiceNumber        
     and B.DueDate = sq.duedate            
     where createdby=@accountID   AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE()) ) AS 'TotalAmount',                
                   
   --Peding Submission Bills                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50019 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'PendingSubmissionBills',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50019 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekPendingSubmissionCount',                
     (SELECT COUNT(Distinct InvoiceNumber) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50019 AND                 
     (Convert(DATE,CreatedOn) >= CONVERT(DATE,@lastweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@lasttweekendDate)  ) AS 'LWeekPendingSubmissionCount',                
     ( select SUM(AMOUNT) from tbl_bill B join           
     (select invoicenumber,min(duedate) duedate        
     from tbl_bill group by InvoiceNumber)           
     SQ on B.invoicenumber = SQ.InvoiceNumber        
     and B.DueDate = sq.duedate            
     where createdby=@accountID  AND  Status=50019 AND Convert(Date,SQ.duedate)< CONVERT(date,GETUTCDATE())  ) AS 'PendingSubmissionAmount',                
                
    --Rejected Submission Bills                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50017 AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'RejectedBills',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50017 AND                 
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',                
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50017 AND                 
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',                
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50017  AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   ) AS 'RejectedAmount',                
                
    --Approved Counts                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50015 AND                 
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekApprovedCount',                
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50015 AND                 
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekApprovedCount',                
                   
   --UnApproved(Pending) Submission Bills                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND Status=50016   AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedBills',                
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  CreatedBy=@accountID AND Status=50016 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'CWeekUnApprovedCount',                
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE CreatedBy=@accountID AND   Status=50016 AND                 
     ( Convert(DATE,CreatedOn) >= CONVERT(DATE,@currentweekstartDate))                 
     AND Convert(date,CreatedOn)<= CONVERT(DATE,@currentweekendDate) ) AS 'LWeekUnApprovedCount',                
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE AccountID=@accountID  AND Status=50016    AND Convert(Date,DueDate)< CONVERT(date,GETUTCDATE()) ) AS 'UnApprovedAmount'                               
        
         SELECT        
         SQ.InvoiceNumber        
        ,(SELECT Top (1) DueDate FROM Tbl_Bill Where IsRecurring=1 AND Status=50019 AND  InvoiceNumber=B.InvoiceNumber Order by DueDate ASC) As NextDueDate        
        ,C.Value1  AS StatusName        
        ,D.[VendorName]        
        ,B.[VendorID]            
        ,B.[AccountID]            
        ,B.[BillDate]            
        ,B.[Amount]            
        ,B.[DueDate]        
        ,Convert(date,B.[DueDate],101) AS DueOn        
        ,B.[Category]            
        ,B.[Notes]            
        ,B.[PaymentTerms]            
        ,B.[Description]            
        ,B.[IsSplitted]            
        ,Case          
         WHEN B.Status=50019 Then 'Draft'         
         WHEN B.Status IN ('50017','50015','50016','50034') Then 'Approvals'         
         WHEN B.Status IN ('50036','50018','50044')  Then 'Payments'        
         END AS 'StageName'          
        ,B.[Status]            
        ,B.[CreatedOn]            
        ,B.CreatedBy            
        ,B.[BillID]           
        ,B.IsRecurring        
        from tbl_bill B join         
        (select invoicenumber,min(duedate) duedate from tbl_bill group by InvoiceNumber )         
        SQ on B.invoicenumber = SQ.InvoiceNumber and B.DueDate = sq.duedate-- AND Sq.Status=B.Status        
        LEFT JOIN KeyList AS C           
        ON B.Status=C.KeyListID AND c.KeyID=5005            
        LEFT JOIN [dbo].[Tbl_Vendor] AS D        
        ON B.VendorID=D.[VendorID]         
        WHERE B.CreatedBy=@accountID --AND B.Status in('50015','50016','50017','50019')         
        AND B.Status Like '%'+@dynamicwhere+'%'                 
        AND Convert(Date,SQ.DueDate)< CONVERT(date,GETUTCDATE())          
                
      SELECT YEAR(DueDate) AS 'Year',MONTH(DueDate) AS 'Month',SUM(Amount) AS 'Amount',Status AS 'Status'                
      FROM Tbl_Bill                
      WHERE  Status in('50015','50017','50016')AND CreatedBy=@accountID  AND                 
      Convert(Date,DueDate)< CONVERT(date,GETUTCDATE())   AND Status Like '%'+@dynamicwhere+'%'                  
      GROUP BY YEAR(DueDate),MONTH(DueDate),STATUS                
 END                
                    
                
                
END     
    
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsersList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUsersList]
@clientID NUMERIC(18,0)
As
BEGIN
 SELECT 'Users' AS TableName,AccountID AS KeyListID,(ISNULL(FirstName,'')+' '+ISNULL(LastName,''))AS Value1 FROM Tbl_Accounts WHERE ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserSreenData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserSreenData]  
@roleID NUMERIC(18,0) 
,@clientID NUMERIC(18,0)
AS  
BEGIN  
  SELECT * FROM KeyList WHERE KeyID=5013 --Table 0 Role Status  
  
  SELECT * FROM ApplicationRole  Where ClientID=@clientID 
  
  SELECT  
    A.[AccountID]  
      ,A.[Role]  
      ,A.[UserName]  
      ,A.[Password]  
      ,A.[FirstName]  
      ,A.[LastName]  
      ,A.[PrimaryEmailID]  
      ,A.[PhoneNumber]  
      ,A.[Address1]  
      ,A.[Address2]  
      ,A.[Zipcode]  
      ,A.[IsActive]  
      ,A.[EntityStatus]  
      ,A.[CreatedOn]  
      ,A.[CreatedBy]  
      ,A.[UpdatedOn]  
      ,A.[UpdatedBy]  
      ,A.[ClientID]  
      ,A.[AdministrationRole]  
      ,A.[ApplicationRole]  
   ,B.Value1 AS StrStatus  
   ,C.RoleName  
   FROM Tbl_Accounts AS A  
   LEFT JOIN KeyList AS B  
   ON A.IsActive=B.KeyListID AND B.KeyID=5013   
   LEFT JOIN [dbo].[ApplicationRole] AS C  
   ON A.ApplicationRole=C.RoleID 
   Where A.ClientID=@clientID
  --Table 1 Roles  
  
  SELECT * FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@roleID --Table 2 Role Action  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsetDetaillist]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUsetDetaillist]
	@clientID nvarchar(max)
AS
BEGIN


	SELECT CONCAT(FirstName, ' ', LastName)  AS Value1,AccountID AS KeyListID FROM Tbl_Accounts
	WHERE ClientID=@clientID AND FirstName <> '' ORDER BY FirstName

	

	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorBalanceBasedReport]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetVendorBalanceBasedReport]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@clientID NUMERIC(18,0)=2000,
	@vendor nvarchar(max),@duefrom nvarchar(max),@dueTo nvarchar(max),
	@from nvarchar(max),@to nvarchar(max),@billableamt nvarchar(max)
	
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF @vendor !='0'                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
END 

--IF @from !='' AND @to !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND InvoiceDate  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            
--END 


--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            
--END

IF @billableamt !=''                
BEGIN                
SET @dynamicwhere = @dynamicwhere + ' AND TOTALBILLABLEAMT IN ('+@billableamt+')'               
END

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''VendorList'' AS TableName, [VendorName],[TOTALBILLABLEAMT],[TOTALPAIDAMT]        
,[OVERDUEAMT],[PAYABLEAMT],LASTPAYMENT,[NEXTDUEIN],[PAYMENTMWTHOD],[VendorID],ClientID
 FROM [View_VendorBalanceReport] WHERE ClientID= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT VendorID) AS Count FROM [View_VendorBalanceReport]'              
+ '              
 WHERE  ClientID = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetVendorContacts]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_GetVendorContacts]
@vendorID NUMERIC(18,0),
@clientID NUMERIC(18,0)
AS
BEGIN
SELECT 'VendorContacts' AS TableName,
      [ContactIdentityId]
      ,[VendorID]
	  ,FirstName,
	  LastName
      ,(coalesce(FirstName,'') +' '+coalesce(LastName,'')) AS Name
      ,[Email]
      ,[Phone]
      FROM [dbo].[VendorContact]  Where VendorID=@vendorID AND ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorFiles]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetVendorFiles]  
@vendorID NUMERIC(18,0),  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
   SELECT 'VendorFiles' AS TableName,  
        A.[FileName]  
       ,A.[LastModifiedBy]  
    ,A.[ModifiedFileName]  
	,A.CreatedOn
   ,(coalesce(B.FirstName,'')+' '+ coalesce(B.LastName,'')) AS Name  
    FROM [dbo].[Tbl_VendorDocuments] AS A  
    LEFT JOIN Tbl_Accounts As B  
    ON A.[CreatedBy]=B.AccountID  
    WHERE A.[VendorID]=@vendorID AND A.[ClientID]=@clientID  
END  

GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorInfo]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --SP_GetVendorInfo 5209,2000     
CREATE PROCEDURE [dbo].[SP_GetVendorInfo]                      
@vendorID NUMERIC(18,0),                      
@clientID NUMERIC(18,0)                      
AS                      
BEGIN                      
                      
SELECT  'VendorDetails' AS TableName,                      
    A.[VendorID]                      
      ,A.[VendorName]                      
      ,A.[FirstName]                      
      ,A.[LastName]                      
      ,A.[Email]                      
      ,A.[City]                      
      ,A.[Country]                      
      ,A.[Address1]                      
      ,A.[Address2]                      
      ,A.[PostalCode]                      
      ,A.[State]                      
      ,A.[Phone]                      
      ,A.[WebsiteURL]                      
      ,A.[PrefferedPaymentMethod]                      
      ,C.Value1 AS 'StrPrefferedPaymentMethod'                      
      ,A.[TaxId]                      
      ,A.[PaymentTerm]                      
      ,B.Value1 AS 'StrPaymentTerm'                      
      ,A.[LeadTimeDays]                      
      ,A.[VendorLogo]                      
      ,A.[PaypalEmailAddress]                      
      ,A.[PaypalMobileNumber]                      
      ,A.[GLCode]                       
   ,D.AccountHolderName                    
   ,D.AccountNumber                    
   ,D.RoutingNumber 
   ,A.[Email]
   ,E.Value1 AS 'StrVendorType',[Phone]
   FROM Tbl_Vendor AS A                      
   LEFT JOIN KeyList AS B                      
   ON A.PaymentTerm= B.KeyListID AND B.KeyID=5003                      
   LEFT JOIN KeyList AS C                      
   ON A.PrefferedPaymentMethod=C.KeyListID  AND C.KeyID=5020                      
   LEFT JOIN Tbl_VendorBankAccount AS D                    
   ON A.VendorID=D.VendorID 
   LEFT JOIN KeyList AS E
   ON A.VendorType=E.KeyListID AND E.KeyID=5019
  WHERE A.VendorID=@vendorID AND A.ClientID=@clientID                     
                      
SELECT 'VendorAmountDetails' AS TableName,                      
  (--(SELECT SUM(Balance) FROM Tbl_Bill WHERE VendorID=@vendorID AND Status=50015  AND ClientID=@clientID)+                   
  (SELECT SUM(PayableAmount) FROM Tbl_BillApproved  WHERE  PaymentStatus!=50044 AND VendorID=@vendorID )) AS 'BalanceAmount',                  
 ( SELECT Top(1)  ApprovedAmount FROM Tbl_BillApproved                       
  WHERE VendorID=@vendorID AND ClientId=@clientID AND  PaymentStatus=50044 Order by Paidon Desc) AS 'LastPayment' ,  
  (SELECT SUM(AmountPaid) FROM Tbl_BillApproved Where PaymentStatus=50044 AND VendorID=@vendorID)AS 'TotalPaidAmount'  
  

                      
Select DISTINCT (A.BillID), 'UserBills' As TableName,                      
      A.[BillID]                      
        ,A.[VendorID]                      
        ,A.[AccountID]                      
        ,A.[BillDate]                      
        ,A.[Amount]                      
        ,A.[InvoiceNumber]                      
        ,A.[DueDate]                      
        ,A.[Category]                      
        ,A.[Notes]                      
        ,A.[PaymentTerms]                      
        ,A.[Description]                      
        ,A.[IsSplitted]                      
        ,A.[Status]                      
        ,A.[CreatedOn]                      
     ,A.CreatedBy                      
  ,Case                
   WHEN A.Status=50019 Then 'Draft'                
   Else  'Approvals'                
   END AS 'StageName'                
     ,B.[Value1] AS StatusName,                      
     A.[IsRecurring],                      
     C.[VendorName]      
  ,E.Value1 AS 'PaymentMode'  
  ,A.IsSplitted
         from [dbo].[Tbl_Bill] AS A                      
     LEFT JOIN KeyList AS B                      
     ON A.Status=B.KeyListID AND B.KeyID=5005                      
     LEFT JOIN [dbo].[Tbl_Vendor] AS C                      
     ON A.VendorID=C.[VendorID]        
  LEFT JOIN Tbl_BillApproved AS D    
  ON D.BillID=A.BillID    
  LEFT JOIN KeyList AS E    
  ON D.PaymentMode=E.KeyListID AND E.KeyID=5021    
     WHERE A.VendorID=@vendorID AND A.ClientID=@clientId                      
                      
select 'PaymentBills' As TableName,                      
           A.[IdentityID],                      
           A.[BillID],      
           A.[ApprovedAmount],                      
           A.[Status],                      
           A.[PayableAmount],                      
           A.[DueOn],                      
           A.[PaidOn],                      
           A.[VendorID],                      
           A.[PaymentStatus],        
           B.Description,                      
           B.PurchaseOrder,                      
           B.InvoiceNumber,                      
           B.IsRecurring,                      
           C.VendorName,                      
           D.Value1 AS PaymentStatusName      
      ,E.Value1 AS 'PaymentMode'    
          from Tbl_BillApproved as A                      
          left join Tbl_Bill As B                      
          On A.BillID=B.BillID                      
          left join Tbl_Vendor As C                      
          On A.VendorID=C.VendorID                      
          left join KeyList AS D                      
  On A.PaymentStatus=D.KeyListID      
  LEFT JOIN Keylist AS E    
  ON A.PaymentMode=E.Keylistid AND E.Keyid=5021    
          where  B.ClientID=@clientId                      
          AND B.VendorID=@vendorID                      
                     
END       
      
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorListData]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetVendorListData]          
@clientID NUMERIC(18,0)          
AS          
BEGIN          
          
     SELECT  ( 'KPIDetails')  AS  [TableName],                
    --Peding Submission Bills          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND Status=50019) AS 'PendingSubmissionBills',          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  ClientID=@clientID AND Status=50019 AND           
     (CreatedOn >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CWeekPendingSubmissionCount',          
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND   Status=50019 AND           
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LWeekPendingSubmissionCount',          
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE ClientID=@clientID  AND Status=50019  ) AS 'PendingSubmissionAmount',          
          
     --Rejected  Bills          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND Status=50017) AS 'RejectedBills',          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  ClientID=@clientID AND Status=50017 AND           
     convert(date, CreatedOn) =Convert(date, getutcdate()) ) AS 'CWeekRejectedCount',          
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND   Status=50017 AND           
      convert(date, CreatedOn) =convert(date, dateadd(day,datediff(day,1,GETDATE()),0)) )  AS 'LWeekRejectedCount',          
     ( SELECT SUM(Amount) FROM Tbl_Bill WHERE ClientID=@clientID  AND Status=50017  ) AS 'RejectedAmount',          
          
    --UnApproved(Pending) Submission Bills          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND Status=50016) AS 'UnApprovedBills',          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE  ClientID=@clientID AND Status=50016 AND           
     (CreatedOn >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CWeekUnApprovedCount',          
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND   Status=50016 AND           
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LWeekUnApprovedCount',          
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE ClientID=@clientID  AND Status=50016  ) AS 'UnApprovedAmount',          
             
   --Total Bill Details          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID) AS 'TotalBillsCount',          
     (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND           
     (CreatedOn >= DATEADD(day, 1-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'CurrentWeekBillsClount',          
      (SELECT COUNT(BillID) FROM Tbl_Bill WHERE ClientID=@clientID AND           
     (CreatedOn >= DATEADD(day, -6-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))           
     AND CreatedOn< dateadd(day, 7-datepart(dw, GETUTCDATE()), CONVERT(date,GETUTCDATE()))) ) AS 'LastWeekBillsCount',          
    ( SELECT SUM(Amount) FROM Tbl_Bill WHERE ClientID=@clientID ) AS 'TotalAmount'          
          
          
      SELECT  'VendorDetails' AS TableName,          
      A.[VendorName],          
      (IsNull( A.[Address1],'') +' '+IsNull(  A.[Address2],'') )AS  'Address',          
      --  A.[Address2],          
      A.[Email],          
      Isnull(  (
      (SELECT SUM(PayableAmount) FROM Tbl_BillApproved
	  WHERE VendorID=A.VendorID AND Status != 50044 )),0) AS 'Balance',
     ISNULL(
	 ISNULL( Convert(varchar,(SELECT Top(1) PaidOn
	 FROM Tbl_BillApproved Where VendorId=A.VendorID 
	 Order by PaidOn desc),101),''),'' )AS 'PaidOn',          
     -- A.VendorID ,
	   B.VendorID 
      FROM [dbo].[Tbl_Vendor] AS A          
      LEFT JOIN [dbo].[Tbl_BillApproved] AS B          
      ON A.VendorID=B.VendorID          
      WHERE A.ClientID=@clientID  
	  
          
END          
          
             
          
           --  Select * from Tbl_BillApproved
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorNotes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_GetVendorNotes]    
@vendorID NUMERIC(18,0),    
@clientID NUMERIC(18,0)    
AS    
BEGIN    
  SELECT 'Notes' AS TableName,    
   A.[VendorNotesID]    
  ,A.[Notes]    
  ,A.[CreatedBy]    
  ,A.UpdatedOn  
  ,A.[CreatedOn]   
  ,B.FirstName
  ,B.LastName
  ,(COALESCE(B.FirstName,'')+' '+COALESCE(B.LastName,'')) AS Name    
  FROM [dbo].[Tbl_VendorNotes] AS A    
  LEFT JOIN Tbl_Accounts AS B    
  ON A.CreatedBy=B.AccountID    
  WHERE A.VendorID=@vendorID AND A.ClientID=@clientID    
       
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendors]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetVendors]      
@vendorName NVARCHAR(MAX),      
@clientID NUMERIC(18,0)      
AS       
BEGIN      
  SELECT 'ExactVendor' AS TableName, VendorName,[Address1],[Phone],VendorID ,[PaymentTerm],GLCode FROM Tbl_Vendor      
  WHERE VendorName=@vendorName AND ClientID=@clientID      
      
  SELECT 'LikelyVendors' AS TableName, VendorName,[Address1],[Phone],VendorID ,[PaymentTerm],GLCode FROM Tbl_Vendor      
  WHERE VendorName like '%'+@vendorName+'%' AND ClientID=@clientID      
    
  SELECT 'InvoiceNumbers' AS TableName,InvoiceNumber FROM Tbl_Bill Where ClientID=@clientID    
      
END      
      
GO
/****** Object:  StoredProcedure [dbo].[SP_GetWebhookEvent]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetWebhookEvent]
@EventId numeric(18,0)
AS
BEGIN
	select   A.[SubID]
			 , A.[key]
			 ,A.Value
			 ,B.[PayloadURL]
			 , B.[Secret]
			 from [dbo].[Tbl_Subcription_Header] As A
			 left join [dbo].[Tbl_Subcription] AS B
			 On
			 A.[SubID]=B.[SubID]
			 where B.[EventID] = @EventId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Insert_BillBreakage]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Insert_BillBreakage]      
@billId numeric(18,0),      
@amount numeric(18,2),      
@description nvarchar(max),      
@billType NVARCHAR(MAX),      
@status numeric(18,0),     
@glIdentityId numeric(18,0),  
@acconutId numeric(18,0)      
AS      
BEGIN      
 Insert into Tbl_BillBreakage      
 ([BillID],[Amount],[Description],[BillType],[Status],[CreatedOn],[CreatedBy],[IsActive],GLAccountID)      
 Values      
 (@billId,@amount,@description,@billType,@status,getutcdate(),@acconutId,1,@glIdentityId)      
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAdminClient]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertAdminClient]
@CompanyName NVARCHAR(MAX),
@ActivationKey NVARCHAR(MAX),
@CreatedBy NUMERIC(18,0),
@retVal NUMERIC(18,0)
AS
BEGIN
		INSERT [dbo].[Tbl_Client]
		([ClientName],ActivationKey,CreatedBy,CreatedOn)
		VALUES
		(@CompanyName,@ActivationKey,@CreatedBy,GETUTCDATE())
		SET @retVal=SCOPE_IDENTITY();
		REturn @retVal;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertApplicationRole]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertApplicationRole]  
@userRoleID NUMERIC(18,0),  
@roleName NVARCHAR(MAX),  
@description NVARCHAR(MAX),  
@status NUMERIC(18,0),  
@createdBy NUMERIC(18,0),  
@masterRoleID NUMERIC(18,0),  
@RetVal NUMERIC(18,0)  ,
@clientID NUMERIC(18,0)
  
AS  
BEGIN  
 DECLARE @isCreate  NUMERIC(18,0)  
 SET @isCreate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleID AND EntityActionID=3009)  
 IF(@isCreate IS NOT NULL)  
 BEGIN  
   UPDATE MasterRole Set IsAdded=1 WHERE MasterRoleID=@masterRoleID  
   INSERT INTO ApplicationRole  
   ([RoleName],[Description],[Status],[CreatedBy],[CreatedOn],[MasterRoleID],ClientID)  
   VALUES  
   (@roleName,@description,@status,@createdBy,GETUTCDATE(),@masterRoleID,@clientID)  
   set @RetVal=SCOPE_IDENTITY()    
   return @RetVal;  
 END  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertApplicationRoleActions]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertApplicationRoleActions]
@userRoleID NUMERIC(18,0),
@entityActionID NUMERIC(18,0),
@roleID NUMERIC(18,0),
@createdBy NUMERIC(18,0)
AS
BEGIN
--DECLARE @isCreate  NUMERIC(18,0)
--	SET @isCreate=(SELECT ApplicationRoleEntityID FROM [dbo].[ApplicationRoleEntity] WHERE RoleID=@userRoleID AND EntityActionID=3009)
--	IF(@isCreate IS NOT NULL)
--	BEGIN
			INSERT INTO [dbo].[ApplicationRoleEntity]
			([EntityActionID],[RoleID],[CreatedBy],[CreatedOn])
			VALUES
			(@entityActionID,@roleID,@createdBy,GETUTCDATE())
			
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertApprovers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertApprovers]
@billId NUMERIC(18,0),
@approverID NUMERIC(18,0),
@sequence NUMERIC(18,0),
@stageInitiated NUMERIC(18,0),
@currentStageApproval NUMERIC(18,0),
@accountID NUMERIC(18,0)
AS
BEGIN
			INSERT INTO BillStageApproval 
			(BillID,ApproverID,[Sequence],StageInitiated,CurrentStageApproval,CreatedBy,CreatedOn)
			VALUES
			(@billId,@approverID,@sequence,@stageInitiated,@currentStageApproval,@accountID,GETUTCDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertARInvoiceList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertARInvoiceList]                    
(@tbl_ARInvoiceList AS TVP_InvoiceARInsert readonly)                    
AS                    
BEGIN                    
                    
MERGE INTO [dbo].[Tbl_OrderInvoice] AS S1                    
USING @tbl_ARInvoiceList AS S2                    
ON  S1.InvID= S2.invoiceid AND S1.ClientId=S2.ClientID               
WHEN MATCHED THEN UPDATE SET                     
S1.Amount=S2.amount,S1.Discount=S2.discount,S1.Product=S2.product,S1.quantity=S2.quantity,S1.Price=S2.price,S1.Tax=S2.tax,S1.Discounttype=S2.discounttype               
WHEN NOT MATCHED                     
THEN INSERT                     
(InvID,Amount,Discount,Product,quantity,Price,Tax,Discounttype,ClientId)                    
VALUES                    
(S2.invoiceid,S2.amount,S2.discount,S2.product,S2.quantity,S2.price,S2.tax,S2.discounttype,S2.ClientID);                             
END    
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertARInvoices]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertARInvoices]
	@createdBy numeric(18,0),@clientID numeric(18,0),
	@customer numeric(18,0),@paymentterms nvarchar(max),@invoice nvarchar(500),
	@invoicedate nvarchar(max),@duedate nvarchar(max),@referanceorder nvarchar(max),@paymenttype numeric(18,0)
	,@retVal NUMERIC(18,0),@Subtotal numeric(18,2),@Discount numeric(18,2),@Shipping numeric(18,2),@Tax numeric(18,2),
	@Total numeric(18,2),@Distype nvarchar(max),@isrecurring int,@recurringstartdate nvarchar(50),@recurringenddate nvarchar(50),
	@frequency nvarchar(100)

AS
BEGIN
DECLARE @action NVARCHAR(200),@invoiceid NUMERIC(18,0),@accountid NUMERIC(18,0)

	INSERT INTO tbl_Invoice (InvoiceName,Customerid,CreatedBy,ClientId,TermCode,Referanceorder,
	Paymenttype,Invoicedate,Duedate,CreatedOn,Subtotal,Discount,ShippingCharge,Tax,TotamAmount,DiscountType,
	IsRecurring,RecurringStartDate,RecurrinEendtDate,Frequency)

	values(@invoice,@customer,@createdBy,@clientID,@paymentterms,@referanceorder,
	@paymenttype,@invoicedate,@duedate,GETUTCDATE(),@Subtotal,@Discount,@Shipping,@Tax,@Total,@Distype,
	@isrecurring,@recurringstartdate,@recurringenddate,@frequency)

 set @retVal=SCOPE_IDENTITY()   

 EXEC SP_InsertTimeLine @action='Invoice Created',@invoiceid=@retVal,@accountid=@createdBy

 RETURN @retVal 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAuditLog]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertAuditLog]
	@activity NVARCHAR(MAX),@description NVARCHAR(MAX),@screenname NVARCHAR(MAX),
	@userid NUMERIC(18,0),@systemip NVARCHAR(MAX),@clientID NUMERIC(18,0)
AS
BEGIN
	INSERT INTO Tbl_AuditLog ([TimeStamp],Activity,[Description],ScreenName,UserId,SystemIp,ClientId)
	VALUES(GETUTCDATE(),@activity,@description,@screenname,@userid,@systemip,@clientID)

	END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBill]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBill]  
@vendorName nvarchar(max),  
@billDate datetime,  
@amount numeric(18,2),  
@invoiceNumber  nvarchar(max),  
@dueDate datetime,  
@category numeric(18,0),  
@notes nvarchar(max),  
@paymentTerms numeric(18,0),  
@description nvarchar(max),  
@isSplited nvarchar(max),  
@status numeric(18,0),  
@accountId numeric(18,0),  
@clientId numeric(18,0),  
@fileSize numeric(18,0),  
@fileDiaplayName nvarchar(max),  
@PhysicalLocation nvarchar(max),  
@fileName nvarchar(max),  
@balance numeric(18,2),  
@purchaseOreder nvarchar(max),
@customer NUMERIC(18,0),
@project NUMERIC(18,0),
@RetVal numeric(18,0)  
  
AS  
Begin  
Declare @VENDORID as numeric(18,0)=0;  
Declare @VENDOR_NAME as nvarchar(max)  
  If exists(select lower([VendorName]) from [dbo].[Tbl_Vendor] where VendorName=lower(@vendorName))  
  begin  
   set @VENDORID=(select [VendorID] from [dbo].[Tbl_Vendor] where VendorName=@vendorName)  
  end  
  else  
  begin  
   Insert into [dbo].[Tbl_Vendor] ([VendorName],[CreatedOn],[CreatedBy],[ClientID])  
   Values  
   (@vendorName,getutcdate(),@accountId,@clientId)  
   set @VENDORID =(Select MAX([VendorID])  from [Tbl_Vendor])  
  end  
  if(@VENDORID!=0)  
  begin  
  Insert into [dbo].[Tbl_Bill]([VendorID],  
     [AccountID],  
     [BillDate],  
     [Amount],  
     [InvoiceNumber],  
     [DueDate],  
     [Category],  
     [Notes],  
     [PaymentTerms],  
     [Description],  
     [IsSplitted],  
     [Status],  
     [CreatedOn],  
     [CreatedBy],  
     [IsActive],  
     [ClientID],[FileDisplayName],[PhysicalLocation],[FileSize],[FileName],[Balance],[PurchaseOrder],
	 Customer,Project)  
       
     values  
     (@VENDORID,  
     @accountId,  
     @billDate,  
     @amount,  
     @invoiceNumber,  
     @dueDate,  
     @category,  
     @notes,  
     @paymentTerms,  
     @description,  
     @isSplited,  
     @status,  
     getutcdate(),  
     @accountId,  
     1,  
     @clientId,@fileDiaplayName,@PhysicalLocation,@fileSize,@fileName,@balance,@purchaseOreder,@customer,@project)  
   set @RetVal=SCOPE_IDENTITY()    
   return @RetVal;  
  end  
End  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBillCommandList]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBillCommandList]
	@BillID INT,@BillCommant NVARCHAR(MAX),@AccountId INT,@Action NVARCHAR(20),@Status NVARCHAR(20)
	,@RowID INT
AS
BEGIN
IF @Action='Send'
BEGIN
	INSERT INTO tbl_BillListComments(BillID,Commant,CreatedOn,CreatedBy)
	VALUES(@BillID,@BillCommant,GETUTCDATE(),@AccountId)
END
ELSE
BEGIN
IF(@Status='BillList')
	BEGIN
			UPDATE tbl_BillListComments SET Commant=@BillCommant,Updatedon=GETUTCDATE(),UpdatedBy=@AccountId
			WHERE BillCommentID=@RowID
	END
ELSE IF(@Status='Disputed')
	BEGIN
			UPDATE Tbl_BillDisputedHistory SET Comment=@BillCommant,UpdatedOn=GETUTCDATE(),UpdatedBy=@AccountId
			WHERE IdentityID=@RowID
	END
ELSE IF(@Status='Approved' OR @Status='Rejected')
	BEGIN
			UPDATE TBl_Approvehistory SET ApproverComment=@BillCommant,UpdatedOn=GETUTCDATE(),UpdatedBy=@AccountId
			WHERE ApproveHistoryID=@RowID
	END

END
END


--select * from tbl_BillListComments

--TRUNCATE TABLE tbl_BillListComments
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBillComments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBillComments]
@billId NUMERIC(18,0),
@comment NVARCHAR(MAX),
@commentOn NVARCHAR(MAX),
@commentBy NUMERIC(18,0)
AS
BEGIN
		INSERT INTO [dbo].[Tbl_BillComments]
		([BillID],[Comment],[CommentBy],[CommentOn],[CreatedOn],[CreatedBy])
		VALUES
		(@billId,@comment,@commentBy,@commentOn,GETUTCDATE(),@commentBy)
		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBillDescription]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBillDescription]
@accountId NUMERIC(18,0),
@billID NUMERIC(18,0),
@rate NUMERIC(18,2),
@quantity NUMERIC(18,0),
@total NUMERIC(18,2),
@description NVARCHAR(MAX)
AS
BEGIN
		INSERT INTO Tbl_BillDescription
		([BillID],[Rate],[Quantity],[Total],[Description],[CreatedOn],[CreatedBy])
		VALUES
		(@billID,@rate,@quantity,@total,@description,GETUTCDATE(),@accountId)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBillDocuments]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBillDocuments]
@billId NUMERIC(18,0),
@fileDisplayName NVARCHAR(MAX),
@physicalFileName NVARCHAR(MAX),
@fileSize NVARCHAR(MAX),
@filePhysicalPath NVARCHAR(MAX),
@extension NVARCHAR(MAX),
@createdBy NUMERIC(18,0),
@isBillFile NUMERIC(18,0)
AS
BEGIN
			INSERT INTO Tbl_BillAttachments
			([BillID],[FileName],[PhysicalFileName],[Size],[PhysicalPath],[Extension],[CreatedOn],[CreatedBy],[IsBillFile])
			VALUES
			(@billId,@fileDisplayName,@physicalFileName,@fileSize,@filePhysicalPath,@extension,GETUTCDATE(),@createdBy,@isBillFile)
		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBLCodes]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
            
CREATE PROCEDURE [dbo].[SP_InsertBLCodes]                  
(@tbl_GlCodes AS TVP_GlCodes readonly,@accountID NUMERIC(18,0))                  
AS                  
BEGIN                  
                  
MERGE INTO [dbo].[Tbl_GlCodes] AS S1                  
USING @tbl_GlCodes AS S2                  
ON S1.ClientID=S2.ClientID AND S1.GLNumber= S2.GLNumber                  
WHEN MATCHED THEN UPDATE SET                   
S1.GLDescription=S2.GLDescription                  
WHEN NOT MATCHED                   
THEN INSERT                   
(ClientID,GLNumber,GLDescription,RowStatus,CreatedBy,CreatedOn)                  
VALUES                  
(S2.ClientID,S2.GLNumber,S2.GLDescription,'A',S2.CreatedBy,CONVERT(nvarchar(MAX), GETUTCDATE(), 101));        
  
declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' GL Codes are Posted'    
 declare @status varchar(150) = 'Sync Completed'    
 insert into tbl_DenaliSync    
 (syncdate,syncby,syncsts,syncDesc)    
 values    
 (getutcdate(),@accountID,@status,@Description)   
                  
END               
      
      
                  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBulkCustomers]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBulkCustomers]                            
  
(@tbl_Customer AS TVP_Customers readonly,            
  
@accountID NUMERIC(18,0)            
  
)            
  
AS                            
  
BEGIN                            
     
  
 MERGE INTO tbl_customers AS S1    
  
using @tbl_Customer AS S2    
  
ON ( ( s2.externalnumber != ''    
       AND S1.externalnumber = s2.externalnumber )    
       OR S1.customerid = s2.customerid    
       OR ( s2.externalnewreferencenumber != ''    
       AND (S1.externalnumber = s2.externalnewreferencenumber    
        OR S1.externalnewreferencenumber = s2.externalnewreferencenumber ) ) )    
       AND S1.clientid = s2.clientid    
  
WHEN matched THEN    
  
  UPDATE SET S1.customername  = S2.customername,  
S1.cutomertype = S2.cutomertype,  
S1.email = S2.email,  
S1.contactnumber = S2.contactnumber,   
S1.customeraddress = S2.customeraddress,   
S1.city = S2.city,  
S1.[state]= S2.state,  
S1.zip = S2.zip,  
S1.customerlogo = S2.customerlogo,  
S1.paymentterms = S2.paymentterms,  
S1.paymentmethod = S2.paymentmethod,   
S1.shippingaddress = S2.shippingaddress,  
S1.billingaddress = S2.billingaddress,  
S1.accountholdername = S2.accountholdername,   
S1.accountnumber = S2.accountNumber,   
S1.routingnumber = S2.routingnumber,   
S1.externalnumber = CASE  WHEN S2.externalnewreferencenumber != ''   
                    THEN S2.externalnewreferencenumber    
                    ELSE S2.externalnumber END,    
S1.updatedby = S2.createdby,    
S1.updatedon = Getutcdate(),    
S1.externalnewreferencenumber = S2.externalnewreferencenumber,    
S1.pushtodenali = 0    
WHEN NOT matched THEN    
  
  INSERT (   
   customername ,  
  cutomertype,  
email,  
contactnumber,   
customeraddress,   
city,  
state,   
zip,   
customerlogo,  
clientid,   
paymentterms,   
paymentmethod,   
shippingaddress,   
billingaddress,  
accountholdername,   
accountnumber,   
routingnumber,   
externalnumber,    
createdby,    
createdon,    
externalnewreferencenumber)    
VALUES   
(S2.customername,  
 S2.cutomertype,  
S2.email,  
S2.contactnumber,   
S2.customeraddress,   
S2.city,  
S2.state,   
S2.zip,   
S2.customerlogo,  
S2.clientid,   
S2.paymentterms,   
S2.paymentmethod,   
S2.shippingaddress,   
S2.billingaddress,  
S2.accountholdername,   
S2.accountnumber,   
S2.routingnumber,     
S2.externalnumber,    
S2.createdby,   
Getutcdate(),    
S2.externalnewreferencenumber );     
              
  
declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Customers are Posted'              
  
declare @status varchar(150) = 'Sync Compelted'              
  
 insert into tbl_DenaliSync              
  
 (syncdate,syncby,syncsts,syncDesc)              
  
 values              
  
 (getutcdate(),@accountID,@status,@Description) 

END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBulkOrderproduct]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[SP_InsertBulkOrderproduct]                            
  
(@tbl_orderproduct AS TVP_Orderproduct readonly,            
  
@accountID NUMERIC(18,0)            
  
)            
  
AS                            
  
BEGIN                            
     
  
 MERGE INTO Tbl_OrderProduct AS S1    
  
using @tbl_orderproduct AS S2    
  
ON S1.clientid = s2.clientid    
  
WHEN matched THEN    
  
  UPDATE SET
S1.Baseamount = S2.Baseamount, 
S1.Transactioncurrencyid = S2.Transactioncurrencyid,	
S1.Exchangerate = S2.Exchangerate, 
S1.Baseamountbase = S2.Baseamountbase, 
S1.Description = S2.Description,	
S1.Extendedamount = S2.Extendedamount, 
S1.Extendedamountbase = S2.Extendedamountbase, 
S1.Iscopied = S2.Iscopied,	
S1.Ispriceoverridden = S2.Ispriceoverridden,	
S1.Isproductoverridden = S2.Isproductoverridden,	
S1.Lineitemnumber = S2.Lineitemnumber,	
S1.Manualdiscountamount = S2.Manualdiscountamount, 
S1.Manualdiscountamountbase = S2.Manualdiscountamountbase, 
S1.Parentbundleid = S2.Parentbundleid, 
S1.Productassociationid = S2.Productassociationid, 
S1.Producttypecode = S2.Producttypecode,	
S1.Priceperunit = S2.Priceperunit,	
S1.Priceperunitbase = S2.Priceperunitbase,	
S1.Pricingerrorcode = S2.Pricingerrorcode,	
S1.Productdescription = S2.Productdescription,	
S1.Productname = S2.Productname,	
S1.Productid = S2.Productid, 
S1.Quantity = S2.Quantity, 
S1.Quantitybackordered = S2.Quantitybackordered, 
S1.Quantitycancelled = S2.Quantitycancelled, 
S1.Quantityshipped = S2.Quantityshipped, 
S1.Requestdeliveryby = S2.Requestdeliveryby,	
S1.Orderid = S2.Orderid, 
S1.Salesorderispricelocked = S2.Salesorderispricelocked,	
S1.Salesorderstatecode = S2.Salesorderstatecode,	
S1.Salesrepid = S2.Salesrepid, 
S1.Shiptoaddressid = S2.Shiptoaddressid,	
S1.Tax = S2.Tax, 
S1.Taxbase = S2.Taxbase, 
S1.Uomid = S2.Uomid, 
S1.Volumediscountamount = S2.Volumediscountamount, 
S1.Volumediscountamountbase = S2.Volumediscountamountbase, 
S1.Willcall = S2.Willcall,	
S1.Sequencenumber = S2.Sequencenumber,	
S1.Quotedetailid = S2.Quotedetailid,	
S1.Salesorderdetailname = S2.Salesorderdetailname,	   
S1.updatedby = S2.createdby,    
S1.updatedon = Getutcdate() 
WHEN NOT matched THEN    
  
  INSERT (
Baseamount, 
Transactioncurrencyid,	
Exchangerate, 
Baseamountbase, 
Description,	
Extendedamount, 
Extendedamountbase, 
Iscopied,	
Ispriceoverridden,	
Isproductoverridden,	
Lineitemnumber,	
Manualdiscountamount, 
Manualdiscountamountbase, 
Parentbundleid, 
Productassociationid, 
Producttypecode,	
Priceperunit,	
Priceperunitbase,	
Pricingerrorcode,	
Productdescription,	
Productname,	
Productid, 
Quantity, 
Quantitybackordered, 
Quantitycancelled, 
Quantityshipped, 
Requestdeliveryby,	
Orderid, 
Salesorderispricelocked,	
Salesorderstatecode,	
Salesrepid, 
Shiptoaddressid,	
Tax, 
Taxbase, 
Uomid, 
Volumediscountamount, 
Volumediscountamountbase, 
Willcall,	
Sequencenumber,	
Quotedetailid,	
Salesorderdetailname,	
ClientID, 
CreatedOn,
CreatedBy)    
VALUES   
(
S2.Baseamount, 
S2.Transactioncurrencyid,	
S2.Exchangerate, 
S2.Baseamountbase, 
S2.Description,	
S2.Extendedamount, 
S2.Extendedamountbase, 
S2.Iscopied,	
S2.Ispriceoverridden,	
S2.Isproductoverridden,	
S2.Lineitemnumber,	
S2.Manualdiscountamount, 
S2.Manualdiscountamountbase, 
S2.Parentbundleid, 
S2.Productassociationid, 
S2.Producttypecode,	
S2.Priceperunit,	
S2.Priceperunitbase,	
S2.Pricingerrorcode,	
S2.Productdescription,	
S2.Productname,	
S2.Productid, 
S2.Quantity, 
S2.Quantitybackordered, 
S2.Quantitycancelled, 
S2.Quantityshipped, 
S2.Requestdeliveryby,	
S2.Orderid, 
S2.Salesorderispricelocked,	
S2.Salesorderstatecode,	
S2.Salesrepid, 
S2.Shiptoaddressid,	
S2.Tax, 
S2.Taxbase, 
S2.Uomid, 
S2.Volumediscountamount, 
S2.Volumediscountamountbase, 
S2.Willcall,	
S2.Sequencenumber,	
S2.Quotedetailid,	
S2.Salesorderdetailname,	
S2.ClientID,    
S2.createdby,   
Getutcdate());     
              
  
declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Orderproduct are Posted'              
  
declare @status varchar(150) = 'Sync Compelted'              
  
 insert into tbl_DenaliSync              
  
 (syncdate,syncby,syncsts,syncDesc)              
  
 values              
  
 (getutcdate(),@accountID,@status,@Description) 

END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBulkProduct]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertBulkProduct]                            
  
(@tbl_product AS TVP_Products readonly,            
  
@accountID NUMERIC(18,0)            
)            
  
AS                            
  
BEGIN                            
     
  
 MERGE INTO Tbl_Product AS S1    
  
using @tbl_product AS S2    
  
ON ( ( s2.externalnumber != ''    
       AND S1.externalnumber = s2.externalnumber )    
       OR S1.ProductID = s2.ProductID    
       OR ( s2.externalnewreferencenumber != ''    
       AND (S1.externalnumber = s2.externalnewreferencenumber    
        OR S1.externalnewreferencenumber = s2.externalnewreferencenumber ) ) )    
       AND S1.clientid = s2.clientid    
  
WHEN matched THEN    
  
  UPDATE SET S1.ProductName = S2.ProductName,  
S1.Vendorid =CASE WHEN S2.Vendorid = ''   THEN 0 
                ELSE CAST (S2.Vendorid AS NUMERIC(10,2))  END,  
S1.Validfromdate = S2.Validfromdate,  
S1.Validtodate = S2.Validtodate,  
S1.Currentcost = S2.Currentcost,  
S1.Transactioncurrencyid = S2.Transactioncurrencyid,  
S1.Exchangerate = CASE WHEN S2.Exchangerate = ''   THEN 0 
                ELSE CAST (S2.Exchangerate AS NUMERIC(10,2)) END,  
S1.Currentcostbase = S2.Currentcostbase,  
S1.Defaultuomid = CASE WHEN S2.Defaultuomid = ''   THEN 0 
                ELSE CAST (S2.Defaultuomid AS NUMERIC(10,2)) END,  
S1.Defaultuomscheduleid = CASE WHEN S2.Defaultuomscheduleid = ''   THEN 0 
                ELSE CAST (S2.Defaultuomscheduleid AS NUMERIC(10,2)) END, 
S1.Description = S2.Description,  
S1.Iskit = S2.Iskit,  
S1.Isstockitem = S2.Isstockitem,  
S1.Parentproductid = CASE WHEN S2.Parentproductid = ''   THEN 0 
                ELSE CAST (S2.Parentproductid AS NUMERIC(10,2)) END,  
S1.Price = CASE WHEN S2.Price = ''   THEN 0 
                ELSE CAST (S2.Price AS NUMERIC(10,2)) END, 
S1.Pricebase = CASE WHEN S2.Pricebase = ''   THEN 0 
                ELSE CAST (S2.Pricebase AS NUMERIC(10,2)) END,  
S1.Productstructure = S2.Productstructure,  
S1.ProductstructureDisplay = S2.ProductstructureDisplay,  
S1.Productnumber = S2.Productnumber,  
S1.Producttypecode = S2.Producttypecode,  
S1.ProducttypecodeDisplay = S2.ProducttypecodeDisplay,  
S1.Producturl = S2.Producturl,  
S1.Quantitydecimal = S2.Quantitydecimal,  
S1.Quantityonhand = S2.Quantityonhand,  
S1.Size = S2.Size,  
S1.Standardcost = CASE WHEN S2.Standardcost = ''   THEN 0 
                ELSE CAST (S2.Standardcost AS NUMERIC(10,2)) END,  
S1.Standardcostbase = CASE WHEN S2.Standardcostbase = ''   THEN 0 
                ELSE CAST (S2.Standardcostbase AS NUMERIC(10,2)) END,  
S1.Statecode = S2.Statecode,  
S1.Statuscode = S2.Statuscode,  
S1.Stockvolume = S2.Stockvolume,  
S1.Stockweight = CASE WHEN S2.Stockweight = ''   THEN 0 
                ELSE CAST (S2.Stockweight AS NUMERIC(10,2)) END,  
S1.Suppliername = S2.Suppliername,  
S1.Vendorpartnumber = S2.Vendorpartnumber,  
S1.Hierarchypath = S2.Hierarchypath,  
S1.Pricelistid = CASE WHEN S2.Pricelistid = ''   THEN 0 
                ELSE CAST (S2.Pricelistid AS NUMERIC(10,2)) END,  
S1.SKUCode = S2.SKUCode,  
S1.ProductCategory = S2.ProductCategory,  
S1.ProductSubcategory = S2.ProductSubcategory,  
S1.UnitPrice = CASE WHEN S2.UnitPrice = ''   THEN 0 
                ELSE CAST (S2.UnitPrice AS NUMERIC(10,2)) END,  
S1.WholesaleCost = CASE WHEN S2.WholesaleCost = ''   THEN 0 
                ELSE CAST (S2.WholesaleCost AS NUMERIC(10,2)) END,  
S1.PurchaseCost = CASE WHEN S2.PurchaseCost = ''   THEN 0 
                ELSE CAST (S2.PurchaseCost AS NUMERIC(10,2)) END,  
S1.ProfitMargin = CASE WHEN S2.ProfitMargin = ''   THEN 0 
                ELSE CAST (S2.ProfitMargin AS NUMERIC(10,2)) END,  
S1.externalnumber = CASE  WHEN S2.externalnewreferencenumber != ''   
                    THEN S2.externalnewreferencenumber    
                    ELSE S2.externalnumber END,    
S1.updatedby = S2.createdby,    
S1.updatedon = Getutcdate(),    
S1.externalnewreferencenumber = S2.externalnewreferencenumber,    
S1.pushtodenali = 0    
WHEN NOT matched THEN    
  
  INSERT (   
   ProductName,  
Vendorid,  
Validfromdate,  
Validtodate,  
Currentcost,  
Transactioncurrencyid,  
Exchangerate,  
Currentcostbase,  
Defaultuomid,  
Defaultuomscheduleid,  
[Description],  
Iskit,  
Isstockitem,  
Parentproductid,  
Price,  
Pricebase,  
Productstructure,  
ProductstructureDisplay,  
Productnumber,  
Producttypecode,  
ProducttypecodeDisplay,  
Producturl,  
Quantitydecimal,  
Quantityonhand,  
Size,  
Standardcost,  
Standardcostbase,  
Statecode,  
Statuscode,  
Stockvolume,  
Stockweight,  
Suppliername,  
Vendorpartnumber,  
Hierarchypath,  
Pricelistid,  
SKUCode,  
ProductCategory,  
ProductSubcategory,  
UOM,  
UnitPrice,  
WholesaleCost,  
PurchaseCost,  
ProfitMargin,  
externalnumber,    
createdby,    
createdon,    
externalnewreferencenumber)    
VALUES   
(S2.ProductName,  
CASE WHEN S2.Vendorid = '' THEN 0 ELSE CAST (S2.Vendorid AS NUMERIC(10,2))  END,  
S2.Validfromdate,  
S2.Validtodate,  
S2.Currentcost,  
S2.Transactioncurrencyid,  
CASE WHEN S2.Exchangerate = '' THEN 0  ELSE CAST (S2.Exchangerate AS NUMERIC(10,2)) END,  
S2.Currentcostbase,  
CASE WHEN S2.Defaultuomid = '' THEN 0 ELSE CAST (S2.Defaultuomid AS NUMERIC(10,2)) END,  
CASE WHEN S2.Defaultuomscheduleid = '' THEN 0 ELSE CAST (S2.Defaultuomscheduleid AS NUMERIC(10,2)) END, 
S2.Description,  
S2.Iskit,  
S2.Isstockitem,  
CASE WHEN S2.Parentproductid = '' THEN 0 ELSE CAST (S2.Parentproductid AS NUMERIC(10,2)) END,  
CASE WHEN S2.Price = '' THEN 0 ELSE CAST (S2.Price AS NUMERIC(10,2)) END, 
CASE WHEN S2.Pricebase = '' THEN 0 ELSE CAST (S2.Pricebase AS NUMERIC(10,2)) END,  
S2.Productstructure,  
S2.ProductstructureDisplay,  
S2.Productnumber,  
S2.Producttypecode,  
S2.ProducttypecodeDisplay,  
S2.Producturl,  
S2.Quantitydecimal,  
S2.Quantityonhand,  
S2.Size,  
CASE WHEN S2.Standardcost = ''THEN 0 ELSE CAST (S2.Standardcost AS NUMERIC(10,2)) END,  
CASE WHEN S2.Standardcostbase = '' THEN 0 ELSE CAST (S2.Standardcostbase AS NUMERIC(10,2)) END,  
S2.Statecode,  
S2.Statuscode,  
S2.Stockvolume,  
CASE WHEN S2.Stockweight = '' THEN 0 ELSE CAST (S2.Stockweight AS NUMERIC(10,2)) END,  
S2.Suppliername,  
S2.Vendorpartnumber,  
S2.Hierarchypath,  
CASE WHEN S2.Pricelistid = '' THEN 0 ELSE CAST (S2.Pricelistid AS NUMERIC(10,2)) END,  
S2.SKUCode,  
S2.ProductCategory,  
S2.ProductSubcategory, 
S2.UOM,
CASE WHEN S2.UnitPrice = '' THEN 0  ELSE CAST (S2.UnitPrice AS NUMERIC(10,2)) END,  
CASE WHEN S2.WholesaleCost = '' THEN 0 ELSE CAST (S2.WholesaleCost AS NUMERIC(10,2)) END,  
CASE WHEN S2.PurchaseCost = '' THEN 0 ELSE CAST (S2.PurchaseCost AS NUMERIC(10,2)) END,  
CASE WHEN S2.ProfitMargin = '' THEN 0 ELSE CAST (S2.ProfitMargin AS NUMERIC(10,2)) END,      
S2.externalnumber,    
S2.createdby,   
Getutcdate(),    
S2.externalnewreferencenumber );     
              
  
declare @Description varchar(150)= convert(varchar(10),@@rowcount) + 'Products are Posted'              
  
declare @status varchar(150) = 'Sync Compelted'              
  
 insert into tbl_DenaliSync              
  
 (syncdate,syncby,syncsts,syncDesc)              
  
 values              
  
 (getutcdate(),@accountID,@status,@Description)    
  
--print 'X'
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertBulkVendors]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertBulkVendors]                          
(@tbl_Vendors AS TVP_Vendors readonly,          
@accountID NUMERIC(18,0)          
)          
AS                          
BEGIN                          
  
   
--   
 MERGE INTO tbl_vendor AS S1  
using @tbl_Vendors AS S2  
ON ( ( s2.externalnumber != ''  
       AND S1.externalnumber = s2.externalnumber )  
      OR S1.vendorid = s2.vendorid  
      OR ( s2.externalnewreferencenumber != ''  
           AND ( S1.externalnumber = s2.externalnewreferencenumber  
                  OR  
         S1.externalnewreferencenumber = s2.externalnewreferencenumber ) ) )  
   AND S1.clientid = s2.clientid  
WHEN matched THEN  
  UPDATE SET S1.vendorname = S2.vendorname,  
             S1.vendortype = S2.vendortype,  
             S1.email = S2.primaryemail,  
             S1.address1 = S2.vendoraddress,  
             S1.city = S2.city,  
             S1.[state] = S2.state,  
             S1.postalcode = S2.zip,  
             S1.phone = S2.contactnumber,  
             S1.prefferedpaymentmethod = S2.preferredpaymentmethod,  
             S1.taxid = S2.taxid,  
             S1.paymentterm = S2.paymentterms,  
             S1.[leadtimedays] = S2.leadtime,  
             S1.[glcode] = (select identityid from tbl_glcodes where glnumber =  S2.glaccount and clientid =  s2.clientid),   
             S1.externalnumber = CASE  
                                   WHEN S2.externalnewreferencenumber != '' THEN  
                                   S2.externalnewreferencenumber  
                                   ELSE S2.externalnumber  
                                 END,  
             S1.updatedby = S2.createdby,  
             S1.updatedon = Getutcdate(),  
             S1.externalnewreferencenumber = S2.externalnewreferencenumber,  
             S1.pushtodenali = 0  
WHEN NOT matched THEN  
  INSERT (vendorname,  
          vendortype,  
          email,  
          address1,  
          city,  
          [state],  
          postalcode,  
          phone,  
          prefferedpaymentmethod,  
          taxid,  
          paymentterm,  
          [leadtimedays],  
          clientid,  
          [glcode],  
          externalnumber,  
          createdby,  
          createdon,  
          externalnewreferencenumber)  
  VALUES (S2.vendorname,  
          S2.vendortype,  
          S2.primaryemail,  
          S2.vendoraddress,  
          S2.city,  
          S2.state,  
          S2.zip,  
          S2.contactnumber,  
          S2.preferredpaymentmethod,  
          S2.taxid,  
          S2.paymentterms,  
          S2.leadtime,  
          S2.clientid,  
          (select identityid from tbl_glcodes where glnumber =  S2.glaccount and clientid =  s2.clientid),--S2.glaccount,  
          S2.externalnumber,  
          S2.createdby,  
          Getutcdate(),  
          S2.externalnewreferencenumber );   
    
    
  ---                  
--  MERGE INTO Tbl_Vendor AS S3                          
-- USING @tbl_Vendors AS S4                          
-- ON ( (S4.ExternalNumber !='' AND S3.ExternalNumber=S4.ExternalNumber) OR S3.VendorID=S4.VendorId) AND S3.ClientID=S4.ClientID   AND  S4.ExternalNewReferenceNumber!=''                    
-- WHEN MATCHED THEN UPDATE                      
-- SET               
--S3.VendorName=S4.VendorName,                       
--S3.VendorType=S4.VendorType,                      
--S3.Email=S4.PrimaryEmail,                       
--S3.Address1=S4.VendorAddress,                      
--S3.City=S4.City,                      
--S3.[State]=S4.State,                      
--S3.PostalCode=S4.Zip,                      
--S3.Phone=S4.ContactNumber,                                    
--S3.PrefferedPaymentMethod=S4.PreferredPaymentMethod,                      
--S3.TaxId=S4.TaxID,                      
--S3.PaymentTerm=S4.PaymentTerms,                      
--S3.[LeadTimeDays]=S4.LeadTime,                      
--S3.[GLCode]=S4.GlAccount,                      
--S3.ExternalNumber=S4.ExternalNewReferenceNumber,                              
--S3.UpdatedBy=S4.CreatedBy,                      
--S3.UpdatedOn=GETUTCDATE(),                      
--S3.ExternalNewReferenceNumber=S4.ExternalNewReferenceNumber,                    
--S3.PushToDenali=0;                    
                     
            
   declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Vendors are Posted'            
 declare @status varchar(150) = 'Sync Compelted'            
 insert into tbl_DenaliSync            
 (syncdate,syncby,syncsts,syncDesc)            
 values            
 (getutcdate(),@accountID,@status,@Description)            
            
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCard]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_InsertCard]    
@cardName Nvarchar(MAX),    
@cardNumber Nvarchar(MAX),    
@expMonth  Nvarchar(MAX),    
@expYear  Nvarchar(MAX),   
@ccvNumber Nvarchar(MAX),    
@bankName Nvarchar(MAX),    
@isDefault NUMERIC(18,0),    
@userID NUMERIC(18,0),    
@customerID NUMERIC(18,0),    
@referenceID Nvarchar(MAX),  
@retVal NUMERIC(18,0)  
AS    
BEGIN    
    IF(@isDefault=1)    
   BEGIN    
   UPDATE Tbl_ClientCards SET IsDefault=0    
   END    
   INSERT INTO Tbl_ClientCards    
   ([CardName],[CardNumber],[ExpiryMonth],[ExpiryYear],[CCV],[IsDefault],[ReferenceID],[CustomerID]    
      ,[BankName],IsActive,CreatedBy,CreatedOn) VALUES    
   (@cardName,@cardNumber,@expMonth,@expYear,@ccvNumber,@isDefault,@referenceID,@customerID,@bankName,1,@userID,GETUTCDATE())    
   set @retVal=SCOPE_IDENTITY()                          
   return @retVal;  
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCategory]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
              
CREATE PROCEDURE [dbo].[SP_InsertCategory]                    
(@tbl_Category AS TVP_Categorylist readonly)                    
AS                    
BEGIN                    
                    
MERGE INTO [dbo].[Tbl_GlCodes] AS S1                    
USING @tbl_Category AS S2                    
ON S1.ClientID=S2.ClientID AND S1.GLNumber= S2.SubcategoryGL                    
WHEN MATCHED THEN UPDATE SET                     
S1.GLDescription=S2.GLDescription                    
WHEN NOT MATCHED                     
THEN INSERT                     
(ClientID,GLNumber,GLDescription,RowStatus,MasterGLCode,IsMasterGLCode,CreatedBy,CreatedOn,CategoryName,IsActive)                    
VALUES                    
(S2.ClientID,S2.SubcategoryGL,S2.GLDescription,S2.RowStatus,S2.Mastercode,S2.IsMasterGLCode,S2.CreatedBy,GETUTCDATE(),S2.Category,1);                             
END                 
        
        
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCategoryGlDetails]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_InsertCategoryGlDetails '2000','1001','new','A',3000,'trave'
CREATE PROCEDURE [dbo].[SP_InsertCategoryGlDetails]
@clientId NVARCHAR(MAX),
@glNumber NVARCHAR(MAX),
@glDescription NVARCHAR(MAX),
@rowStatus NVARCHAR(MAX),
@createdBy Numeric(18,0),
@gategoryname NVARCHAR(MAX),
@retVal int output
AS
BEGIN
	INSERT INTO [dbo].Tbl_GlCodes

	(ClientID,GLNumber,GLDescription,RowStatus,CreatedBy,CreatedOn,IsMasterGLCode,CategoryName,IsActive)
	VALUES
	(@clientId,@glNumber,@glDescription,@rowStatus,@createdBy,GETUTCDATE(),1,@gategoryname,1)

	
	SET @retVal = SCOPE_IDENTITY()
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertClientAccount]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertClientAccount]
@accountName NVARCHAR(MAX),
@accountNumber NVARCHAR(MAX),
@routingNumber NVARCHAR(MAX),
@referenceID NVARCHAR(MAX),
@customerID NUMERIC(18,0),
@userID NUMERIC(18,0),
@isDefault NUMERIC(18,0),
@achCustomer NVARCHAR(MAX),
@retVal NUMERIC(18,0)
AS
BEGIN
		If(@isDefault=1)
		BEGIN
				Update [dbo].[Tbl_ClientBankAccount] SET IsDefault=0
		END
		INSERT INTO [Tbl_ClientBankAccount]
		([AccountName],[AccountNumber],[RoutingNumber],[ReferenceID],[CustomerID],[IsDefault],
		[CreatedBy],[CreatedOn],[Status],ACHCustomer)
		VALUES
		(@accountName,@accountNumber,@routingNumber,@referenceID,@customerID,@isDefault,@userID,GETUTCDATE(),50058,@achCustomer)

		SET @retVal=SCOPE_IDENTITY()
		return @retVal
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertClientAdmin]    Script Date: 15-04-2022 16:05:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertClientAdmin]  
@CompanyName NVARCHAR(MAX),  
@ActivationKey NVARCHAR(MAX),  
@CreatedBy NUMERIC(18,0),  
@userID NUMERIC(18,0),  
@retVal NUMERIC(18,0)  
AS  
BEGIN  
DECLARE @insertedClientID NUMERIC(18,0)
  INSERT [dbo].[Tbl_Client]  
  ([ClientName],ActivationKey,CreatedBy,CreatedOn,UserID,[Status],IsActive)  
  VALUES  
  (@CompanyName,@ActivationKey,@CreatedBy,GETUTCDATE(),@userID,50061,1)  
  SET @retVal=SCOPE_IDENTITY();  
  SET @insertedClientID=@retVal;
  UPDATE Tbl_Accounts SET ClientID=@insertedClientID WHERE AccountID=@userID
  REturn @retVal;  
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertClientUser]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Sp_InsertClientUser 'GovindRG','RT','gtgtgt@gmail.com','63715',30046,0
CREATE PROC [dbo].[Sp_InsertClientUser]  
@Firstname nvarchar(max),    
@Lastname nvarchar(max),     
@Emailid nvarchar(max),     
@Linkid nvarchar(max),    
@CreatedBy numeric(18,0),  
@retVal NUMERIC(18,0)  
AS  
BEGIN  
  INSERT INTO [dbo].[Tbl_Accounts]  
  ([FirstName],[LastName],[UserName],[PrimaryEmailID],CreatedOn,CreatedBy,LinkID,[IsPasswordGenerated])  
  VALUES  
  (@Firstname,@Lastname,@Emailid,@Emailid,GETUTCDATE(),@CreatedBy,@Linkid,0)  
  SET @retVal=SCOPE_IDENTITY();  

  RETURN @retVal
 --select @retVal  

END

--select * from [Tbl_Accounts] order by 1 desc
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomApprovalConfiguration]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomApprovalConfiguration]    
@isVendorType NUMERIC(18,0),    
@isAmountType NUMERIC(18,0),    
@vendorID NUMERIC(18,0),    
@amount NUMERIC(18,2),    
@secondAmount NUMERIC(18,2),    
@condition NUMERIC(18,0),    
@createdBy NUMERIC(18,0),    
@clientID NUMERIC(18,0)    ,
@retVal NUMERIC(18,0)
AS    
BEGIN    
    
   INSERT INTO [dbo].[Tbl_CustomApprovalConfigurations]    
   ([IsVendorType],[IsAmountType],[VendorID],[Amount],[Condition],[CreatedOn],[CreatedBy],[ClientID],[IsActive],SecondAmount)    
   VALUES    
   (@isVendorType,@isAmountType,@vendorID,@amount,@condition,GETUTCDATE(),@createdBy,@clientID,1,@secondAmount)    
    
   SET @retVal=Scope_Identity()    
  RETURN @retVal;  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomApprover]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertCustomApprover]
@configID NUMERIC(18,0),
@approverID NUMERIC(18,0),
@sequence NUMERIC(18,0),
@clientID NUMERIC(18,0),
@createdBy NUMERIC(18,0) 
AS
BEGIN
DECLARE @retVal NUMERIC(18,0)
		INSERT INTO [dbo].[Tbl_CustomApprovers]
		([ConfigID],[ApproverID],[Sequence],[ClientID],[CreatedOn],[CreatedBy],[IsActive])
		VALUES
		(@configID,@approverID,@sequence,@clientID,GETUTCDATE(),@createdBy,1)
		SET @retVal=Scope_Identity()
		RETURN @retVal
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer300Notes]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomer300Notes]  
@notes NVARCHAR(MAX),  
@customerID NUMERIC(18,0),  
@clientID NUMERIC(18,0),  
@retVal NUMERIC(18,0),  
@createdBy NUMERIC(18,0)  
AS  
BEGIN  
 INSERT INTO [dbo].Tbl_Customer3600Notes  
 ([ClientID],[CustomerID],[Notes],[CreatedBy],[CreatedOn],[OrderByDate])  
 VALUES  
 (@clientID,@customerID,@notes,@createdBy,GETUTCDATE(),GETUTCDATE())  
 SET @retVal=SCOPE_IDENTITY()  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer360Contact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomer360Contact]
@firstName NVARCHAR(MAX),
@lastName NVARCHAR(MAX),
@email NVARCHAR(MAX),
@phoneNumber NVARCHAR(MAX),
@createdBy Numeric(18,0),
@customerID Numeric(18,0),
@clientID Numeric(18,0),
@retVal Numeric(18,0)
AS
BEGIN

    IF NOT  EXISTS(SELECT Email FROM Tbl_Customer360Contact WHERE Email=@email)
	BEGIN
	INSERT INTO [dbo].Tbl_Customer360Contact
	(CustomerId,ClientID,[Name],LastName,Email,Phoneno,CreatedOn,CreatedBy,OrderByDate)
	VALUES
	(@customerID,@clientID,@firstName,@lastName,@email,@phoneNumber,GETUTCDATE(),@createdBy,GETUTCDATE())
	SET @retVal =SCOPE_IDENTITY()
	Return @retVal
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer360Document]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomer360Document]
@customerId NUMERIC(18,0),
@clientID NUMERIC(18,0),
@fileName NVARCHAR(MAX),
@lastModified NVARCHAR(MAX),
@fileModifiedName NVARCHAR(MAX),
@createdBy	NUMERIC(18,0),
@retVal NUMERIC(18,0)
AS
BEGIN
INSERT INTO [dbo].[Tbl_Customer360Documents]
([ClientID],[CustomerID],[FileName],[LastModifiedBy],[CreatedBy],[CreatedOn],[ModifiedFileName],[OrderByDate])
VALUES
(@clientID,@customerId,@fileName,@lastModified,@createdBy,GETUTCDATE(),@fileModifiedName,GETUTCDATE())
SET @retVal=SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomer360Notes]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomer360Notes]  
@notes NVARCHAR(MAX),  
@customerID NUMERIC(18,0),  
@clientID NUMERIC(18,0),  
@retVal NUMERIC(18,0),  
@createdBy NUMERIC(18,0)  
AS  
BEGIN  
 INSERT INTO [dbo].Tbl_Customer3600Notes  
 ([ClientID],[CustomerID],[Notes],[CreatedBy],[CreatedOn],[OrderByDate])  
 VALUES  
 (@clientID,@customerID,@notes,@createdBy,GETUTCDATE(),GETUTCDATE())  
 SET @retVal=SCOPE_IDENTITY()  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomerContact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomerContact]
@firstName NVARCHAR(MAX),
@lastName NVARCHAR(MAX),
@email NVARCHAR(MAX),
@phoneNumber NVARCHAR(MAX),
@createdBy Numeric(18,0),
@customerID Numeric(18,0),
@clientID Numeric(18,0),
@retVal Numeric(18,0)
AS
BEGIN

    IF NOT  EXISTS(SELECT Email FROM Tbl_CustomerContact WHERE Email=@email)
	BEGIN
	INSERT INTO [dbo].Tbl_CustomerContact
	(CustomerId,ClientID,[Name],LastName,Email,Phoneno,CreatedOn,CreatedBy,OrderByDate)
	VALUES
	(@customerID,@clientID,@firstName,@lastName,@email,@phoneNumber,GETUTCDATE(),@createdBy,GETUTCDATE())
	SET @retVal =SCOPE_IDENTITY()
	Return @retVal
	END
END


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomerDocument]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomerDocument]
@customerId NUMERIC(18,0),
@clientID NUMERIC(18,0),
@fileName NVARCHAR(MAX),
@lastModified NVARCHAR(MAX),
@fileModifiedName NVARCHAR(MAX),
@createdBy	NUMERIC(18,0),
@retVal NUMERIC(18,0)
AS
BEGIN
INSERT INTO [dbo].[Tbl_CustomerDocuments]
([ClientID],[CustomerID],[FileName],[LastModifiedBy],[CreatedBy],[CreatedOn],[ModifiedFileName],[OrderByDate])
VALUES
(@clientID,@customerId,@fileName,@lastModified,@createdBy,GETUTCDATE(),@fileModifiedName,GETUTCDATE())
SET @retVal=SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomerList]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomerList]                    
(@tbl_CustomerList AS TVP_CustomerList readonly)                    
AS                    
BEGIN                    
                    
MERGE INTO [dbo].[tbl_customers] AS S1                    
USING @tbl_CustomerList AS S2                    
ON S1.Email=S2.Email AND S1.ClientID=S2.ClientID            
WHEN MATCHED THEN UPDATE SET                     
S1.CustomerName=S2.CustomerName,S1.CustomerAddress=S2.[Address]                   
WHEN NOT MATCHED                     
THEN INSERT                     
(CustomerName,CustomerAddress,Email,ClientID)                    
VALUES                    
(S2.CustomerName,S2.[Address],S2.Email,S2.ClientID);                             
END  

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCustomerNotes]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCustomerNotes]  
@notes NVARCHAR(MAX),  
@customerID NUMERIC(18,0),  
@clientID NUMERIC(18,0),  
@retVal NUMERIC(18,0),  
@createdBy NUMERIC(18,0)  
AS  
BEGIN  
 INSERT INTO [dbo].Tbl_CustomerNotes  
 ([ClientID],[CustomerID],[Notes],[CreatedBy],[CreatedOn],[OrderByDate])  
 VALUES  
 (@clientID,@customerID,@notes,@createdBy,GETUTCDATE(),GETUTCDATE())  
 SET @retVal=SCOPE_IDENTITY()  
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDwollaConnectedDetails]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertDwollaConnectedDetails]
(@Tbl_DwollaConnectedDetails AS TVP_dwolla readonly)--,@accountID NUMERIC(18,0))	
AS
BEGIN

MERGE INTO [dbo].[Tbl_DwollaConnectedDetails] AS S1                  
USING @Tbl_DwollaConnectedDetails AS S2                  
ON S1.ClientID=S2.ClientID AND S1.FundID= S2.FundID                  
WHEN MATCHED THEN UPDATE SET                   
S1.UpdatedBy=S2.UpdatedBy , S1.UpdatedOn=CONVERT(nvarchar(MAX), GETUTCDATE(), 101)                  
WHEN NOT MATCHED                   
THEN INSERT                   
(FundID,SourceName,ClientID,CreatedBy,UpdatedBy,CreatedOn,UpdatedOn,BankName)                  
VALUES                  
(S2.FundID,S2.SourceName,S2.ClientID,S2.CreatedBy,0,CONVERT(nvarchar(MAX), GETUTCDATE(), 101),'',S2.BankName);   
END


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDwollaTransaction]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_InsertDwollaTransaction]    
@billID NUMERIC(18,0),    
@fundFrom NVARCHAR(MAX),    
@fundTo NVARCHAR(MAX),    
@fundId NVARCHAR(MAX),    
@amount NUMERIC(18,2),    
@remarks  NVARCHAR(MAX),    
@transferredBy NUMERIC(18,0)  ,  
@bankTransferID NVARCHAR(MAX),    
@clientID NUMERIC(18,0),
@SortID NVARCHAR(MAX)
AS    
BEGIN    
 INSERT INTO [dbo].[Tbl_DwollaTransactions]    
 ([BillID],[FundFrom],[FundTo],FundId,[Amount],[Remarks],[CapturedOn],[CreatedOn],[CreatedBy],ClientID,[BankTransferID],[SortID])    
 VALUES    
 (@billID,@fundFrom,@fundTo,@fundId,@amount,@remarks,GETUTCDATE(),GETUTCDATE(),@transferredBy,@clientID,@bankTransferID,@SortID)    
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertGLCategory]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertGLCategory]  
@catgoryName NVARCHAR(MAX),  
@glCode NVARCHAR(MAX),  
@glDescription NVARCHAR(MAX),  
@status NVARCHAR(MAX),  
@createdBy NUMERIC(18,0),  
@clientID NUMERIC(18,0)  
AS  
BEGIN  
DECLARE @retVal AS  NUMERIC(18,0)  
 INSERT INTO [dbo].[Tbl_GlCodes]  
 ([ClientID],[GLNumber],[GLDescription],[RowStatus],[CreatedBy],[CreatedOn],  
 [IsMasterGLCode],[CategoryName],[IsActive])  
  
 VALUES  
    
  (@clientID,@glCode,@glDescription,'A',@createdBy,CONVERT(nvarchar(MAX), GETUTCDATE(), 101),1,@catgoryName,@status)  
  
 SET @retVal=Scope_Identity()  
 RETURN @retVal  
  
END  
  
  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertGLSubCategory]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertGLSubCategory]
@categoryID NVARCHAR(MAX),
@glCode NVARCHAR(MAX),
@glDescription NVARCHAR(MAX),
@status NVARCHAR(MAX),
@createdBy NUMERIC(18,0),
@clientID NUMERIC(18,0),
@categoryName NVARCHAR(MAX)
AS
BEGIN
INSERT INTO [dbo].[Tbl_GlCodes]
	([ClientID],[GLNumber],[GLDescription],[RowStatus],[CreatedBy],[CreatedOn],
	[IsMasterGLCode],[CategoryName],[IsActive],[MasterGLCode])
	VALUES
	 (@clientID,@glCode,@glDescription,'A',@createdBy,GETUTCDATE(),0,@categoryName,@status,@categoryID)
END













GO
/****** Object:  StoredProcedure [dbo].[SP_InsertInvoiceDistinct]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertInvoiceDistinct]                    
(@tbl_Invoicedistinct AS TVP_InvoiceDistinctAR readonly)                    
AS                    
BEGIN                    
                    
MERGE INTO [dbo].[Tbl_Invoice] AS S1                    
USING @tbl_Invoicedistinct AS S2                    
ON S1.InvoiceName=S2.InvID AND S1.Customerid= S2.CustomerID and S1.ClientId=S2.ClientId and S1.TotamAmount=S2.Amount                   
WHEN MATCHED THEN UPDATE SET                     
S1.[Description]=S2.[Description]                   
WHEN NOT MATCHED                     
THEN INSERT                     
(InvoiceName,Customerid,[Description],Invoicedate,TermCode,CreatedBy,CreatedOn,ClientId,TotamAmount)                    
VALUES                    
(S2.InvID,S2.CustomerID,S2.[Description],S2.InvoiceDate,S2.TermCode,S2.CreatedBy,GETUTCDATE(),S2.ClientId,S2.Amount); 

END 


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertInvoiceList]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertInvoiceList]                    
(@tbl_InvoiceList AS TVP_Invoice readonly)                    
AS                    
BEGIN                    
                    
MERGE INTO [dbo].[Tbl_OrderInvoice] AS S1                    
USING @tbl_InvoiceList AS S2                    
ON S1.Lineitemnno=S2.Lineitemnno AND S1.InvID= S2.InvID AND S1.OrderId=S2.OrderId  AND S1.ClientId=S2.ClientId                
WHEN MATCHED THEN UPDATE SET                     
S1.Amount=S2.Amount,S1.Discount=S2.Discount                   
WHEN NOT MATCHED                     
THEN INSERT                     
(Lineitemnno,InvID,OrderId,Amount,Discount,ClientId)                    
VALUES                    
(S2.Lineitemnno,S2.InvID,S2.OrderId,S2.Amount,S2.Discount,S2.ClientId);                             
END                 
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertLoginAudit]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertLoginAudit]
@loginName NVARCHAR(MAX),
@loginStatus NVARCHAR(MAX)
AS
BEGIN
	INSERT INTO Tbl_LoginAudit
	(LoginName,
	LoginTime,
	Status)
	VALUES
	(@loginName,GETUTCDATE(),@loginStatus)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertNotes]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertNotes]  
@notes NVARCHAR(MAX),  
@vendorID NUMERIC(18,0),  
@clientID NUMERIC(18,0),  
@retVal NUMERIC(18,0),  
@createdBy NUMERIC(18,0)  
AS  
BEGIN  
 INSERT INTO [dbo].[Tbl_VendorNotes]  
 ([ClientID],[VendorID],[Notes],[CreatedBy],[CreatedOn])  
 VALUES  
 (@clientID,@vendorID,@notes,@createdBy,GETUTCDATE())  
 SET @retVal=SCOPE_IDENTITY()  
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertPaidBillDocuments]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertPaidBillDocuments]  
@billId NUMERIC(18,0),  
@fileDisplayName NVARCHAR(MAX),  
@physicalFileName NVARCHAR(MAX),  
@fileSize NVARCHAR(MAX),  
@filePhysicalPath NVARCHAR(MAX),  
@extension NVARCHAR(MAX),  
@createdBy NUMERIC(18,0),  

@approvedBillID NUMERIC(18,0)
AS  
BEGIN  
   INSERT INTO Tbl_BillPaidAttachments  
   ([BillID],BillApprovedId,[FileName],[PhysicalFileName],[Size],[PhysicalPath],[Extension],[CreatedOn],[CreatedBy])  
   VALUES  
   (@billId,@approvedBillID,@fileDisplayName,@physicalFileName,@fileSize,@filePhysicalPath,@extension,GETUTCDATE(),@createdBy)  
    
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertProject]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertProject]  
@clientID NUMERIC(18,0),  
@createdBy NUMERIC(18,0),  
@projectName NVARCHAR(MAX),  
@customer NUMERIC(18,0),  
@projectDescription NVARCHAR(MAX),  
@projectType NUMERIC(18,0),  
@status NUMERIC(18,0),  
@retVal NUMERIC(18,0)  
AS  
BEGIN  
  INSERT INTO Tbl_Projects   
  ([ProjectName],[Customer],[ProjectDescription],[ProjectType],[ProjectStatus],[ClientID],[CreatedOn],[CreatedBy])  
  VALUES  
  (@projectName,@customer,@projectDescription,@projectType,@status,@clientID,GETUTCDATE(),@createdBy)  
 SET @retVal=SCOPE_IDENTITY()  
 RETURN @retVal
    
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertRecurringInvoice]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertRecurringInvoice]
@Iinvoiceno nvarchar(max),@customerid numeric(18,0),@duedate datetime,@invoicedate nvarchar(50),
@termcode nvarchar(100),@createdby numeric(18,0),@clientid numeric(18,2),@totalamount numeric(18,2),
@startdate nvarchar(100),@invoiceid numeric(18,0),@invoicename nvarchar(200)
AS
BEGIN
	INSERT INTO tbl_Invoice(InvoiceName,Customerid,Duedate,Invoicedate,TermCode,CreatedBy,CreatedOn,
	ClientId,TotamAmount,MasterInvoice)
	VALUES(@Iinvoiceno,@customerid,@duedate,@invoicedate,@termcode,
	@createdby,GETUTCDATE(),@clientid,@totalamount,@invoicename)

	UPDATE tbl_Invoice SET RecurringLastdate=GETUTCDATE() WHERE InvoiceId=@invoiceid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertTimeLine]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertTimeLine] 
@action nvarchar(max),@invoiceid numeric(18,0),@accountid numeric(18,0)
AS
BEGIN
	INSERT INTO tbl_InvoiceTimeline([Action],[date],Invoiceid,AccountId)
	VALUES (@action,getutcdate(),@invoiceid,@accountid)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendor]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendor]        
@vendorName NVARCHAR(MAX),        
@firstName NVARCHAR(MAX),        
@lastName NVARCHAR (MAX),        
@email NVARCHAR(MAX),        
@addresLineOne NVARCHAR(MAX),        
@addresLineTwo NVARCHAR(MAX),        
@city NVARCHAR(MAX),        
@state NVARCHAR(MAX),        
@zip NVARCHAR(MAX),        
@contact NVARCHAR(MAX),        
@SSN NVARCHAR(MAX),        
@url NVARCHAR(MAX),      
--Newly added columns,        
@vendorType NUMERIC(18,0),        
@prefferedPaymentMethod NUMERIC(18,0),        
@taxId NVARCHAR(MAX),        
@paymentTerm NUMERIC(18,0),        
@clientID NUMERIC(18,0),        
@createdBy NUMERIC(18,0),        
@referenceID NVARCHAR(MAX) ,    
@vendorLogo NVARCHAR(MAX) ,    
@RetVal NUMERIC(18,0),    
@leadTime  NVARCHAR(MAX) ,  
@paypalEmailAddress  NVARCHAR(MAX) ,  
@paypalMobileNumber  NVARCHAR(MAX) ,  
@GLCode NVARCHAR(MAX)  ,
@externalNumber Nvarchar(MAX)
AS        
BEGIN        
        
        IF NOT EXISTS(SELECT VendorName FROM Tbl_Vendor WHERE VendorName=@vendorName)
		BEGIN
  INSERT INTO Tbl_Vendor        
  (VendorName,FirstName,LastName,Email,Address1,Address2,City,[State],PostalCode,Phone,SSNNumber,        
  VendorType,PrefferedPaymentMethod,TaxId,PaymentTerm,ClientID,CreatedBy,CreatedOn,ReferenceID,VendorLogo,[LeadTimeDays],WebsiteURL,  
 [PaypalEmailAddress], [PaypalMobileNumber],[GLCode],ExternalNumber)        
  VALUES        
  (@vendorName,@firstName,@lastName,@email,@addresLineOne,@addresLineTwo        
  ,@city,@state,@zip,@contact,@SSN,@vendorType,@prefferedPaymentMethod,@taxId,@paymentTerm,        
  @clientID,@createdBy,GETUTCDATE(),@referenceID,@vendorLogo,@leadTime,@url,@paypalEmailAddress,@paypalMobileNumber,@GLCode,@externalNumber)        
        
  SET @RetVal = SCOPE_IDENTITY()   
  END
     ELSE
	 BEGIN
	SET @RetVal=0
	 END
  RETURN @RetVal        
        
END   
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendorBankAccount]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendorBankAccount]    
@accountHolderName NVARCHAR(MAX),    
@accountNumber NVARCHAR(MAX),    
@routingNumber NVARCHAR(MAX),    
@createdBy NUMERIC(18,0),    
@vendorID  NUMERIC(18,0),    
@clientID  NUMERIC(18,0) ,  
@isBankAccountAdded NUMERIC(18,0),  
@bankAccountIdentityID  NUMERIC(18,0)  ,
@retVal NUMERIC(18,0)
AS    
BEGIN    
IF(@isBankAccountAdded=0)  
BEGIN  
 INSERT INTO Tbl_VendorBankAccount    
 ([VendorID],[AccountHolderName],[AccountNumber],[RoutingNumber],[CreatedBy],[CreatedOn],[ClientID])    
 VALUES    
 (@vendorID,@accountHolderName,@accountNumber,@routingNumber,@createdBy,GETUTCDATE(),    
 @clientID)  
 SET @retVal=SCOPE_IDENTITY()
 END  
 ELSE  
  
 BEGIN  
 UPDATE Tbl_VendorBankAccount    
  SET    
  [AccountHolderName]=@accountHolderName,    
  [AccountNumber]=@accountNumber,    
  [RoutingNumber]=@routingNumber,    
  [UpdatedBy]=@createdBy,    
  [UpdatedOn]=GETUTCDATE()    
  WHERE [IdentityID]=@bankAccountIdentityID  AND ClientID=@clientID    
    SET @retVal=@bankAccountIdentityID
 END  

 RETURN @retVal
     
END    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendorContact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendorContact]
@firstName NVARCHAR(MAX),
@lastName NVARCHAR(MAX),
@email NVARCHAR(MAX),
@phoneNumber NVARCHAR(MAX),
@createdBy Numeric(18,0),
@vendorID Numeric(18,0),
@clientID Numeric(18,0),
@retVal Numeric(18,0)
AS
BEGIN
	INSERT INTO [dbo].[VendorContact]
	([VendorID],[ClientID],[FirstName],[LastName],[Email],[Phone],[CreatedOn],[CreatedBy])
	VALUES
	(@vendorID,@clientID,@firstName,@lastName,@email,@phoneNumber,GETUTCDATE(),@createdBy)
	SET @retVal =SCOPE_IDENTITY()
	Return @retVal
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendorDocument]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendorDocument]
@vendorId NUMERIC(18,0),
@clientID NUMERIC(18,0),
@fileName NVARCHAR(MAX),
@lastModified NVARCHAR(MAX),
@fileModifiedName NVARCHAR(MAX),
@createdBy	NUMERIC(18,0),
@retVal NUMERIC(18,0)
AS
BEGIN
INSERT INTO [dbo].[Tbl_VendorDocuments]
([ClientID],[VendorID],[FileName],[LastModifiedBy],[CreatedBy],[CreatedOn],[ModifiedFileName])
VALUES
(@clientID,@vendorId,@fileName,@lastModified,@createdBy,GETUTCDATE(),@fileModifiedName)
SET @retVal=SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendorList]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendorList]                  
(@tbl_vendor AS TVP_VendorList readonly)             
AS                  
BEGIN                  
                  
MERGE INTO [dbo].[tbl_vendor] AS S1                  
USING @tbl_vendor AS S2                  
ON S1.Email=S2.Email          
WHEN MATCHED THEN UPDATE SET                   
S1.VendorName=S2.VendorName,S1.UpdatedOn=CONVERT(nvarchar(MAX), GETUTCDATE(), 101),S1.UpdatedBy=S2.CreatedBy 
,S1.Phone=S2.Phone,S1.PrefferedPaymentMethod=S2.PrefferedPaymentMethod
,S1.PaymentTerm=S2.PaymentTerm,S1.GLCode=S2.GLCode
WHEN NOT MATCHED                   
THEN INSERT                   
(VendorName,Email,Phone,PrefferedPaymentMethod,PaymentTerm,GLCode,CreatedOn,CreatedBy,ClientID)                  
VALUES                  
(S2.VendorName,S2.Email,S2.Phone,S2.PrefferedPaymentMethod,S2.PaymentTerm,S2.GLCode,CONVERT(nvarchar(MAX), GETUTCDATE(), 101),S2.CreatedBy,S2.ClientID);        
                  
END               
      
      
                  
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertVendorMandatories]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertVendorMandatories]          
@vendorName NVARCHAR(MAX),             
@email NVARCHAR(MAX),          
@contact NVARCHAR(MAX),          
@prefferedPaymentMethod NUMERIC(18,0),          
@paymentTerm NUMERIC(18,0),          
@clientID NUMERIC(18,0),          
@createdBy NUMERIC(18,0),          
@RetVal NUMERIC(18,0),      
@GLCode NVARCHAR(MAX)      
AS          
BEGIN          
          
          
IF NOT EXISTS (SELECT Email,VendorName FROM Tbl_Vendor WHERE Email=@email OR VendorName=@vendorName)
BEGIN
  INSERT INTO Tbl_Vendor          
  (VendorName,Email,Phone,PrefferedPaymentMethod,PaymentTerm,ClientID,CreatedBy,CreatedOn,[GLCode])          
  VALUES          
  (@vendorName,@email,@contact,@prefferedPaymentMethod,@paymentTerm,          
  @clientID,@createdBy,GETUTCDATE(),@GLCode)          
          
  SET @RetVal = SCOPE_IDENTITY()          
          END
		  ELSE
		  BEGIN
		   SET @RetVal=0
		  END
  RETURN @RetVal          
          
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertWebhook]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertWebhook]  
@EventId numeric(18,0),  
@Secretkey nvarchar(50),  
@URL nvarchar(max),  
@Active  bit,  
@CreateOn datetime,
@Retval int
AS  
Begin   
  begin  
  Insert into [dbo].[dbo].[Tbl_WebHook]
     ([EventID],  
     [Secret],  
     [URL],
	 [Active],
	 [CreatedOn])
     values
	 (@EventId,  
     @Secretkey,  
     @URL,  
     @Active,
	 GETDATE())
   set @RetVal=SCOPE_IDENTITY()    
   return @RetVal; 
  end  
End  
GO
/****** Object:  StoredProcedure [dbo].[SP_InvoiceCustomerlist]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SP_GetBillDueBasedReport 0,10,'VendorName asc',2000,'0','','2020/01/01','2020/12/01','','','0','0'
Create PROCEDURE [dbo].[SP_InvoiceCustomerlist]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@clientID NUMERIC(18,0)=2000
	--@vendor nvarchar(max),@dueindays nvarchar(max),@duefrom nvarchar(max),@dueTo nvarchar(max),
	--@from nvarchar(max),@to nvarchar(max),@approvalstatus nvarchar(max),
	--@paymentstatus nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

--IF @vendor !='0'                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND VendorID IN ('+@vendor+')'               
--END 

--IF @dueindays !=''                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND Duedays IN ('''+@dueindays+''')'               
--END 

--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
----SET @dynamicwhere = @dynamicwhere + ' AND InvoiceDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            

--SET @dynamicwhere=@dynamicwhere + ' AND InvoiceDate  BETWEEN'''+@duefrom+ ''' and  '''+@dueTo+''''
--END 


--IF @from !='' AND @to !=''                        
--BEGIN                            
----SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            

--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+@from+''' AND '''+@to+''''                            
--END

--IF @approvalstatus !='0'                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND Status IN ('+@approvalstatus+')'               
--END

--IF @paymentstatus !='0'                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatusId IN ('+@paymentstatus+')'               
--END

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''Customerlst'' AS TableName, [CustomerName],[NextDueDate],[NextDueAmount]        
,[Balance],[Totalamtreceved],LastPayment,[Customerid],
 ,ClientId
 FROM [View_InvoiceCustomer] WHERE ClientId= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT Customerid) AS Count FROM [View_InvoiceCustomer]'              
+ '              
 WHERE  ClientId = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InvoiceCustomerlist300]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--SP_InvoiceCustomerlist300 0,10,'CustomerName asc',2000
CREATE PROCEDURE [dbo].[SP_InvoiceCustomerlist300]
	@start INT,@skip INT,@orderby NVARCHAR(max)='',@clientID NUMERIC(18,0),
	@customername nvarchar(max),@balance nvarchar(max),@totalamount nvarchar(max)
	--@from nvarchar(max),@to nvarchar(max),@approvalstatus nvarchar(max),
	--@paymentstatus nvarchar(max)
AS
BEGIN
DECLARE @dynamicwhere NVARCHAR(max)=''              
DECLARE @dynamicsql NVARCHAR(max) =''              
DECLARE @orderbydynamic NVARCHAR(max) ='' 

IF(@customername!='')    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND CustomerName = '''+CAST(@customername AS VARCHAR(MAX))+'''  '    
END  

IF(@balance!='')    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND Balance = '''+CAST(@balance AS VARCHAR(MAX))+'''  '    
END 

IF(@totalamount!='')    
BEGIN    
SET @dynamicwhere = @dynamicwhere + ' AND Totalamtreceved = '''+CAST(@totalamount AS VARCHAR(MAX))+'''  '    
END 

--IF @duefrom !='' AND @dueTo !=''                        
--BEGIN                            
----SET @dynamicwhere = @dynamicwhere + ' AND InvoiceDate  BETWEEN '''+Convert(varchar(50),Convert(date,@duefrom,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@dueTo,101),101)+''''                            

--SET @dynamicwhere=@dynamicwhere + ' AND InvoiceDate  BETWEEN'''+@duefrom+ ''' and  '''+@dueTo+''''
--END 


--IF @from !='' AND @to !=''                        
--BEGIN                            
----SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+Convert(varchar(50),Convert(date,@from,101),101)+''' AND '''+Convert(varchar(50),Convert(date,@to,101),101)+''''                            

--SET @dynamicwhere = @dynamicwhere + ' AND DueDate  BETWEEN '''+@from+''' AND '''+@to+''''                            
--END

--IF @approvalstatus !='0'                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND Status IN ('+@approvalstatus+')'               
--END

--IF @paymentstatus !='0'                
--BEGIN                
--SET @dynamicwhere = @dynamicwhere + ' AND PaymentStatusId IN ('+@paymentstatus+')'               
--END

SET @orderByDynamic = ' ORDER BY '+@orderBy 

	SET @dynamicsql='SELECT ''Customerlst'' AS TableName, [CustomerName],[NextDueDate],[NextDueAmount]        
,[Balance],[Totalamtreceved],LastPayment,[Customerid],AssociatedProjects,AssociatedBills,AssociatedCounts,
 ClientId,AssociatedInvoice
 FROM [View_InvoiceCustomer] WHERE ClientId= '+ CAST(@clientID AS VARCHAR(MAX)) +'  ' +      
  @dynamicwhere + '  ' +@orderbydynamic + ' OFFSET '              
+ Cast(@start AS NVARCHAR(max))              
+ ' ROWS FETCH NEXT '              
+ Cast(@skip AS NVARCHAR(max))               
+ ' ROWS ONLY'            
              
PRINT ( @dynamicsql )              
              
EXEC(@dynamicsql)              
              
DECLARE              
@dynamiccountsql NVARCHAR(max) = 'SELECT ''AllCount'' AS TableName,COUNT(DISTINCT Customerid) AS Count FROM [View_InvoiceCustomer]'              
+ '              
 WHERE  ClientId = ' + CAST(@clientID AS VARCHAR(MAX)) + ' '          
 + @dynamicwhere          
PRINT( @dynamiccountsql )              
              
EXEC(@dynamiccountsql)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_MakeAccountDefault]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MakeAccountDefault]  
@userID NUMERIC(18,0),  
@customerID NUMERIC(18,0),  
@accountID NuMERIC(18,0)  
As  
BEGIN  
 UPDATE [dbo].[Tbl_ClientBankAccount] SET IsDefault=0 WHERE CustomerID=@customerID  
 UPDATE [dbo].[Tbl_ClientBankAccount] SET IsDefault=1 ,UpdatedBy=@userID,UpdatedOn=GETUTCDATE()  WHERE AccountIdentityID=@accountID AND CustomerID=@customerID  
  
 Return @accountID  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MakeDefaultCard]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MakeDefaultCard]
@userID NUMERIC(18,0),
@customerID NUMERIC(18,0),
@cardID NUMERIC(18,0)
AS
BEGIN
		UPDATE Tbl_ClientCards SET IsDefault=0 WHERE CustomerID=@customerID
		UPDATE Tbl_ClientCards SET IsDefault=1,UpdatedBy=@userID,UpdatedOn=GETUTCDATE()   WHERE CardIdentityId=@cardID AND CustomerID=@customerID

		RETURN @cardID
		
END



















GO
/****** Object:  StoredProcedure [dbo].[SP_MarkAsPaid]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MarkAsPaid]      
@billId NUMERIC (18,0),      
@billApprovedID NUMERIC (18,0),      
@paidBy NUMERIC(18,0),      
@amountPaid NUMERIC(18,2),      
@amountDue NUMERIC(18,2),      
@payementMode NVARCHAR(MAX),      
@paidRefID  NVARCHAR(MAX),      
@paidOn Datetime,    
@paymentType NUMERIC(18,0),
@clientID NUMERIC(18,0)      
AS      
BEGIN      
  UPDATE Tbl_BillApproved SET      
  UpdatedBy=@paidBy,      
  [UpdatedOn]=GETUTCDATE(),      
  [AmountPaid]=@amountPaid,      
  [AmountDue]=@amountDue,      
  [PaymentMethod]=@payementMode,    
  [PaymentMode]=50073,    
  [PaymentReferenceID]=@paidRefID,      
  PaidOn=@paidOn,      
  PaymentStatus=50044 ,Status=50044 
  ,TypeOfPayment=@paymentType
  WHERE [IdentityID]=@billApprovedID AND [BillID]=@billId      
        
      
  UPDATE Tbl_Bill SET Status=50044,UpdatedBy=@paidBy,UpdatedOn=GETUTCDATE()       
  WHERE BillID=@billID AND ClientID=@clientID          
  RETURN @billId      
      
END 


SELECT * from Tbl_BillApproved
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[SP_Multiapproval]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Multiapproval]          
@billId NUMERIC(18,0),          
@accountId NUMERIC(18,0),          
@actionKey NUMERIC(18,0),          
@payableAmount NUMERIC(18,2),          
@approvedAmount NUMERIC(18,0),          
@dueOn Datetime,          
@vendorId numeric(18,0),          
@clientId NUMERIC(18,0) ,
@comment NVARCHAR(MAX)
AS          
BEGIN          
 if(@actionKey=1)          
 begin          
   --Updating Bill status in Tbl_Bill AS Rejected          
     Update Tbl_Bill set Status=50017 ,Balance=@payableAmount, UpdatedBy=@accountId,UpdatedOn=getutcdate() where BillID=@billID          
               
   --Inserting approver History          
     --Insert into [dbo].[Tbl_ApproveHistory] ([BillID],[CreatedOn],[CreatedBy],Status)          
     --Values          
     --(@billID,getutcdate(),@accountId,50046)          

	 Insert into [dbo].[Tbl_ApproveHistory] ([BillID],[ApproverComment],[ApproverID],[CreatedOn],[CreatedBy],Status)                
  Values                
  (@billId,@comment,@accountId,getutcdate(),@accountId,50046) 
               
     --Deleting  Bill history in Bil approved          
     DELETE FROM Tbl_BillApproved WHERE BillID=@billID          
     end          
  else          
  begin          
        
  --if not exists(select Billid from Tbl_BillApproved where BillID=@billId)          
  --begin          
  -- end          
  --Inserting Approver History                
    Insert into [dbo].[Tbl_ApproveHistory]([BillID],[ApproverComment],[CreatedOn],[CreatedBy],[ApproverID],Status,[ApprovedAmount],[BalanceAmount])                
    Values(@billID,'',getutcdate(),@accountId,@accountId,50045,@approvedAmount,0.00)          
       
   declare @approverStageId numeric(18,0)          
          
  set @approverStageId=(select BillStageApprovalID from BillStageApproval where BillID=@billId and ApproverID=@accountId)          
          
   DECLARE @lastApprover NUMERIC(18,0)          
          
    SET @lastApprover=(SELECT MAX(BillStageApprovalID) FROM  [dbo].[BillStageApproval]  WHERE BillID=@billID)          
          
    DECLARE @currentApproverStageApprovalID NUMERIC(18,0)                
                
     SET @currentApproverStageApprovalID=(SELECT BillStageApprovalID FROM  [dbo].[BillStageApproval]  WHERE BillID=@billID AND ApproverID=@accountId)                
      
  UPDATE [dbo].[BillStageApproval] SET CurrentStageApproval=0,ApprovedAmount=@approvedAmount WHERE ApproverID=@accountId AND BillID=@billID            
            
  UPDATE [dbo].[BillStageApproval] SET StageInitiated=1, CurrentStageApproval=1 WHERE BillStageApprovalID=@approverStageId+1 AND  BillID=@billID           
       
 --Insert if the current approver is the last approver          
 IF(@currentApproverStageApprovalID=@lastApprover)          
 BEGIN          
        Insert into [dbo].[Tbl_BillApproved]          
       ([BillID],          
       [ApprovedAmount],          
       [Status],          
       [PaymentStatus],          
       [DueOn],          
       [VendorID],          
       [PayableAmount],          
       [CreatedOn],          
       [CreatedBy],          
       ClientID)          
              (Select BillId,@approvedAmount,50015,50023,DueDate,@vendorId,@payableAmount,getutcdate(),@accountId,@clientId FROM TBl_Bill Where BillId=@billID)  
     --  Values          
       --(@billID,@approvedAmount,50015,50023,@dueOn,@vendorId,@payableAmount,getutcdate(),@accountId,@clientId)          
    --Updating Tbl_Bill data for the bill                
   Update Tbl_Bill set Status=50015 ,Balance=0.00, UpdatedBy=@accountId,UpdatedOn=getutcdate() where BillID=@billID          
 END         
      
      
  if(@lastApprover!=@approverStageId)          
  begin          
  Update Tbl_Bill set Status=50016 where BillID=@billID          
  Update Tbl_BillApproved set Status=50016 where BillID=@billID          
  end          
  else          
  begin          
  Update Tbl_Bill set Status=50015 where BillID=@billID          
  Update Tbl_BillApproved set Status=50015 where BillID=@billID          
  end          
          
          
  end        
  RETURN @billID        
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_PullBillsToDenali]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_PullBillsToDenali]
@clientID NUMERIC(18,0)
AS
BEGIN
	SELECT * FROM Tbl_Bill Where ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PullCustomersToDenali]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



     --use BillManagement_Developement_V2            
--use BillManagement_Testing_V2              
--exec SP_PullCustomersToDenali 1,2000,'9502','9502'    
            
CREATE PROCEDURE [dbo].[SP_PullCustomersToDenali]              
@accountID NUMERIC(18,0),            
@clientID NUMERIC(18,0),      
@scustomerno varchar(50)='',              
@ecustomerno varchar(50)=''      
AS              
            
BEGIN              
      if(@scustomerno='' and @ecustomerno='')      
   begin      
      SELECT  'CustomerData' AS TableName,          
       A.[CustomerID], 
       A.[CustomerName]             
      ,ISNULL(B.Value1,'Default') AS CustomerType       
      ,isnull(A.[Email],'') Email    
      ,isnull(A.[ContactNumber],'') ContactNumber  
      ,isnull(A.[CustomerAddress],'') CustomerAddress           
      ,isnull(A.[City] ,'') [City]    
      ,isnull(A.[State]  ,'')[State]           
      ,isnull(A.[Zip] ,'') [Zip]                   
      ,isnull(A.[CustomerLogo],'')[CustomerLogo] 
      ,isnull(C.Value1,'') AS PaymentTerm                               
      ,isnull(D.Value1,'') AS PaymentMethod                 
      ,isnull(A.[Shippingaddress],'')   [Shippingaddress]            
      ,isnull(A.[BillingAddress],'')  BillingAddress        
      ,isnull(A.[AccountHoldername],'') [AccountHoldername]            
      ,isnull(A.AccountNumber,'') AccountNumber   
      ,isnull(A.RoutingNumber,'') RoutingNumber  
                  
      FROM [Tbl_Customers] AS A                 
   LEFT JOIN KeyList AS B                 
   ON A.CutomerType =B.KeylistId AND B.KeyID=5019                   
   LEFT JOIN KeyList AS C                 
   ON A.PaymentTerms =C.KeylistId AND C.KeyID=5003               
    LEFT JOIN KeyList AS D                 
   ON A.PaymentMethod =D.KeylistId AND D.KeyID=5020                  
   WHERE A.ClientID=@clientID AND (A.ExternalNumber is NULL OR A.ExternalNumber='' OR A.PushToDenali=1)            
  end      
  else      
  begin      
  SELECT  'CustomerData' AS TableName,          
       A.[CustomerID], 
       A.[CustomerName]             
      ,ISNULL(B.Value1,'Default') AS CustomerType       
      ,isnull(A.[Email],'') Email    
      ,isnull(A.[ContactNumber],'') ContactNumber  
      ,isnull(A.[CustomerAddress],'') CustomerAddress           
      ,isnull(A.[City] ,'') [City]    
      ,isnull(A.[State]  ,'')[State]           
      ,isnull(A.[Zip] ,'') [Zip]                   
      ,isnull(A.[CustomerLogo],'')[CustomerLogo] 
      ,isnull(C.Value1,'') AS PaymentTerm                               
      ,isnull(D.Value1,'') AS PaymentMethod                 
      ,isnull(A.[Shippingaddress],'')   [Shippingaddress]            
      ,isnull(A.[BillingAddress],'')  BillingAddress        
      ,isnull(A.[AccountHoldername],'') [AccountHoldername]            
      ,isnull(A.AccountNumber,'') AccountNumber   
      ,isnull(A.RoutingNumber,'') RoutingNumber             
      FROM [Tbl_Customers] AS A            
            
   LEFT JOIN KeyList AS B                    
   ON A.CutomerType =B.KeylistId AND B.KeyID=5019                    
   LEFT JOIN KeyList AS C                    
   ON A.PaymentTerms =C.KeylistId AND C.KeyID=5003                   
    LEFT JOIN KeyList AS D                   
   ON A.PaymentMethod =D.KeylistId AND D.KeyID=5020            
   WHERE A.ClientID=@clientID AND A.ExternalNumber >= @scustomerno and    A.ExternalNumber <=   @ecustomerno      
  end      
      
  -- UPDATE Tbl_Vendor Set PushToDenali=0 Where ExternalNumber IS NOT NULL AND  ExternalNumber !='' AND PushToDenali=1            
 declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Customers are Pulled'      
 declare @status varchar(150) = 'Sync Completed'      
 insert into tbl_DenaliSync      
 (syncdate,syncby,syncsts,syncDesc)      
 values      
 (getutcdate(),@accountID,@status,@Description)                 
END      
      
GO
/****** Object:  StoredProcedure [dbo].[SP_PullGLAccountsToDenali]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE PROC [dbo].[SP_PullGLAccountsToDenali]      
@clientID NUMERIC(18,0)  ,  
@accountID NUMERIC(18,0)  
AS      
BEGIN      
 SELECT 'GLAccounts' As TableName ,GLNumber,GLDescription FROM Tbl_GlCodes Where ClientID=@clientID      
    
 declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' GL Accounts are Pulled'    
 declare @status varchar(150) = 'Sync Completed'    
 insert into tbl_DenaliSync    
 (syncdate,syncby,syncsts,syncDesc)    
 values    
 (getutcdate(),@accountID,@status,@Description)    
    
END    
  
GO
/****** Object:  StoredProcedure [dbo].[SP_PullProductsToDenali]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     --use BillManagement_Developement_V2            
--use BillManagement_Testing_V2            
--exec SP_PullProductsToDenali 1,2000,'1','14'     
            
CREATE PROCEDURE [dbo].[SP_PullProductsToDenali]              
@accountID NUMERIC(18,0),            
@clientID NUMERIC(18,0),      
@sproductno varchar(50)='',              
@eproductno varchar(50)=''      
AS              
            
BEGIN              
      if(@sproductno='' and @eproductno='')      
   begin      
      SELECT  'ProductData' AS TableName,          
       ProductID,
ProductName,
[Vendorid],
Validfromdate,
Validtodate
,ISNULL(Currentcost,'') Currentcost
,ISNULL(Transactioncurrencyid,'') Transactioncurrencyid
,Exchangerate
,ISNULL(Currentcostbase,'') Currentcostbase
,Defaultuomid
,Defaultuomscheduleid
,ISNULL(Description,'') Description
,ISNULL(Iskit,'') Iskit
,ISNULL(Isstockitem,'') Isstockitem
,Parentproductid
,Price
,Pricebase
,ISNULL(Productstructure,'') Productstructure
,ISNULL(ProductstructureDisplay,'') ProductstructureDisplay
,ISNULL(Productnumber,'') Productnumber
,ISNULL(Producttypecode,'') Producttypecode
,ISNULL(ProducttypecodeDisplay,'') ProducttypecodeDisplay
,ISNULL(Producturl,'') Producturl
,ISNULL(Quantitydecimal,'') Quantitydecimal
,ISNULL(Quantityonhand,'') Quantityonhand
,ISNULL(Size,'') Size
,Standardcost
,Standardcostbase
,ISNULL(Statecode,'') Statecode
,ISNULL(Statuscode,'') Statuscode
,ISNULL(Stockvolume,'') Stockvolume
,Stockweight
,ISNULL(Suppliername,'') Suppliername
,ISNULL(Vendorpartnumber,'') Vendorpartnumber
,ISNULL(Hierarchypath,'') Hierarchypath
,Pricelistid
,SKUCode
,ISNULL(ProductCategory,'') ProductCategory
,ISNULL(ProductSubcategory,'') ProductSubcategory
,ISNULL(UOM,'') UOM
,UnitPrice
,WholesaleCost
,PurchaseCost
,ProfitMargin           
 FROM [Tbl_Product]                 
   WHERE ClientID=@clientID AND (ExternalNumber is NULL OR ExternalNumber='' OR PushToDenali=1)            
  end      
  else      
  begin      
  SELECT 'ProductData' AS TableName,          
              ProductID,
			  ProductName,
[Vendorid],
Validfromdate,
Validtodate
,ISNULL(Currentcost,'') Currentcost
,ISNULL(Transactioncurrencyid,'') Transactioncurrencyid
,Exchangerate
,ISNULL(Currentcostbase,'') Currentcostbase
,Defaultuomid
,Defaultuomscheduleid
,ISNULL(Description,'') Description
,ISNULL(Iskit,'') Iskit
,ISNULL(Isstockitem,'') Isstockitem
,Parentproductid
,Price
,Pricebase
,ISNULL(Productstructure,'') Productstructure
,ISNULL(ProductstructureDisplay,'') ProductstructureDisplay
,ISNULL(Productnumber,'') Productnumber
,ISNULL(Producttypecode,'') Producttypecode
,ISNULL(ProducttypecodeDisplay,'') ProducttypecodeDisplay
,ISNULL(Producturl,'') Producturl
,ISNULL(Quantitydecimal,'') Quantitydecimal
,ISNULL(Quantityonhand,'') Quantityonhand
,ISNULL(Size,'') Size
,Standardcost
,Standardcostbase
,ISNULL(Statecode,'') Statecode
,ISNULL(Statuscode,'') Statuscode
,ISNULL(Stockvolume,'') Stockvolume
,Stockweight
,ISNULL(Suppliername,'') Suppliername
,ISNULL(Vendorpartnumber,'') Vendorpartnumber
,ISNULL(Hierarchypath,'') Hierarchypath
,Pricelistid
,SKUCode
,ISNULL(ProductCategory,'') ProductCategory
,ISNULL(ProductSubcategory,'') ProductSubcategory
,ISNULL(UOM,'') UOM
,UnitPrice
,WholesaleCost
,PurchaseCost
,ProfitMargin           
 FROM [Tbl_Product]                 
   WHERE ClientID=@clientID AND ExternalNumber >= @sproductno and    ExternalNumber <=   @eproductno      
  end      
      
  -- UPDATE Tbl_Vendor Set PushToDenali=0 Where ExternalNumber IS NOT NULL AND  ExternalNumber !='' AND PushToDenali=1            
 declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Product are Pulled'      
 declare @status varchar(150) = 'Sync Completed'      
 insert into tbl_DenaliSync      
 (syncdate,syncby,syncsts,syncDesc)      
 values      
 (getutcdate(),@accountID,@status,@Description)                 
END      
      
GO
/****** Object:  StoredProcedure [dbo].[SP_PullVendorsToDenali]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
--use BillManagement_Developement_V2            
--use BillManagement_Testing_V2            
--exec SP_PullVendorsToDenali '2000','',''      
            
CREATE PROCEDURE [dbo].[SP_PullVendorsToDenali]              
@accountID NUMERIC(18,0),            
@clientID NUMERIC(18,0),      
@svendorno varchar(50)='',              
@evendorno varchar(50)=''      
AS              
            
BEGIN              
      if(@svendorno='' and @evendorno='')      
   begin      
      SELECT  'VendorData' AS TableName,          
            
      A.VendorID,      
      A.[VendorName]              
            
      ,isnull(A.[Email],'') Email            
            
      ,isnull(A.[City] ,'') [City]          
            
      ,isnull(A.[Country] ,'') [Country]          
            
      ,isnull(A.[Address1]  ,'') [Address1]         
            
         
      ,isnull(A.[PostalCode],'')[PostalCode]      
            
      ,isnull(A.[State]  ,'')[State]          
            
            
      ,isnull(A.[SSNNumber],'')[SSNNumber]            
            
      ,isnull(A.[Phone],'') [Phone]            
            
      ,ISNULL(B.Value1,'Default') AS VendorType            
            
      ,isnull(D.Value1,'') AS PreferredPaymentMethod            
            
      ,isnull(A.[TaxId],'')   [TaxId]      
            
      ,isnull(C.Value1,'') AS PaymentTerm            
            
      ,isnull(A.[LeadTimeDays],'')  LeadTimeDays      
            
      ,isnull(A.[GLCode],'') [GLCode]            
        
   ,isnull(A.ExternalNumber,'') ExternalNumber        
                  
      FROM [Tbl_Vendor] AS A            
            
   LEFT JOIN KeyList AS B            
            
   ON A.VendorType=B.KeylistId AND B.KeyID=5019            
            
   LEFT JOIN KeyList AS C            
            
   ON A.PaymentTerm=C.KeylistId AND C.KeyID=5003            
            
    LEFT JOIN KeyList AS D            
            
   ON A.PrefferedPaymentMethod=D.KeylistId AND D.KeyID=5020            
            
   WHERE A.ClientID=@clientID AND (A.ExternalNumber is NULL OR A.ExternalNumber='' OR A.PushToDenali=1)            
  end      
  else      
  begin      
  SELECT  'VendorData' AS TableName,          
           A.VendorID, 
         A.[VendorName]              
            
      ,isnull(A.[Email],'') Email            
            
      ,isnull(A.[City] ,'') [City]          
            
      ,isnull(A.[Country] ,'') [Country]          
            
      ,isnull(A.[Address1]  ,'') [Address1]         
            
         
      ,isnull(A.[PostalCode],'')[PostalCode]      
            
      ,isnull(A.[State]  ,'')[State]          
            
            
      ,isnull(A.[SSNNumber],'')[SSNNumber]            
            
      ,isnull(A.[Phone],'') [Phone]            
            
      ,ISNULL(B.Value1,'Default') AS VendorType            
            
      ,isnull(D.Value1,'') AS PreferredPaymentMethod            
            
      ,isnull(A.[TaxId],'')   [TaxId]      
            
      ,isnull(C.Value1,'') AS PaymentTerm            
            
      ,isnull(A.[LeadTimeDays],'')  LeadTimeDays      
            
      ,isnull(A.[GLCode],'') [GLCode]            
        
   ,isnull(A.ExternalNumber,'') ExternalNumber        
      
                  
      FROM [Tbl_Vendor] AS A            
            
   LEFT JOIN KeyList AS B            
            
   ON A.VendorType=B.KeylistId AND B.KeyID=5019            
            
   LEFT JOIN KeyList AS C            
            
   ON A.PaymentTerm=C.KeylistId AND C.KeyID=5003            
            
    LEFT JOIN KeyList AS D            
            
   ON A.PrefferedPaymentMethod=D.KeylistId AND D.KeyID=5020            
            
   WHERE A.ClientID=@clientID AND A.ExternalNumber >= @svendorno and    A.ExternalNumber <=   @evendorno      
  end      
      
  -- UPDATE Tbl_Vendor Set PushToDenali=0 Where ExternalNumber IS NOT NULL AND  ExternalNumber !='' AND PushToDenali=1            
 declare @Description varchar(150)= convert(varchar(10),@@rowcount) + ' Vendors are Pulled'      
 declare @status varchar(150) = 'Sync Completed'      
 insert into tbl_DenaliSync      
 (syncdate,syncby,syncsts,syncDesc)      
 values      
 (getutcdate(),@accountID,@status,@Description)      
            
              
            
END      
      
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveConfigurations]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SP_SaveConfigurations]      
@clientID NUMERIC(18,0),      
@isBillChangesAllowed NUMERIC(18,0),      
@isSplitAllowed NUMERIC(18,0),      
@isRecurrenceAllowed NUMERIC(18,0),      
@isBillAssociationsAllowed NUMERIc(18,0),     
@isEpaymentsAllowed NUMERIc(18,0),     
@isOfflinePaymentsAllowed NUMERIc(18,0),     
@isBillExportAllowed NUMERIc(18,0),     
@isVendorImportAllowed NUMERIc(18,0),     
@isAutoApproval NUMERIC(18,0),  
@isMultiApproval NUMERIC(18,0),  
@isDefaultApproval NUMERIC(18,0),  
@isStandardApproval NUMERIC(18,0),  
@isCustomApproval NUMERIC(18,0),  
@savedBy NUMERIC(18,0),
@isPartialApproval  NUMERIC(18,0),
@prefix nvarchar(max),
@issplit numeric(18,0),
@sendmail numeric(18,0),
@terms nvarchar(500),
@note nvarchar(500),
@template nvarchar(max)
AS      
BEGIN      
      DECLARE @count AS NUMERIC(18,0)      
      SET @count=(SELECT COUNT(IDENTITYID) FROM [dbo].[Tbl_Configurations] WHERE ClientId=@clientID)      
      IF (@count=0)      
      BEGIN      
   INSERT INTO [dbo].[Tbl_Configurations]      
   ([ClientID],[IsChangesAllowed],[IsSplitAllowed],[IsRecurrenceEnabled],[IsBillAssociationEnabled],CreatedBy,CreatedON,    
   [IsBillExportEnabled],[IsEpaymentsEnabled],[IsOfflinePaymentsAllowed],[IsImportVendorsAllowed],  
  [IsAutoApproval], [IsMultiApproval],[IsDefaultApproval],[IsStandardApproval],[IsCustomApproval],IsPartialApprovalEnabled)      
   VALUES      
   (@clientID,@isBillChangesAllowed,@isSplitAllowed,@isRecurrenceAllowed,@isBillAssociationsAllowed,@savedBy,GETUTCDATE(),    
   @isBillExportAllowed,@isEpaymentsAllowed,@isOfflinePaymentsAllowed,@isVendorImportAllowed,  
  @isAutoApproval,@isMultiApproval,@isDefaultApproval,@isStandardApproval,@isCustomApproval,@isPartialApproval )      
      END      
      ELSE       
      BEGIN      
   UPDATE Tbl_Configurations      
   SET      
   [IsChangesAllowed]=@isBillChangesAllowed,      
   [IsSplitAllowed]=@isSplitAllowed,      
   [IsRecurrenceEnabled]=@isRecurrenceAllowed,      
   [IsBillAssociationEnabled]=@isBillAssociationsAllowed,      
   UpdatedBy=@savedBy,      
   UpdatedOn=GETUTCDATE(),    
   [IsBillExportEnabled]=@isBillExportAllowed,    
   [IsEpaymentsEnabled]=@isEpaymentsAllowed,    
   [IsOfflinePaymentsAllowed]=@isOfflinePaymentsAllowed,    
   [IsImportVendorsAllowed]=@isVendorImportAllowed,  
   [IsAutoApproval]=@isAutoApproval,   
   [IsMultiApproval]=@isMultiApproval,  
   [IsDefaultApproval]=@isDefaultApproval,  
   [IsStandardApproval]=@isStandardApproval,  
   [IsCustomApproval]=@isCustomApproval  ,
   IsPartialApprovalEnabled=@isPartialApproval
   WHERE ClientID=@clientID      
      END      


	  DECLARE @ARCOUNT AS NUMERIC(18,0)

	
	SET @ARCOUNT=(SELECT COUNT(PreferencesId) FROM [dbo].TBL_ARPreferences WHERE ClientId=@clientID)  
 IF (@ARCOUNT=0)  
BEGIN
	  INSERT INTO TBL_ARPreferences (InvoicePreFix,Shouldallowedsplitinvoice,Shouldallowededitinvoiceafteremailsend,TermsConditions,
Notes,
Invoicetemplate,
ClientId,Createdby) 
VALUES(@prefix,@issplit,@sendmail,@terms,@note,@template,@clientID,@savedBy)
END
   ELSE
	  BEGIN
	  UPDATE TBL_ARPreferences SET InvoicePreFix=@prefix,
Shouldallowedsplitinvoice=@issplit,
Shouldallowededitinvoiceafteremailsend=@sendmail,
TermsConditions=@terms,
Notes=@note,
Invoicetemplate=@template,
Createdby=@savedBy
WHERE ClientId=@clientID
	  END
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_SetMultiApprovers]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SetMultiApprovers]
@ClientID NUMERIC(18,0),
@AccountID NUMERIC(18,0),
@ApproverSequence NUMERIC(18,0)
AS
BEGIN
	UPDATE Tbl_Accounts SET [IsDefaultAccountant]=1,ApproverSeqence=@ApproverSequence Where AccountID=@AccountID AND ClientID=@ClientID
	RETURN @AccountID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_StopRecurring]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_StopRecurring] 
	@invoiceid numeric(18,0),@clientid numeric(18,0)
AS
BEGIN
	UPDATE Tbl_Invoice set IsRecurring=0 where InvoiceId=@invoiceid

	 RETURN @invoiceid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SubmitBill]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SubmitBill]
@billID numeric(18,0),
@vendorName nvarchar(max),
@billDate datetime,
@amount numeric(18,2),
@invoiceNumber  nvarchar(max),
@dueDate datetime,
@category numeric(18,0),
@notes nvarchar(max),
@paymentTerms numeric(18,0),
@description nvarchar(max),
@isSplited nvarchar(max),
@status numeric(18,0),
@comments nvarchar(max),
@accountId numeric(18,0),
@purchaseOrder nvarchar(Max),
@clientId numeric(18,0)
AS
Begin
Declare @VENDORID as numeric(18,0)=0;
Declare @VENDOR_NAME as nvarchar(max)
		If exists(select lower([VendorName]) from [dbo].[Tbl_Vendor] where VendorName=lower(@vendorName))
		begin
			set @VENDORID=(select [VendorID] from [dbo].[Tbl_Vendor] where VendorName=@vendorName)
		end
		else
		begin
			Insert into [dbo].[Tbl_Vendor] ([VendorName],[CreatedOn],[CreatedBy],[ClientID])
			Values
			(@vendorName,getutcdate(),@accountId,@clientId)
			set @VENDORID =(Select MAX([VendorID])  from [Tbl_Vendor])
		end
		if(@VENDORID!=0)
		begin
		Update [dbo].[Tbl_Bill] set [VendorID]=@VENDORID,
					[AccountID]=@accountId,
					[BillDate]=@billDate,
					[Amount]=@amount,
					[Balance]=@amount,
					[InvoiceNumber]=@invoiceNumber,
					[DueDate]=@dueDate,
					[Category]=@category,
					[Notes]=@notes,
					[PaymentTerms]=@paymentTerms,
					[Description]=@description,
					[IsSplitted]=@isSplited,
					[Status]=@status,
					[UpdatedOn]=getutcdate(),
					[UpdatedBy]=@accountId,
					[IsActive]=1,
					[ClientID]=@clientId ,
					[UserComment]=@comments
					,[PurchaseOrder]=@purchaseOrder
					where BillID=@billID
					end
		if(@isSplited=50014)
		begin
		delete from Tbl_BillBreakage where not BillType in('0','50004','50005','50006','50007','50008') and BillID=@billID
		end
		if(@comments!='')
		begin
				insert into Tbl_BillComments (BillID,Comment,CreatedBy,CreatedOn)
				values
				(@billID,@comments,@accountId,getutcdate())
		end
End
GO
/****** Object:  StoredProcedure [dbo].[SP_TE_GetEmailTemplate]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TE_GetEmailTemplate]
@EmailTemplateID NUMERIC(18,0)
AS
BEGIN
SELECT [Subject],[Body] FROM [dbo].[tbl_EmailTemplate] WHERE EmailTemplateID=@EmailTemplateID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_BillBreakage]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Update_BillBreakage]
@billId numeric(18,0),
@billBreakageId numeric(18,0),
@amount numeric(18,2),
@description nvarchar(max),
@billType numeric(18,0),
@status numeric(18,0),
@acconutId numeric(18,0),
@actionKey numeric(18,0)
AS
BEGIN
if(@actionKey=1)
begin
	update Tbl_BillBreakage set
	[BillID]=@billId,[Amount]=@amount,[Description]=@description,[BillType]=@billType,
	[Status]=@status,[UpdatedOn]=getutcdate(),[CreatedBy]=@acconutId,[IsActive]=1 where BillID=@billId and BillBreakageID=@billBreakageId
end
else if(@actionKey=2)
begin
	delete from Tbl_BillBreakage where BillBreakageID=@billBreakageId and BillID=BillID
end
else
begin
	insert into Tbl_BillBreakage([BillID],[Amount],[Description],[BillType],[Status],[CreatedOn],[CreatedBy],IsActive)
	values
	(@billId,@amount,@description,@billType,@status,getutcdate(),@acconutId,1)

	update Tbl_Bill set IsSplitted=50013 where BillID=@billId
end



END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAccountVerifiedStatus]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_UpdateAccountVerifiedStatus]
@userID NUMERIC(18,0),  
@customerID NUMERIC(18,0),  
@accountID NuMERIC(18,0) 
AS
BEGIN 
UPDATE [dbo].[Tbl_ClientBankAccount] SET [Status]=50057,UpdatedBy=@userID,UpdatedOn=GETUTCDATE() WHERE AccountIdentityID=@accountID AND CustomerID=@customerID  
  
 Return @accountID  
 END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateARInvoice]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateARInvoice]
@clientID NUMERIC(18,0),
@updatedBy NUMERIC(18,0),
@customer numeric(10,0),
@invoicedate nvarchar(max),
@paymentterms nvarchar(max),
@invoice nvarchar(max),
@duedate nvarchar(max),
@referanceorder  nvarchar(max),
@status numeric(18,0),
@subtotal numeric(18,2),
@discount numeric(18,2),
@shipping numeric(18,2),
@tax numeric(18,2),
@total numeric(18,2),
@distype nvarchar(max),
@invoiceid numeric(18,0),
@isrecurring numeric(18,0),
@startdate varchar(max),
@enddate varchar(max),
@frequency nvarchar(100),
@billstatus numeric(18,0)
AS
BEGIN
if(@billstatus=5)
begin
		UPDATE  [dbo].Tbl_Invoice  SET
		InvoiceName=@invoice,
		Customerid=@customer,
		Duedate=@duedate,
		Invoicedate=@invoicedate,
		TermCode=@paymentterms,
		ClientId=@clientID,
		Referanceorder=@referanceorder,
		Subtotal=@subtotal,
		Discount=@discount,
		ShippingCharge=@shipping,
		Tax=@tax,
		TotamAmount=@total,
		DiscountType=@distype,
		UpdatedBy=@updatedBy,
		Updatedon=GETUTCDATE(),
		IsRecurring=@isrecurring,
        RecurringStartDate=@startdate,
        RecurrinEendtDate=@enddate,
        Frequency=@frequency,
		BillStatus=5
		WHERE ClientID= @clientID AND InvoiceId=@invoiceid
end
else
begin
UPDATE  [dbo].Tbl_Invoice  SET
		InvoiceName=@invoice,
		Customerid=@customer,
		Duedate=@duedate,
		Invoicedate=@invoicedate,
		TermCode=@paymentterms,
		ClientId=@clientID,
		Referanceorder=@referanceorder,
		Subtotal=@subtotal,
		Discount=@discount,
		ShippingCharge=@shipping,
		Tax=@tax,
		TotamAmount=@total,
		DiscountType=@distype,
		UpdatedBy=@updatedBy,
		Updatedon=GETUTCDATE(),
		IsRecurring=@isrecurring,
        RecurringStartDate=@startdate,
        RecurrinEendtDate=@enddate,
        Frequency=@frequency
		
		WHERE ClientID= @clientID AND InvoiceId=@invoiceid
end
 RETURN @invoiceid  
END






GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBill]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateBill]  
@billID numeric(18,0),  
@vendorName nvarchar(max),  
@billDate datetime,  
@amount numeric(18,2),  
@invoiceNumber  nvarchar(max),  
@dueDate datetime,  
@category numeric(18,0),  
@notes nvarchar(max),  
@paymentTerms numeric(18,0),  
@description nvarchar(max),  
@isSplited nvarchar(max),  
@status numeric(18,0),  
@accountId numeric(18,0),  
@fileSize numeric(18,2),  
@fileDisplayName nvarchar(max),  
@PhysicalLocation nvarchar(max),  
@fileName nvarchar(max),  
@balance numeric(18,2),  
@purchaseOreder nvarchar(Max),  
@clientId numeric(18,0)  ,
@customer NUMERIC(18,0),
@project NUMERIC(18,0)
AS  
Begin  
Declare @VENDORID as numeric(18,0)=0;  
Declare @VENDOR_NAME as nvarchar(max)  
  If exists(select lower([VendorName]) from [dbo].[Tbl_Vendor] where VendorName=lower(@vendorName))  
  begin  
   set @VENDORID=(select [VendorID] from [dbo].[Tbl_Vendor] where VendorName=@vendorName)  
  end  
  else  
  begin  
   Insert into [dbo].[Tbl_Vendor] ([VendorName],[CreatedOn],[CreatedBy],[ClientID])  
   Values  
   (@vendorName,getutcdate(),@accountId,@clientId)  
   set @VENDORID =(Select MAX([VendorID])  from [Tbl_Vendor])  
  end  
  if(@VENDORID!=0)  
  begin  
  Update [dbo].[Tbl_Bill] set [VendorID]=@VENDORID,  
     [AccountID]=@accountId,  
     [BillDate]=@billDate,  
     [Amount]=@amount,  
     [InvoiceNumber]=@invoiceNumber,  
     [DueDate]=@dueDate,  
     [Category]=@category,  
     [Notes]=@notes,  
     [PaymentTerms]=@paymentTerms,  
     [Description]=@description,  
     [IsSplitted]=@isSplited,  
     [Status]=@status,  
     [UpdatedOn]=getutcdate(),  
     [UpdatedBy]=@accountId,  
     [IsActive]=1,  
     [ClientID]=@clientId ,  
     [FileDisplayName]=@fileDisplayName,  
     [PhysicalLocation]=@PhysicalLocation,  
     [FileSize]=@fileSize,  
     [FileName]=@fileName,  
     [Balance]=@balance,  
     [PurchaseOrder]=@purchaseOreder ,
	 Customer=@customer,
	 Project =@project
     where BillID=@billID  
     
  end  
  if(@billDate='')  
  begin  
  update Tbl_Bill set BillDate=null where BillID=@billID  
  end  
  if(@isSplited=50014)  
  begin  
  delete from Tbl_BillBreakage where not BillType in('0','50004','50005','50006','50007','50008') and BillID=@billID  
  end  
End  
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBillCategory]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateBillCategory]
@updatedBy NUMERIC(18,0),
@clientID NUMERIC(18,0),
@status NUMERIC(18,0),
@billCategory NVARCHAR(MAX),
@description NVARCHAR(MAX),
@retVal Numeric(18,0),
@billCategoryId  Numeric(18,0)
AS
BEGIN

UPDATE Tbl_BillCategory
SET 
BillCategory=@billCategory,
[Description]=@description,
[Status]=@status,
UpdatedBy=@updatedBy,
UpdatedOn=GETUTCDATE()
WHERE ClientID=@clientID AND BillCategoryID=@billCategoryId

RETURN @billCategoryId
END









GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBillDetails]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_UpdateBillDetails]            
@accountId NUMERIC(18,0),            
@clientId NUMERIC(18,0),            
@vendorId NUMERIC(18,0),            
@invoiceNumber NVARCHAR(MAX),            
@billDesc NVARCHAR(MAX),            
@paymentTerm NUMERIC(18,0),            
@status NUMERIC(18,0),            
@invoiceDate DATETIME,            
@dueDate DATETIME,            
@amount NUMERIC(18,2),            
@fileName NVARCHAR(MAX),            
@fileDisplayName NVARCHAR(MAX),            
@fileSize NUMERIC(18,2),            
@physicalLocation NVARCHAR(MAX),            
@isAutoApproval NUMERIC(18,0),            
@isRecurring NUMERIC(18,0),            
@isReminder NUMERIC(18,0),            
@reminderEmail NVARCHAR(MAX),            
@reminderInterval NUMERIC(18,0),            
@reminderIntervalDay NVARCHAR(MAX),            
@isSplitted NUMERIC(18,0),            
@recurrneceEndDate DATETIME,            
@batchNumber NUMERIC(18,0),            
@isApplyToAll NUMERIC(18,0),            
@billId NUMERIC(18,0)  ,          
@comment NVARCHAR(MAX)  ,  
@customer NUMERIC(18,0),  
@project NUMERIC(18,0)  ,
@category  NUMERIC(18,0)   
AS            
BEGIN             
            
--Bill Details Update            
    UPDATE Tbl_Bill SET            
 [VendorID]=@vendorId,[InvoiceNumber]=@invoiceNumber,[Description]=@billDesc,[PaymentTerms]=@paymentTerm,            
 [BillDate]=@invoiceDate,[DueDate]=@dueDate,Amount=@amount,Balance=@amount,[Status]=@status,            
 [FileName]=@fileName,[FileDisplayName]=@fileDisplayName,[FileSize]=@fileSize,[PhysicalLocation]=@physicalLocation,            
 [isAutoApproval]=@isAutoApproval,[IsRecurring]=@isRecurring,[IsReminder]=@isReminder,isSplitted=@isSplitted,            
    [ReminderEmail]=@reminderEmail,[ReminderInterval]=@reminderInterval,[ReminderIntervalDay]=@reminderIntervalDay,            
 UpdatedBy=@accountId,UpdatedOn=GETUTCDATE(),[RecurrenceEndDate]=@recurrneceEndDate ,Customer=@customer,Project=@project,BillCategory=@category         
 WHERE BillID=@billId AND ClientID=@clientId            
            
--If bill is auto approval the bill will be inserted in [Tbl_BillApproved]            
 IF(@status=50015 AND (NOT EXISTS (SELECT BillID From Tbl_BillApproved Where BillID=@billId)))            
 BEGIN            
 Insert into [dbo].[Tbl_BillApproved]            
  ([BillID],            
  [ApprovedAmount],            
  [Status],            
  [PaymentStatus],            
  [DueOn],            
  [VendorID],            
  [PayableAmount],            
  [CreatedOn],            
  [CreatedBy],        
  ClientId)            
  Values            
  (@billId,@amount,50015,50023,@dueDate,@vendorId,@amount,getutcdate(),@accountId,@clientId)            
              
  Update Tbl_Bill set Balance=0.00,Status=@status, UpdatedOn=getutcdate(),UpdatedBy=@accountId where BillID=@billId            
              
     Insert Into TBl_ApproveHistory          
 (BillID,ApproverComment,CreatedOn,CreatedBy,ApproverID,Status,ApprovedAmount,BalanceAmount)          
 Values          
 (@billId,@comment,GETUTCDATE(),@accountId,0,50045,@amount,0.00)          
              
 END            
      
 ELSE      
 BEGIN      
  UPDATE TBl_BillApproved Set Status=50015 ,PaymentStatus=50023 ,UpdatedOn=GETUTCDATE(),UpdatedBy=@accountId      
  Where BillId=@billId      
 END      
      
            
 --Updating same details for sam batch numbers            
            
 IF (@batchNumber ! =0 AND @isApplyToAll!=0)            
 BEGIN             
 UPDATE Tbl_Bill SET            
 Amount=@amount,            
 RecurrenceEndDate=@recurrneceEndDate            
 WHERE RecurrenceBatchNumber=@batchNumber            
 END            
            
            
            
 DELETE  FROM Tbl_BillDescription WHERE BillID=@billId            
            
 DELETE FROM Tbl_BillBreakage WHERE BillID=@billId            
            
 DELETE FROM Tbl_BillAttachments WHERE BillID=@billId            
            
 DELETE FROM Tbl_BillComments WHERE BillID=@billId            
             
 DELETE FROM BillStageApproval WHERE BillID=@billId            
            
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBulkBills]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
            
            
--Use  [BillManagement_Developement_V2]--[BillManagement_Testing_V2]                
--Exec SP_GetBillDataToDelnali 2000                
                
  
  
  
CREATE PROCEDURE [dbo].[SP_UpdateBulkBills]            
(@tbl_Bills AS TVP_Bills readonly,@accountID NUMERIC(18,0))            
AS            
BEGIN            
 MERGE INTO Tbl_Bill AS S1            
 USING @tbl_Bills AS S2            
 ON S1.BillID=S2.BillID   AND S1.ClientID=S2.ClientID         
 WHEN MATCHED THEN UPDATE        
 SET [IsUpdatedDenali] =1   ;     
     
     
 declare @Description varchar(150)= convert(varchar(10),@@rowcount) + 'Bills are Posted'    
 declare @status varchar(150) = 'Sync Completed'    
 insert into tbl_DenaliSync    
 (syncdate,syncby,syncsts,syncDesc)    
 values    
 (getutcdate(),@accountID,@status,@Description)    
    
     
END            
            
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBulkPayment]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateBulkPayment]            
(@tbl_Payment AS TVP_Payment readonly,@accountID NUMERIC(18,0))            
AS            
BEGIN            
 MERGE INTO Tbl_Bill AS S1            
 USING @tbl_Payment AS S2            
 ON S1.BillID=S2.BillId  -- AND S1.ClientID=S2.ClientID         
 WHEN MATCHED THEN UPDATE        
 SET [IsUpdatedDenali] =2;     
     
     
    
    
     
END  
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCard]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateCard]  
@cardName Nvarchar(MAX),    
@cardNumber Nvarchar(MAX),    
@expMonth Nvarchar(MAX),  
@expYear Nvarchar(MAX),  
@ccvNumber Nvarchar(MAX),    
@bankName Nvarchar(MAX),    
@isDefault NUMERIC(18,0),    
@userID NUMERIC(18,0),    
@customerID NUMERIC(18,0),    
@referenceID Nvarchar(MAX),  
@cardID  NUMERIC(18,0)  
AS  
BEGIN  
 IF(@isDefault=1)    
   BEGIN    
   UPDATE Tbl_ClientCards SET IsDefault=0    
   END    
   UPDATE Tbl_ClientCards SET   
   [CardName] = @cardName,  
   [CardNumber]=@cardNumber,  
   [ExpiryMonth]=@expMonth,  
   [ExpiryYear]=@expYear,  
   [CCV]=@ccvNumber,  
   [IsDefault]=@isDefault,  
   [ReferenceID]=@referenceID,   
   [BankName] =@bankName,  
   UpdatedBy=@userID,  
   UpdatedOn=GETUTCDATE()  
   WHERE CardIdentityId=@cardID AND CustomerID=@customerID  
   return @cardID  
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateClientAdmin]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateClientAdmin]    
(    
@Firstname nvarchar(max),    
@Lastname nvarchar(max),    
@Companyname nvarchar(max),    
@Emailid nvarchar(max),    
@UpdatedBy numeric(18,0),    
@ClientID numeric(18,0),    
@UserID numeric(18,0)    
)    
AS    
BEGIN    
    
  Update  [dbo].[tbl_Client] set ClientName=@Companyname where ClientID=@ClientID    
    
  Update [dbo].[Tbl_Accounts]     
  set [Username]=@Emailid,    
  [Firstname]=@Firstname,    
  [Lastname]=@Lastname,    
  [PrimaryEmailID]=@Emailid,    
  [UpdatedOn]=GETUTCDATE(),    
  [UpdatedBy]=@UpdatedBy  
   where AccountID=@UserID    
  
   Return @UserID  
    
END    
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateClientAdminPassword]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_UpdateClientAdminPassword]      
@accountId NUMERIC(18,0),      
@password NVARCHAR(MAX) ,    
@clientId NUMERIC(18,0)    
AS      
BEGIN      
 UPDATE Tbl_Accounts SET       
 Password=@password,      
 UpdatedBy=@accountId,      
 UpdatedOn=GETUTCDATE(),      
 Role=50000,      
 IsActive=50042,      
 AdministrationRole=50038,      
 ApplicationRole=1001,      
 [IsPasswordGenerated]=1,   
 IspasswordReseted=1  
 WHERE AccountID=@accountId      
    
 UPDATE Tbl_Client SET Status=50059 Where ClientID=@clientId    
    
 RETURN @accountId      
        
END    
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomApprovalConfiguration]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCustomApprovalConfiguration]  
@isVendorType NUMERIC(18,0),  
@isAmountType NUMERIC(18,0),  
@vendorID NUMERIC(18,0),  
@amount NUMERIC(18,2),  
@secondAmount NUMERIC(18,2),  
@condition NUMERIC(18,0),  
@updatedBy NUMERIC(18,0),  
@clientID NUMERIC(18,0),  
@identityID  NUMERIC(18,0)  
AS   
BEGIN  
   UPDATE [dbo].[Tbl_CustomApprovalConfigurations]  
   SET  
   [IsVendorType]=@isVendorType,  
   [IsAmountType]=@isAmountType,  
   [VendorID]=@vendorID,  
   [Amount]=@amount,  
   [Condition]=@condition,  
   [UpdatedOn]=GETUTCDATE(),  
   [UpdatedBy]=@updatedBy,  
   [IsActive]=1,  
   SecondAmount=@secondAmount  
   WHERE ClientID=@clientID AND IdentityID=@identityID  
  
  UPDATE Tbl_Configurations SET IsAutoApproval=0,IsMultiApproval=0,IsDefaultApproval=0,IsStandardApproval=0,
  IsCustomApproval=1 WHERE ClientID=@clientID

   DELETE FROM [dbo].[Tbl_CustomApprovers] Where ClientID=@clientID AND [ConfigID]=@identityID 
   RETURN @identityID
END

select * from Tbl_CustomApprovalConfigurations
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomer]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCustomer]
@clientID NUMERIC(18,0),
@updatedBy NUMERIC(18,0),
@customerName NVARCHAR(MAX),
@customerType NUMERIC(18,0),
@email NVARCHAR(MAX),
@contactNumber NVARCHAR(MAX),
@address NVARCHAR(MAX),
@city  NVARCHAR(MAX),
@state NVARCHAR(MAX),
@zip NVARCHAR(MAX),
@logo NVARCHAR(MAX),
@customerId NUMERIC(18,0),
@retVal NUMERIC(18,0),
@paymentterm NUMERIC(18,0),
@paymentmethod NUMERIC(18,0),
@shippingaddress NVARCHAR(MAX),
@billingaddress NVARCHAR(MAX),
@accountholdername NVARCHAR(MAX),
@accountnumber NVARCHAR(MAX),
@routingnumber NVARCHAR(MAX)


AS
BEGIN
		UPDATE  [dbo].[Tbl_Customers]  SET
		[CustomerName]=@customerName,
		[CutomerType]=@customerType,
		[Email]=@email,
		[ContactNumber]=@contactNumber,
		[CustomerAddress]=@address,
		[City]=@city,
		[State]=@state,
		[Zip]=@zip,
		[CustomerLogo]=@logo,
		[ClientID]=@clientID,
		[UpdatedOn]=GETUTCDATE(),
		[UpdatedBy]=@updatedBy,
		PaymentTerms=@paymentterm,
		PaymentMethod=@paymentmethod,
		Shippingaddress=@shippingaddress,
		BillingAddress=@billingaddress,
		AccountHoldername=@accountholdername,
		AccountNumber=@accountnumber,
		RoutingNumber=@routingnumber
		WHERE ClientID= @clientID AND CustomerID=@customerId
 RETURN @customerId  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomer360Contact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SP_UpdateCustomer360Contact]
@firstName NVARCHAR(max),@lastName NVARCHAR(MAX),@email NVARCHAR(MAX),@phoneNumber NVARCHAR(MAX),
@updatedBy NUMERIC(18,0),@customerID numeric(18,0),@clientID nvarchar(max),@contactID NVARCHAR(MAX)
AS
BEGIN
	UPDATE Tbl_Customer360Contact SET
	[Name]=@firstName,
	Email=@email,
	Phoneno=@phoneNumber,
	UpdatedBy=@updatedBy,
	UpdatedOn=GETUTCDATE(),
	LastName=@lastName,
	OrderByDate=GETUTCDATE()
	WHERE ContactId=@contactID AND ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomer360Note]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateCustomer360Note] 
	@CustmerID NUMERIC(18,0),@clientID NUMERIC(18,0),@notes NVARCHAR(MAX),
	@updatedBy NUMERIC(10,0),@notesID NUMERIC(18,0)
AS
BEGIN
	UPDATE Tbl_Customer3600Notes SET 
	Notes=@notes,
	UpdatedBy=@updatedBy,
	UpdatedOn=GETUTCDATE()
	WHERE CustomerNotesID=@notesID AND ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomerContact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCustomerContact]
@firstName NVARCHAR(max),@lastName NVARCHAR(MAX),@email NVARCHAR(MAX),@phoneNumber NVARCHAR(MAX),
@updatedBy NUMERIC(18,0),@customerID numeric(18,0),@clientID nvarchar(max),@contactID NVARCHAR(MAX)
AS
BEGIN
	UPDATE Tbl_CustomerContact SET
	[Name]=@firstName,
	Email=@email,
	Phoneno=@phoneNumber,
	UpdatedBy=@updatedBy,
	UpdatedOn=GETUTCDATE(),
	LastName=@lastName,
	OrderByDate=GETUTCDATE()
	WHERE ContactId=@contactID AND ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomerNote]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCustomerNote] 
	@CustmerID NUMERIC(18,0),@clientID NUMERIC(18,0),@notes NVARCHAR(MAX),
	@updatedBy NUMERIC(10,0),@notesID NUMERIC(18,0)
AS
BEGIN
	UPDATE Tbl_CustomerNotes SET 
	Notes=@notes,
	UpdatedBy=@updatedBy,
	UpdatedOn=GETUTCDATE()
	WHERE CustomerNotesID=@notesID AND ClientID=@clientID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDwollaAudit]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateDwollaAudit]    
@fundId NVARCHAR(MAX),    
@responseID NVARCHAR(MAX),      
@status NUMERIC(18,0),    
@actionName NVARCHAR(MAX) ,  
@failedRemarks NVARCHAR(MAX)  
AS    
BEGIN    
   --Status Update    
            DECLARE @billID AS NUMERIC(18,0)    
   SET @billID = (SELECT TOP(1) BillID From Tbl_BillApproved  WHERE [DwollaFundID]=@fundId)    
   IF(@status=50044)    
   BEGIN    
       UPDATE Tbl_BillApproved Set PaymentStatus=@status,Status=@status ,PaidOn=GETUTCDATE() WHERE [DwollaFundID]=@fundId   OR  [BankTransferID]= @fundId  
   END    
   ELSE IF(@status=50024)   
   BEGIN    
    UPDATE Tbl_BillApproved Set PaymentStatus=@status,Status=@status  WHERE [DwollaFundID]=@fundId  OR  [BankTransferID]= @fundId
    UPDATE [dbo].[Tbl_DwollaTransactions] SET [Remarks]=@failedRemarks WHERE FundId=@fundId  OR  [BankTransferID]= @fundId
   END    
    
   UPDATE  Tbl_Bill SET [Status]=@status WHERE BillID=@billID    
    
    
   --AuditInsert    
    
   INSERT INTO [dbo].[Tbl_DwollaTransferAudit]    
   ([FundID],[ResponseID],[ActionName],[Status],[CreatedOn])    
   VALUES    
   (@fundId,@responseID,@actionName,@status,GETUTCDATE())    
    
       
END 
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDwollaDetails]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateDwollaDetails]  
@vendorID NUMERIC(18,0),  
@custID NVARCHAR(MAX),  
@fundID NVARCHAR(MAX)  
AS  
BEGIN  
  UPDATE Tbl_Vendor SET IsAddedToDwolla=1,  
  DwollaCustomerID=@custID,  
  DwollaFundID=@fundID  
 WHERE VendorID=@vendorID  
  RETURN @vendorID  
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDwollaTransaction]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateDwollaTransaction]    
@billId NUMERIC(18,0),    
@approvedBillID  NUMERIC(18,0),     
@fundId NVARCHAR(MAX),    
@bankTransferID NVARCHAR(MAX)
,@transferredBy NUMERIC(18,0)    
AS    
BEGIN    
   UPDATE Tbl_Bill SET [Status]=50087,UpdatedBy=@transferredBy,UpdatedOn=GETUTCDATE() Where BillID=@billId    
   UPDATE Tbl_BillApproved SET[DwollaFundID]= @fundId,[BankTransferID]=@bankTransferID,[Status]=50087,PaymentStatus=50088,UpdatedBy=@transferredBy,  
   UpdatedOn=GETUTCDATE(),PaymentMode=50072 Where IdentityID=@approvedBillID    
END    
  
  
    
  
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateGLCategory]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UpdateGLCategory]
@catgoryName NVARCHAR(MAX),
@glCode NVARCHAR(MAX),
@glDescription NVARCHAR(MAX),
@status NVARCHAR(MAX),
@updatedBy NUMERIC(18,0),
@glIdentity NUMERIC(18,0)
AS
BEGIN
     UPDATE Tbl_GlCodes SET 

	 [GLNumber]=@glCode,[GLDescription]=@glDescription,
	 [UpdatedBy]=@updatedBy,[updatedOn]=GETUTCDATE(),
	[CategoryName]=@catgoryName,[IsActive]=@status
	WHERE IdentityID=@glIdentity

	DELETE FROM Tbl_GlCodes Where MasterGLCode=@glIdentity

	RETURN @glIdentity
	
END















GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateInvoiceAR]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateInvoiceAR]
@clientID NUMERIC(18,0),
@updatedBy NUMERIC(18,0),
@product numeric(10,0),
@quantity NUMERIC(18,0),
@price numeric(18,2),
@discount numeric(18,2),
@tax numeric(18,2),
@amount  numeric(18,2),
@distype NVARCHAR(MAX),
@invoiceid numeric(18,0),
@billstatus numeric(18,0)

AS
BEGIN

		UPDATE  [dbo].Tbl_OrderInvoice  SET
		Amount=@amount,
		Discount=@discount,
		Product=@product,
		ClientId=@clientID,
		quantity=@quantity,
		Price=@price,
		Tax=@tax,
		Discounttype=@distype,
		[UpdatedOn]=GETUTCDATE(),
		[UpdatedBy]=@updatedBy
		WHERE ClientID= @clientID AND OrderInvoice=@invoiceid
 RETURN @invoiceid  
END

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateInvoiceStaus]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateInvoiceStaus]
@invoiceno numeric(18,0),@value numeric(18,0),@userid numeric(18,0),@actionname nvarchar(200)
AS
BEGIN
DECLARE @action NVARCHAR(200),@invoiceid NUMERIC(18,0),@accountid NUMERIC(18,0)

	UPDATE  Tbl_Invoice SET BillStatus=@value,PaidOn=Getutcdate()
WHERE InvoiceId=@invoiceno

EXEC SP_InsertTimeLine @action=@actionname,@invoiceid=@invoiceno,@accountid=@userid

END


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateOfflineInvoiceStaus]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateOfflineInvoiceStaus]
@invoiceid numeric(18,0),@userID numeric(18,0)
AS
BEGIN
	UPDATE  Tbl_Invoice SET BillStatus=2 ,Ismarkaspaid=1
WHERE InvoiceId=@invoiceid


EXEC SP_InsertTimeLine @action='Payment Completed By Fully',@invoiceid=@invoiceid,@accountid=@userID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProject]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateProject]
@clientID NUMERIC(18,0),
@updatedBy NUMERIC(18,0),
@projectName NVARCHAR(MAX),
@customer NUMERIC(18,0),
@projectDescription NVARCHAR(MAX),
@projectType NUMERIC(18,0),
@status NUMERIC(18,0),
@projectID NUMERIC(18,0)
AS
BEGIN
		UPDATE  Tbl_Projects SET
		ProjectName=@projectName
		,Customer=@customer
		,ProjectDescription=@projectDescription
		,ProjectType=@projectType
		,ProjectStatus=@status
		,ClientID=@clientID
		,UpdatedOn=GETUTCDATE()
		,UpdatedBy=@updatedBy
		WHERE ProjectID=@projectID AND ClientID =@clientID

		RETURN @projectID
		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRecurringInvoice]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateRecurringInvoice] 
	@invoiceid numeric(18,0),@clientid numeric(18,0),@startdate nvarchar(max),
	@enddate nvarchar(max),@frequency nvarchar(30)
AS
BEGIN
	UPDATE TBL_Invoice set RecurringStartDate=@startdate,RecurrinEendtDate=@enddate,
	Frequency=@frequency where InvoiceId=@invoiceid --and ClientId=@clientid
	
	return @invoiceid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateVendor]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateVendor]          
@vendorName NVARCHAR(MAX),          
@firstName NVARCHAR(MAX),          
@lastName NVARCHAR (MAX),          
@email NVARCHAR(MAX),          
@addresLineOne NVARCHAR(MAX),          
@addresLineTwo NVARCHAR(MAX),          
@city NVARCHAR(MAX),          
@state NVARCHAR(MAX),          
@zip NVARCHAR(MAX),           
@contact NVARCHAR(MAX),          
@SSN NVARCHAR(MAX),       
@url NVARCHAR(MAX),        
--Newly added columns,          
@vendorType NUMERIC(18,0),          
@prefferedPaymentMethod NUMERIC(18,0),          
@taxId NVARCHAR(MAX),          
@paymentTerm NUMERIC(18,0),          
@vendorID NUMERIC(18,0),          
@clientID NUMERIC(18,0),          
@updatedBy NUMERIC(18,0),          
@referenceID NVARCHAR(MAX),      
@leadTime NVARCHAR(MAX),      
@vendorLogo NVARCHAR(MAX)  ,    
@paypalEmailAddress  NVARCHAR(MAX) ,    
@paypalMobileNumber  NVARCHAR(MAX) ,    
@GLCode NVARCHAR(MAX)='0',  
@externalNumber Nvarchar(MAX)  
AS          
BEGIN          
  UPDATE Tbl_Vendor          
  SET          
  VendorName =@vendorName,          
  FirstName=@firstName,          
  LastName=@lastName,          
  Email=@email,          
  Address1=@addresLineOne,          
  Address2=@addresLineTwo,          
  City=@city,          
  [State]=@state,          
  PostalCode=@zip,          
  Phone=@contact,          
  SSNNumber=@SSN,          
  VendorType=@vendorType,          
  PrefferedPaymentMethod=@prefferedPaymentMethod,          
  TaxId=@taxId,          
  PaymentTerm=@paymentTerm,          
  UpdatedBy=@updatedBy,          
  UpdatedOn=GETUTCDATE(),          
  ReferenceID=@referenceID ,      
  [LeadTimeDays]=@leadTime,      
  WebsiteURL=@url,      
  VendorLogo = @vendorLogo  ,    
  [PaypalEmailAddress]=@paypalEmailAddress,    
  [PaypalMobileNumber]=@paypalMobileNumber    
  ,[GLCode]=@GLCode    
  ,ExternalNumber=@externalNumber  
  WHERE VendorID=@vendorID AND ClientID=@clientID          
          
  RETURN @vendorID          
           
END    
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateVendorContact]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateVendorContact]
@firstName NVARCHAR(MAX),
@lastName NVARCHAR(MAX),
@email NVARCHAR(MAX),
@phoneNumber NVARCHAR(MAX),
@updatedBy Numeric(18,0),
@vendorID Numeric(18,0),
@clientID Numeric(18,0)	,
@contactID NUMERIC(18,0)
AS
BEGIN
	Update VendorContact SET
	[FirstName]=@firstName,
	[LastName]=@lastName,
	[Email]=@email,
	[Phone]=@phoneNumber,
	[UpdatedOn]=GETUTCDATE(),
	UpdatedBy=@updatedBy
	WHERE ContactIdentityId=@contactID AND [ClientID]=@clientID
	Return @contactID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ValidateAmountSlab]    Script Date: 15-04-2022 16:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ValidateAmountSlab]  
@firstAmount NUMERIC(18,2),  
@lastAmount NUMERIC(18,2),  
@editConfigID NUMERIC(18,0),
@clientID NUMERIC(18,0)  
AS  
BEGIN  
		IF(@editConfigID=0)
		BEGIN
                        Select 'AmountSlab' AS TableName, Count(IdentityID)  AS PreviousCondition  from [dbo].[Tbl_CustomApprovalConfigurations] 
								Where 
								((Amount<=@firstAmount AND SecondAmount>= @firstAmount) 
								OR ( Amount<=@lastAmount AND SecondAmount>= @lastAmount)
								OR (Amount>@firstAmount AND SecondAmount<@lastAmount)) AND ClientID=@clientID  
       END
       ELSE
	   BEGIN
	     Select 'AmountSlab' AS TableName, Count(IdentityID)  AS PreviousCondition  from [dbo].[Tbl_CustomApprovalConfigurations] 
								Where 
								((Amount<=@firstAmount AND SecondAmount>= @firstAmount) 
								OR ( Amount<=@lastAmount AND SecondAmount>= @lastAmount)
								OR (Amount>@firstAmount AND SecondAmount<@lastAmount)) AND ClientID=@clientID  AND IdentityID!=@editConfigID
	   END
  
END



	
GO
USE [master]
GO
ALTER DATABASE [BillManagement_Developement_V2] SET  READ_WRITE 
GO
