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

namespace OrderByOperator
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
    partial void InsertCustomer(Customer instance);
    partial void UpdateCustomer(Customer instance);
    partial void DeleteCustomer(Customer instance);
    #endregion
		
		public InventoryDataContext() : 
				base(global::OrderByOperator.Properties.Settings.Default.InventoryConnectionString, mappingSource)
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
		
		public System.Data.Linq.Table<Customer> Customers
		{
			get
			{
				return this.GetTable<Customer>();
			}
		}
	}
	
	[Table(Name="dbo.Customers")]
	public partial class Customer : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _CustomerID;
		
		private string _CustName;
		
		private string _CustCompanyName;
		
		private string _CustDesignation;
		
		private string _CustAddress;
		
		private string _CustCity;
		
		private string _CustState;
		
		private string _CustPostalCode;
		
		private string _CustCountry;
		
		private string _CustPhone;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCustomerIDChanging(int value);
    partial void OnCustomerIDChanged();
    partial void OnCustNameChanging(string value);
    partial void OnCustNameChanged();
    partial void OnCustCompanyNameChanging(string value);
    partial void OnCustCompanyNameChanged();
    partial void OnCustDesignationChanging(string value);
    partial void OnCustDesignationChanged();
    partial void OnCustAddressChanging(string value);
    partial void OnCustAddressChanged();
    partial void OnCustCityChanging(string value);
    partial void OnCustCityChanged();
    partial void OnCustStateChanging(string value);
    partial void OnCustStateChanged();
    partial void OnCustPostalCodeChanging(string value);
    partial void OnCustPostalCodeChanged();
    partial void OnCustCountryChanging(string value);
    partial void OnCustCountryChanged();
    partial void OnCustPhoneChanging(string value);
    partial void OnCustPhoneChanged();
    #endregion
		
		public Customer()
		{
			OnCreated();
		}
		
		[Column(Storage="_CustomerID", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int CustomerID
		{
			get
			{
				return this._CustomerID;
			}
			set
			{
				if ((this._CustomerID != value))
				{
					this.OnCustomerIDChanging(value);
					this.SendPropertyChanging();
					this._CustomerID = value;
					this.SendPropertyChanged("CustomerID");
					this.OnCustomerIDChanged();
				}
			}
		}
		
		[Column(Storage="_CustName", DbType="NVarChar(30) NOT NULL", CanBeNull=false)]
		public string CustName
		{
			get
			{
				return this._CustName;
			}
			set
			{
				if ((this._CustName != value))
				{
					this.OnCustNameChanging(value);
					this.SendPropertyChanging();
					this._CustName = value;
					this.SendPropertyChanged("CustName");
					this.OnCustNameChanged();
				}
			}
		}
		
		[Column(Storage="_CustCompanyName", DbType="NVarChar(40)")]
		public string CustCompanyName
		{
			get
			{
				return this._CustCompanyName;
			}
			set
			{
				if ((this._CustCompanyName != value))
				{
					this.OnCustCompanyNameChanging(value);
					this.SendPropertyChanging();
					this._CustCompanyName = value;
					this.SendPropertyChanged("CustCompanyName");
					this.OnCustCompanyNameChanged();
				}
			}
		}
		
		[Column(Storage="_CustDesignation", DbType="NVarChar(30)")]
		public string CustDesignation
		{
			get
			{
				return this._CustDesignation;
			}
			set
			{
				if ((this._CustDesignation != value))
				{
					this.OnCustDesignationChanging(value);
					this.SendPropertyChanging();
					this._CustDesignation = value;
					this.SendPropertyChanged("CustDesignation");
					this.OnCustDesignationChanged();
				}
			}
		}
		
		[Column(Storage="_CustAddress", DbType="NVarChar(100)")]
		public string CustAddress
		{
			get
			{
				return this._CustAddress;
			}
			set
			{
				if ((this._CustAddress != value))
				{
					this.OnCustAddressChanging(value);
					this.SendPropertyChanging();
					this._CustAddress = value;
					this.SendPropertyChanged("CustAddress");
					this.OnCustAddressChanged();
				}
			}
		}
		
		[Column(Storage="_CustCity", DbType="NVarChar(30)")]
		public string CustCity
		{
			get
			{
				return this._CustCity;
			}
			set
			{
				if ((this._CustCity != value))
				{
					this.OnCustCityChanging(value);
					this.SendPropertyChanging();
					this._CustCity = value;
					this.SendPropertyChanged("CustCity");
					this.OnCustCityChanged();
				}
			}
		}
		
		[Column(Storage="_CustState", DbType="NVarChar(30)")]
		public string CustState
		{
			get
			{
				return this._CustState;
			}
			set
			{
				if ((this._CustState != value))
				{
					this.OnCustStateChanging(value);
					this.SendPropertyChanging();
					this._CustState = value;
					this.SendPropertyChanged("CustState");
					this.OnCustStateChanged();
				}
			}
		}
		
		[Column(Storage="_CustPostalCode", DbType="NVarChar(10)")]
		public string CustPostalCode
		{
			get
			{
				return this._CustPostalCode;
			}
			set
			{
				if ((this._CustPostalCode != value))
				{
					this.OnCustPostalCodeChanging(value);
					this.SendPropertyChanging();
					this._CustPostalCode = value;
					this.SendPropertyChanged("CustPostalCode");
					this.OnCustPostalCodeChanged();
				}
			}
		}
		
		[Column(Storage="_CustCountry", DbType="NVarChar(30)")]
		public string CustCountry
		{
			get
			{
				return this._CustCountry;
			}
			set
			{
				if ((this._CustCountry != value))
				{
					this.OnCustCountryChanging(value);
					this.SendPropertyChanging();
					this._CustCountry = value;
					this.SendPropertyChanged("CustCountry");
					this.OnCustCountryChanged();
				}
			}
		}
		
		[Column(Storage="_CustPhone", DbType="NVarChar(25)")]
		public string CustPhone
		{
			get
			{
				return this._CustPhone;
			}
			set
			{
				if ((this._CustPhone != value))
				{
					this.OnCustPhoneChanging(value);
					this.SendPropertyChanging();
					this._CustPhone = value;
					this.SendPropertyChanged("CustPhone");
					this.OnCustPhoneChanged();
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
}
#pragma warning restore 1591