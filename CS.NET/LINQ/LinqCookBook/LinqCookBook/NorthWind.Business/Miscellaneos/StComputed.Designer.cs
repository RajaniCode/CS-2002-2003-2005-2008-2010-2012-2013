﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]

// Original file name:
// Generation date: 11/10/2008 5:12:52 PM
namespace NorthWind.Business.EF.Miscellaneos
{
    
    /// <summary>
    /// There are no comments for StComputedEntities in the schema.
    /// </summary>
    public partial class StComputedEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new StComputedEntities object using the connection string found in the 'StComputedEntities' section of the application configuration file.
        /// </summary>
        public StComputedEntities() : 
                base("name=StComputedEntities", "StComputedEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new StComputedEntities object.
        /// </summary>
        public StComputedEntities(string connectionString) : 
                base(connectionString, "StComputedEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new StComputedEntities object.
        /// </summary>
        public StComputedEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "StComputedEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Supplier in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Supplier> Supplier
        {
            get
            {
                if ((this._Supplier == null))
                {
                    this._Supplier = base.CreateQuery<Supplier>("[Supplier]");
                }
                return this._Supplier;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Supplier> _Supplier;
        /// <summary>
        /// There are no comments for Supplier in the schema.
        /// </summary>
        public void AddToSupplier(Supplier supplier)
        {
            base.AddObject("Supplier", supplier);
        }
    }
    /// <summary>
    /// There are no comments for StComputedModel.Supplier in the schema.
    /// </summary>
    /// <KeyProperties>
    /// SupplierId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="StComputedModel", Name="Supplier")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Supplier : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Supplier object.
        /// </summary>
        /// <param name="supplierId">Initial value of SupplierId.</param>
        /// <param name="supplierName">Initial value of SupplierName.</param>
        /// <param name="timeStamp">Initial value of TimeStamp.</param>
        public static Supplier CreateSupplier(int supplierId, string supplierName, byte[] timeStamp)
        {
            Supplier supplier = new Supplier();
            supplier.SupplierId = supplierId;
            supplier.SupplierName = supplierName;
            supplier.TimeStamp = timeStamp;
            return supplier;
        }
        /// <summary>
        /// There are no comments for Property SupplierId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int SupplierId
        {
            get
            {
                return this._SupplierId;
            }
            set
            {
                this.OnSupplierIdChanging(value);
                this.ReportPropertyChanging("SupplierId");
                this._SupplierId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("SupplierId");
                this.OnSupplierIdChanged();
            }
        }
        private int _SupplierId;
        partial void OnSupplierIdChanging(int value);
        partial void OnSupplierIdChanged();
        /// <summary>
        /// There are no comments for Property SupplierName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string SupplierName
        {
            get
            {
                return this._SupplierName;
            }
            set
            {
                this.OnSupplierNameChanging(value);
                this.ReportPropertyChanging("SupplierName");
                this._SupplierName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("SupplierName");
                this.OnSupplierNameChanged();
            }
        }
        private string _SupplierName;
        partial void OnSupplierNameChanging(string value);
        partial void OnSupplierNameChanged();
        /// <summary>
        /// There are no comments for Property CreateDate in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<global::System.DateTime> CreateDate
        {
            get
            {
                return this._CreateDate;
            }
            set
            {
                this.OnCreateDateChanging(value);
                this.ReportPropertyChanging("CreateDate");
                this._CreateDate = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("CreateDate");
                this.OnCreateDateChanged();
            }
        }
        private global::System.Nullable<global::System.DateTime> _CreateDate;
        partial void OnCreateDateChanging(global::System.Nullable<global::System.DateTime> value);
        partial void OnCreateDateChanged();
        /// <summary>
        /// There are no comments for Property modifiedDate in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<global::System.DateTime> modifiedDate
        {
            get
            {
                return this._modifiedDate;
            }
            set
            {
                this.OnmodifiedDateChanging(value);
                this.ReportPropertyChanging("modifiedDate");
                this._modifiedDate = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("modifiedDate");
                this.OnmodifiedDateChanged();
            }
        }
        private global::System.Nullable<global::System.DateTime> _modifiedDate;
        partial void OnmodifiedDateChanging(global::System.Nullable<global::System.DateTime> value);
        partial void OnmodifiedDateChanged();
        /// <summary>
        /// There are no comments for Property TimeStamp in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public byte[] TimeStamp
        {
            get
            {
                return global::System.Data.Objects.DataClasses.StructuralObject.GetValidValue(this._TimeStamp);
            }
            set
            {
                this.OnTimeStampChanging(value);
                this.ReportPropertyChanging("TimeStamp");
                this._TimeStamp = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("TimeStamp");
                this.OnTimeStampChanged();
            }
        }
        private byte[] _TimeStamp;
        partial void OnTimeStampChanging(byte[] value);
        partial void OnTimeStampChanged();
    }
}