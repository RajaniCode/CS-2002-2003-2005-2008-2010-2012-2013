//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.1433
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("StockHistoryModel", "CompanyPriceHistory", "Company", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(StockHistoryModel.Company), "PriceHistory", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(StockHistoryModel.PriceHistory))]

// Original file name:
// Generation date: 5/9/2008 7:25:57 PM
namespace StockHistoryModel
{
    
    /// <summary>
    /// There are no comments for StockHistoryEntities in the schema.
    /// </summary>
    public partial class StockHistoryEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new StockHistoryEntities object using the connection string found in the 'StockHistoryEntities' section of the application configuration file.
        /// </summary>
        public StockHistoryEntities() : 
                base("name=StockHistoryEntities", "StockHistoryEntities")
        {
        }
        /// <summary>
        /// Initialize a new StockHistoryEntities object.
        /// </summary>
        public StockHistoryEntities(string connectionString) : 
                base(connectionString, "StockHistoryEntities")
        {
        }
        /// <summary>
        /// Initialize a new StockHistoryEntities object.
        /// </summary>
        public StockHistoryEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "StockHistoryEntities")
        {
        }
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public global::System.Data.Objects.ObjectQuery<Company> Company
        {
            get
            {
                if ((this._Company == null))
                {
                    this._Company = base.CreateQuery<Company>("[Company]");
                }
                return this._Company;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Company> _Company;
        /// <summary>
        /// There are no comments for PriceHistory in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public global::System.Data.Objects.ObjectQuery<PriceHistory> PriceHistory
        {
            get
            {
                if ((this._PriceHistory == null))
                {
                    this._PriceHistory = base.CreateQuery<PriceHistory>("[PriceHistory]");
                }
                return this._PriceHistory;
            }
        }
        private global::System.Data.Objects.ObjectQuery<PriceHistory> _PriceHistory;
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        public void AddToCompany(Company company)
        {
            base.AddObject("Company", company);
        }
        /// <summary>
        /// There are no comments for PriceHistory in the schema.
        /// </summary>
        public void AddToPriceHistory(PriceHistory priceHistory)
        {
            base.AddObject("PriceHistory", priceHistory);
        }
    }
    /// <summary>
    /// There are no comments for StockHistoryModel.Company in the schema.
    /// </summary>
    /// <KeyProperties>
    /// CompanyID
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="StockHistoryModel", Name="Company")]
    [global::System.Runtime.Serialization.DataContractAttribute()]
    [global::System.Serializable()]
    public partial class Company : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Company object.
        /// </summary>
        /// <param name="companyID">Initial value of CompanyID.</param>
        /// <param name="companyName">Initial value of CompanyName.</param>
        /// <param name="companySymbol">Initial value of CompanySymbol.</param>
        public static Company CreateCompany(int companyID, string companyName, string companySymbol)
        {
            Company company = new Company();
            company.CompanyID = companyID;
            company.CompanyName = companyName;
            company.CompanySymbol = companySymbol;
            return company;
        }
        /// <summary>
        /// There are no comments for Property CompanyID in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int CompanyID
        {
            get
            {
                return this._CompanyID;
            }
            set
            {
                this.OnCompanyIDChanging(value);
                this.ReportPropertyChanging("CompanyID");
                this._CompanyID = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("CompanyID");
                this.OnCompanyIDChanged();
            }
        }
        private int _CompanyID;
        partial void OnCompanyIDChanging(int value);
        partial void OnCompanyIDChanged();
        /// <summary>
        /// There are no comments for Property CompanyName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanyName
        {
            get
            {
                return this._CompanyName;
            }
            set
            {
                this.OnCompanyNameChanging(value);
                this.ReportPropertyChanging("CompanyName");
                this._CompanyName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false, 30);
                this.ReportPropertyChanged("CompanyName");
                this.OnCompanyNameChanged();
            }
        }
        private string _CompanyName;
        partial void OnCompanyNameChanging(string value);
        partial void OnCompanyNameChanged();
        /// <summary>
        /// There are no comments for Property CompanySymbol in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanySymbol
        {
            get
            {
                return this._CompanySymbol;
            }
            set
            {
                this.OnCompanySymbolChanging(value);
                this.ReportPropertyChanging("CompanySymbol");
                this._CompanySymbol = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false, 6);
                this.ReportPropertyChanged("CompanySymbol");
                this.OnCompanySymbolChanged();
            }
        }
        private string _CompanySymbol;
        partial void OnCompanySymbolChanging(string value);
        partial void OnCompanySymbolChanged();
        /// <summary>
        /// There are no comments for PriceHistory in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("StockHistoryModel", "CompanyPriceHistory", "PriceHistory")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public global::System.Data.Objects.DataClasses.EntityCollection<PriceHistory> PriceHistory
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<PriceHistory>("StockHistoryModel.CompanyPriceHistory", "PriceHistory");
            }
        }
    }
    /// <summary>
    /// There are no comments for StockHistoryModel.PriceHistory in the schema.
    /// </summary>
    /// <KeyProperties>
    /// QuoteID
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="StockHistoryModel", Name="PriceHistory")]
    [global::System.Runtime.Serialization.DataContractAttribute()]
    [global::System.Serializable()]
    public partial class PriceHistory : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new PriceHistory object.
        /// </summary>
        /// <param name="quoteID">Initial value of QuoteID.</param>
        /// <param name="whenRequested">Initial value of WhenRequested.</param>
        public static PriceHistory CreatePriceHistory(int quoteID, global::System.DateTime whenRequested)
        {
            PriceHistory priceHistory = new PriceHistory();
            priceHistory.QuoteID = quoteID;
            priceHistory.WhenRequested = whenRequested;
            return priceHistory;
        }
        /// <summary>
        /// There are no comments for Property QuoteID in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int QuoteID
        {
            get
            {
                return this._QuoteID;
            }
            set
            {
                this.OnQuoteIDChanging(value);
                this.ReportPropertyChanging("QuoteID");
                this._QuoteID = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("QuoteID");
                this.OnQuoteIDChanged();
            }
        }
        private int _QuoteID;
        partial void OnQuoteIDChanging(int value);
        partial void OnQuoteIDChanged();
        /// <summary>
        /// There are no comments for Property WhenRequested in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime WhenRequested
        {
            get
            {
                return this._WhenRequested;
            }
            set
            {
                this.OnWhenRequestedChanging(value);
                this.ReportPropertyChanging("WhenRequested");
                this._WhenRequested = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, global::System.DateTimeKind.Unspecified, true);
                this.ReportPropertyChanged("WhenRequested");
                this.OnWhenRequestedChanged();
            }
        }
        private global::System.DateTime _WhenRequested;
        partial void OnWhenRequestedChanging(global::System.DateTime value);
        partial void OnWhenRequestedChanged();
        /// <summary>
        /// There are no comments for Property OpeningPrice in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<decimal> OpeningPrice
        {
            get
            {
                return this._OpeningPrice;
            }
            set
            {
                this.OnOpeningPriceChanging(value);
                this.ReportPropertyChanging("OpeningPrice");
                this._OpeningPrice = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, 18, 2);
                this.ReportPropertyChanged("OpeningPrice");
                this.OnOpeningPriceChanged();
            }
        }
        private global::System.Nullable<decimal> _OpeningPrice;
        partial void OnOpeningPriceChanging(global::System.Nullable<decimal> value);
        partial void OnOpeningPriceChanged();
        /// <summary>
        /// There are no comments for Property LastTradePrice in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<decimal> LastTradePrice
        {
            get
            {
                return this._LastTradePrice;
            }
            set
            {
                this.OnLastTradePriceChanging(value);
                this.ReportPropertyChanging("LastTradePrice");
                this._LastTradePrice = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, 18, 2);
                this.ReportPropertyChanged("LastTradePrice");
                this.OnLastTradePriceChanged();
            }
        }
        private global::System.Nullable<decimal> _LastTradePrice;
        partial void OnLastTradePriceChanging(global::System.Nullable<decimal> value);
        partial void OnLastTradePriceChanged();
        /// <summary>
        /// There are no comments for Property LastTradeTime in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<global::System.DateTime> LastTradeTime
        {
            get
            {
                return this._LastTradeTime;
            }
            set
            {
                this.OnLastTradeTimeChanging(value);
                this.ReportPropertyChanging("LastTradeTime");
                this._LastTradeTime = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, global::System.DateTimeKind.Unspecified, false);
                this.ReportPropertyChanged("LastTradeTime");
                this.OnLastTradeTimeChanged();
            }
        }
        private global::System.Nullable<global::System.DateTime> _LastTradeTime;
        partial void OnLastTradeTimeChanging(global::System.Nullable<global::System.DateTime> value);
        partial void OnLastTradeTimeChanged();
        /// <summary>
        /// There are no comments for Property CurrentPrice in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<decimal> CurrentPrice
        {
            get
            {
                return this._CurrentPrice;
            }
            set
            {
                this.OnCurrentPriceChanging(value);
                this.ReportPropertyChanging("CurrentPrice");
                this._CurrentPrice = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, 18, 2);
                this.ReportPropertyChanged("CurrentPrice");
                this.OnCurrentPriceChanged();
            }
        }
        private global::System.Nullable<decimal> _CurrentPrice;
        partial void OnCurrentPriceChanging(global::System.Nullable<decimal> value);
        partial void OnCurrentPriceChanged();
        /// <summary>
        /// There are no comments for Property TodaysHigh in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<decimal> TodaysHigh
        {
            get
            {
                return this._TodaysHigh;
            }
            set
            {
                this.OnTodaysHighChanging(value);
                this.ReportPropertyChanging("TodaysHigh");
                this._TodaysHigh = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, 18, 2);
                this.ReportPropertyChanged("TodaysHigh");
                this.OnTodaysHighChanged();
            }
        }
        private global::System.Nullable<decimal> _TodaysHigh;
        partial void OnTodaysHighChanging(global::System.Nullable<decimal> value);
        partial void OnTodaysHighChanged();
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("StockHistoryModel", "CompanyPriceHistory", "Company")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public Company Company
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("StockHistoryModel.CompanyPriceHistory", "Company").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("StockHistoryModel.CompanyPriceHistory", "Company").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public global::System.Data.Objects.DataClasses.EntityReference<Company> CompanyReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("StockHistoryModel.CompanyPriceHistory", "Company");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Company>("StockHistoryModel.CompanyPriceHistory", "Company", value);
                }
            }
        }
    }
}