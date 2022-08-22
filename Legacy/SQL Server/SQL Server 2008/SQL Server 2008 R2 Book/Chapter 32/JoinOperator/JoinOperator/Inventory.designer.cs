﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4927
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JoinOperator
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="Inventory")]
	public partial class InventoryDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertProduct(Product instance);
    partial void UpdateProduct(Product instance);
    partial void DeleteProduct(Product instance);
    partial void InsertSupplier(Supplier instance);
    partial void UpdateSupplier(Supplier instance);
    partial void DeleteSupplier(Supplier instance);
    #endregion
		
		public InventoryDataContext() : 
				base(global::JoinOperator.Properties.Settings.Default.InventoryConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public InventoryDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public InventoryDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public InventoryDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public InventoryDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Product> Products
		{
			get
			{
				return this.GetTable<Product>();
			}
		}
		
		public System.Data.Linq.Table<Supplier> Suppliers
		{
			get
			{
				return this.GetTable<Supplier>();
			}
		}
	}
	
	[Table(Name="dbo.Products")]
	public partial class Product : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _ProductID;
		
		private string _ProductName;
		
		private int _SupplierID;
		
		private decimal _UnitPrice;
		
		private System.Nullable<short> _UnitsInStock;
		
		private System.Nullable<short> _UnitsOnOrder;
		
		private System.Nullable<short> _ReorderLevel;
		
		private bool _Discontinued;
		
		private EntityRef<Supplier> _Supplier;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnProductIDChanging(int value);
    partial void OnProductIDChanged();
    partial void OnProductNameChanging(string value);
    partial void OnProductNameChanged();
    partial void OnSupplierIDChanging(int value);
    partial void OnSupplierIDChanged();
    partial void OnUnitPriceChanging(decimal value);
    partial void OnUnitPriceChanged();
    partial void OnUnitsInStockChanging(System.Nullable<short> value);
    partial void OnUnitsInStockChanged();
    partial void OnUnitsOnOrderChanging(System.Nullable<short> value);
    partial void OnUnitsOnOrderChanged();
    partial void OnReorderLevelChanging(System.Nullable<short> value);
    partial void OnReorderLevelChanged();
    partial void OnDiscontinuedChanging(bool value);
    partial void OnDiscontinuedChanged();
    #endregion
		
		public Product()
		{
			this._Supplier = default(EntityRef<Supplier>);
			OnCreated();
		}
		
		[Column(Storage="_ProductID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int ProductID
		{
			get
			{
				return this._ProductID;
			}
			set
			{
				if ((this._ProductID != value))
				{
					this.OnProductIDChanging(value);
					this.SendPropertyChanging();
					this._ProductID = value;
					this.SendPropertyChanged("ProductID");
					this.OnProductIDChanged();
				}
			}
		}
		
		[Column(Storage="_ProductName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string ProductName
		{
			get
			{
				return this._ProductName;
			}
			set
			{
				if ((this._ProductName != value))
				{
					this.OnProductNameChanging(value);
					this.SendPropertyChanging();
					this._ProductName = value;
					this.SendPropertyChanged("ProductName");
					this.OnProductNameChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierID", DbType="Int NOT NULL")]
		public int SupplierID
		{
			get
			{
				return this._SupplierID;
			}
			set
			{
				if ((this._SupplierID != value))
				{
					if (this._Supplier.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.OnSupplierIDChanging(value);
					this.SendPropertyChanging();
					this._SupplierID = value;
					this.SendPropertyChanged("SupplierID");
					this.OnSupplierIDChanged();
				}
			}
		}
		
		[Column(Storage="_UnitPrice", DbType="Money NOT NULL")]
		public decimal UnitPrice
		{
			get
			{
				return this._UnitPrice;
			}
			set
			{
				if ((this._UnitPrice != value))
				{
					this.OnUnitPriceChanging(value);
					this.SendPropertyChanging();
					this._UnitPrice = value;
					this.SendPropertyChanged("UnitPrice");
					this.OnUnitPriceChanged();
				}
			}
		}
		
		[Column(Storage="_UnitsInStock", DbType="SmallInt")]
		public System.Nullable<short> UnitsInStock
		{
			get
			{
				return this._UnitsInStock;
			}
			set
			{
				if ((this._UnitsInStock != value))
				{
					this.OnUnitsInStockChanging(value);
					this.SendPropertyChanging();
					this._UnitsInStock = value;
					this.SendPropertyChanged("UnitsInStock");
					this.OnUnitsInStockChanged();
				}
			}
		}
		
		[Column(Storage="_UnitsOnOrder", DbType="SmallInt")]
		public System.Nullable<short> UnitsOnOrder
		{
			get
			{
				return this._UnitsOnOrder;
			}
			set
			{
				if ((this._UnitsOnOrder != value))
				{
					this.OnUnitsOnOrderChanging(value);
					this.SendPropertyChanging();
					this._UnitsOnOrder = value;
					this.SendPropertyChanged("UnitsOnOrder");
					this.OnUnitsOnOrderChanged();
				}
			}
		}
		
		[Column(Storage="_ReorderLevel", DbType="SmallInt")]
		public System.Nullable<short> ReorderLevel
		{
			get
			{
				return this._ReorderLevel;
			}
			set
			{
				if ((this._ReorderLevel != value))
				{
					this.OnReorderLevelChanging(value);
					this.SendPropertyChanging();
					this._ReorderLevel = value;
					this.SendPropertyChanged("ReorderLevel");
					this.OnReorderLevelChanged();
				}
			}
		}
		
		[Column(Storage="_Discontinued", DbType="Bit NOT NULL")]
		public bool Discontinued
		{
			get
			{
				return this._Discontinued;
			}
			set
			{
				if ((this._Discontinued != value))
				{
					this.OnDiscontinuedChanging(value);
					this.SendPropertyChanging();
					this._Discontinued = value;
					this.SendPropertyChanged("Discontinued");
					this.OnDiscontinuedChanged();
				}
			}
		}
		
		[Association(Name="Supplier_Product", Storage="_Supplier", ThisKey="SupplierID", OtherKey="SupplierID", IsForeignKey=true)]
		public Supplier Supplier
		{
			get
			{
				return this._Supplier.Entity;
			}
			set
			{
				Supplier previousValue = this._Supplier.Entity;
				if (((previousValue != value) 
							|| (this._Supplier.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Supplier.Entity = null;
						previousValue.Products.Remove(this);
					}
					this._Supplier.Entity = value;
					if ((value != null))
					{
						value.Products.Add(this);
						this._SupplierID = value.SupplierID;
					}
					else
					{
						this._SupplierID = default(int);
					}
					this.SendPropertyChanged("Supplier");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[Table(Name="dbo.Suppliers")]
	public partial class Supplier : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _SupplierID;
		
		private string _SupplierName;
		
		private string _SupplierContactName;
		
		private string _SupplierContactDesignation;
		
		private string _SupplierAddress;
		
		private string _SupplierCity;
		
		private string _SupplierState;
		
		private string _SupplierPostalCode;
		
		private string _SupplierCountry;
		
		private string _SupplierPhone;
		
		private EntitySet<Product> _Products;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnSupplierIDChanging(int value);
    partial void OnSupplierIDChanged();
    partial void OnSupplierNameChanging(string value);
    partial void OnSupplierNameChanged();
    partial void OnSupplierContactNameChanging(string value);
    partial void OnSupplierContactNameChanged();
    partial void OnSupplierContactDesignationChanging(string value);
    partial void OnSupplierContactDesignationChanged();
    partial void OnSupplierAddressChanging(string value);
    partial void OnSupplierAddressChanged();
    partial void OnSupplierCityChanging(string value);
    partial void OnSupplierCityChanged();
    partial void OnSupplierStateChanging(string value);
    partial void OnSupplierStateChanged();
    partial void OnSupplierPostalCodeChanging(string value);
    partial void OnSupplierPostalCodeChanged();
    partial void OnSupplierCountryChanging(string value);
    partial void OnSupplierCountryChanged();
    partial void OnSupplierPhoneChanging(string value);
    partial void OnSupplierPhoneChanged();
    #endregion
		
		public Supplier()
		{
			this._Products = new EntitySet<Product>(new Action<Product>(this.attach_Products), new Action<Product>(this.detach_Products));
			OnCreated();
		}
		
		[Column(Storage="_SupplierID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int SupplierID
		{
			get
			{
				return this._SupplierID;
			}
			set
			{
				if ((this._SupplierID != value))
				{
					this.OnSupplierIDChanging(value);
					this.SendPropertyChanging();
					this._SupplierID = value;
					this.SendPropertyChanged("SupplierID");
					this.OnSupplierIDChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierName", DbType="NVarChar(40) NOT NULL", CanBeNull=false)]
		public string SupplierName
		{
			get
			{
				return this._SupplierName;
			}
			set
			{
				if ((this._SupplierName != value))
				{
					this.OnSupplierNameChanging(value);
					this.SendPropertyChanging();
					this._SupplierName = value;
					this.SendPropertyChanged("SupplierName");
					this.OnSupplierNameChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierContactName", DbType="NVarChar(30)")]
		public string SupplierContactName
		{
			get
			{
				return this._SupplierContactName;
			}
			set
			{
				if ((this._SupplierContactName != value))
				{
					this.OnSupplierContactNameChanging(value);
					this.SendPropertyChanging();
					this._SupplierContactName = value;
					this.SendPropertyChanged("SupplierContactName");
					this.OnSupplierContactNameChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierContactDesignation", DbType="NVarChar(30)")]
		public string SupplierContactDesignation
		{
			get
			{
				return this._SupplierContactDesignation;
			}
			set
			{
				if ((this._SupplierContactDesignation != value))
				{
					this.OnSupplierContactDesignationChanging(value);
					this.SendPropertyChanging();
					this._SupplierContactDesignation = value;
					this.SendPropertyChanged("SupplierContactDesignation");
					this.OnSupplierContactDesignationChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierAddress", DbType="NVarChar(100)")]
		public string SupplierAddress
		{
			get
			{
				return this._SupplierAddress;
			}
			set
			{
				if ((this._SupplierAddress != value))
				{
					this.OnSupplierAddressChanging(value);
					this.SendPropertyChanging();
					this._SupplierAddress = value;
					this.SendPropertyChanged("SupplierAddress");
					this.OnSupplierAddressChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierCity", DbType="NVarChar(30)")]
		public string SupplierCity
		{
			get
			{
				return this._SupplierCity;
			}
			set
			{
				if ((this._SupplierCity != value))
				{
					this.OnSupplierCityChanging(value);
					this.SendPropertyChanging();
					this._SupplierCity = value;
					this.SendPropertyChanged("SupplierCity");
					this.OnSupplierCityChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierState", DbType="NVarChar(30)")]
		public string SupplierState
		{
			get
			{
				return this._SupplierState;
			}
			set
			{
				if ((this._SupplierState != value))
				{
					this.OnSupplierStateChanging(value);
					this.SendPropertyChanging();
					this._SupplierState = value;
					this.SendPropertyChanged("SupplierState");
					this.OnSupplierStateChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierPostalCode", DbType="NVarChar(10)")]
		public string SupplierPostalCode
		{
			get
			{
				return this._SupplierPostalCode;
			}
			set
			{
				if ((this._SupplierPostalCode != value))
				{
					this.OnSupplierPostalCodeChanging(value);
					this.SendPropertyChanging();
					this._SupplierPostalCode = value;
					this.SendPropertyChanged("SupplierPostalCode");
					this.OnSupplierPostalCodeChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierCountry", DbType="NVarChar(30)")]
		public string SupplierCountry
		{
			get
			{
				return this._SupplierCountry;
			}
			set
			{
				if ((this._SupplierCountry != value))
				{
					this.OnSupplierCountryChanging(value);
					this.SendPropertyChanging();
					this._SupplierCountry = value;
					this.SendPropertyChanged("SupplierCountry");
					this.OnSupplierCountryChanged();
				}
			}
		}
		
		[Column(Storage="_SupplierPhone", DbType="NVarChar(25)")]
		public string SupplierPhone
		{
			get
			{
				return this._SupplierPhone;
			}
			set
			{
				if ((this._SupplierPhone != value))
				{
					this.OnSupplierPhoneChanging(value);
					this.SendPropertyChanging();
					this._SupplierPhone = value;
					this.SendPropertyChanged("SupplierPhone");
					this.OnSupplierPhoneChanged();
				}
			}
		}
		
		[Association(Name="Supplier_Product", Storage="_Products", ThisKey="SupplierID", OtherKey="SupplierID")]
		public EntitySet<Product> Products
		{
			get
			{
				return this._Products;
			}
			set
			{
				this._Products.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Products(Product entity)
		{
			this.SendPropertyChanging();
			entity.Supplier = this;
		}
		
		private void detach_Products(Product entity)
		{
			this.SendPropertyChanging();
			entity.Supplier = null;
		}
	}
}
#pragma warning restore 1591
