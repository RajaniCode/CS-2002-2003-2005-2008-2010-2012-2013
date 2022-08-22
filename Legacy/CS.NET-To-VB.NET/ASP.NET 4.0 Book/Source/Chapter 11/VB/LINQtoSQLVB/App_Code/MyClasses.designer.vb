﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.1
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<Global.System.Data.Linq.Mapping.DatabaseAttribute(Name:="Northwind")>  _
Partial Public Class MyClassesDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource()
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub InsertProduct(instance As Product)
    End Sub
  Partial Private Sub UpdateProduct(instance As Product)
    End Sub
  Partial Private Sub DeleteProduct(instance As Product)
    End Sub
  #End Region
	
	Public Sub New()
		MyBase.New(Global.System.Configuration.ConfigurationManager.ConnectionStrings("NorthwindConnectionString").ConnectionString, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property Products() As System.Data.Linq.Table(Of Product)
		Get
			Return Me.GetTable(Of Product)
		End Get
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.Products")>  _
Partial Public Class Product
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _ProductID As Integer
	
	Private _ProductName As String
	
	Private _SupplierID As System.Nullable(Of Integer)
	
	Private _CategoryID As System.Nullable(Of Integer)
	
	Private _QuantityPerUnit As String
	
	Private _UnitPrice As System.Nullable(Of Decimal)
	
	Private _UnitsInStock As System.Nullable(Of Short)
	
	Private _UnitsOnOrder As System.Nullable(Of Short)
	
	Private _ReorderLevel As System.Nullable(Of Short)
	
	Private _Discontinued As Boolean
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnProductIDChanging(value As Integer)
    End Sub
    Partial Private Sub OnProductIDChanged()
    End Sub
    Partial Private Sub OnProductNameChanging(value As String)
    End Sub
    Partial Private Sub OnProductNameChanged()
    End Sub
    Partial Private Sub OnSupplierIDChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnSupplierIDChanged()
    End Sub
    Partial Private Sub OnCategoryIDChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnCategoryIDChanged()
    End Sub
    Partial Private Sub OnQuantityPerUnitChanging(value As String)
    End Sub
    Partial Private Sub OnQuantityPerUnitChanged()
    End Sub
    Partial Private Sub OnUnitPriceChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnUnitPriceChanged()
    End Sub
    Partial Private Sub OnUnitsInStockChanging(value As System.Nullable(Of Short))
    End Sub
    Partial Private Sub OnUnitsInStockChanged()
    End Sub
    Partial Private Sub OnUnitsOnOrderChanging(value As System.Nullable(Of Short))
    End Sub
    Partial Private Sub OnUnitsOnOrderChanged()
    End Sub
    Partial Private Sub OnReorderLevelChanging(value As System.Nullable(Of Short))
    End Sub
    Partial Private Sub OnReorderLevelChanged()
    End Sub
    Partial Private Sub OnDiscontinuedChanging(value As Boolean)
    End Sub
    Partial Private Sub OnDiscontinuedChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_ProductID", AutoSync:=AutoSync.OnInsert, DbType:="Int NOT NULL IDENTITY", IsPrimaryKey:=true, IsDbGenerated:=true)>  _
	Public Property ProductID() As Integer
		Get
			Return Me._ProductID
		End Get
		Set
			If ((Me._ProductID = value)  _
						= false) Then
				Me.OnProductIDChanging(value)
				Me.SendPropertyChanging
				Me._ProductID = value
				Me.SendPropertyChanged("ProductID")
				Me.OnProductIDChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_ProductName", DbType:="NVarChar(40) NOT NULL", CanBeNull:=false)>  _
	Public Property ProductName() As String
		Get
			Return Me._ProductName
		End Get
		Set
			If (String.Equals(Me._ProductName, value) = false) Then
				Me.OnProductNameChanging(value)
				Me.SendPropertyChanging
				Me._ProductName = value
				Me.SendPropertyChanged("ProductName")
				Me.OnProductNameChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_SupplierID", DbType:="Int")>  _
	Public Property SupplierID() As System.Nullable(Of Integer)
		Get
			Return Me._SupplierID
		End Get
		Set
			If (Me._SupplierID.Equals(value) = false) Then
				Me.OnSupplierIDChanging(value)
				Me.SendPropertyChanging
				Me._SupplierID = value
				Me.SendPropertyChanged("SupplierID")
				Me.OnSupplierIDChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_CategoryID", DbType:="Int")>  _
	Public Property CategoryID() As System.Nullable(Of Integer)
		Get
			Return Me._CategoryID
		End Get
		Set
			If (Me._CategoryID.Equals(value) = false) Then
				Me.OnCategoryIDChanging(value)
				Me.SendPropertyChanging
				Me._CategoryID = value
				Me.SendPropertyChanged("CategoryID")
				Me.OnCategoryIDChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_QuantityPerUnit", DbType:="NVarChar(20)")>  _
	Public Property QuantityPerUnit() As String
		Get
			Return Me._QuantityPerUnit
		End Get
		Set
			If (String.Equals(Me._QuantityPerUnit, value) = false) Then
				Me.OnQuantityPerUnitChanging(value)
				Me.SendPropertyChanging
				Me._QuantityPerUnit = value
				Me.SendPropertyChanged("QuantityPerUnit")
				Me.OnQuantityPerUnitChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_UnitPrice", DbType:="Money")>  _
	Public Property UnitPrice() As System.Nullable(Of Decimal)
		Get
			Return Me._UnitPrice
		End Get
		Set
			If (Me._UnitPrice.Equals(value) = false) Then
				Me.OnUnitPriceChanging(value)
				Me.SendPropertyChanging
				Me._UnitPrice = value
				Me.SendPropertyChanged("UnitPrice")
				Me.OnUnitPriceChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_UnitsInStock", DbType:="SmallInt")>  _
	Public Property UnitsInStock() As System.Nullable(Of Short)
		Get
			Return Me._UnitsInStock
		End Get
		Set
			If (Me._UnitsInStock.Equals(value) = false) Then
				Me.OnUnitsInStockChanging(value)
				Me.SendPropertyChanging
				Me._UnitsInStock = value
				Me.SendPropertyChanged("UnitsInStock")
				Me.OnUnitsInStockChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_UnitsOnOrder", DbType:="SmallInt")>  _
	Public Property UnitsOnOrder() As System.Nullable(Of Short)
		Get
			Return Me._UnitsOnOrder
		End Get
		Set
			If (Me._UnitsOnOrder.Equals(value) = false) Then
				Me.OnUnitsOnOrderChanging(value)
				Me.SendPropertyChanging
				Me._UnitsOnOrder = value
				Me.SendPropertyChanged("UnitsOnOrder")
				Me.OnUnitsOnOrderChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_ReorderLevel", DbType:="SmallInt")>  _
	Public Property ReorderLevel() As System.Nullable(Of Short)
		Get
			Return Me._ReorderLevel
		End Get
		Set
			If (Me._ReorderLevel.Equals(value) = false) Then
				Me.OnReorderLevelChanging(value)
				Me.SendPropertyChanging
				Me._ReorderLevel = value
				Me.SendPropertyChanged("ReorderLevel")
				Me.OnReorderLevelChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Discontinued", DbType:="Bit NOT NULL")>  _
	Public Property Discontinued() As Boolean
		Get
			Return Me._Discontinued
		End Get
		Set
			If ((Me._Discontinued = value)  _
						= false) Then
				Me.OnDiscontinuedChanging(value)
				Me.SendPropertyChanging
				Me._Discontinued = value
				Me.SendPropertyChanged("Discontinued")
				Me.OnDiscontinuedChanged
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class
