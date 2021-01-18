﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cbmsWA
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ModelEntities : DbContext
    {
        public ModelEntities()
            : base("name=ModelEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccessRule> AccessRules { get; set; }
        public virtual DbSet<Application> Applications { get; set; }
        public virtual DbSet<Area> Areas { get; set; }
        public virtual DbSet<Currency> Currencies { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<IdentityType> IdentityTypes { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<Rank> Ranks { get; set; }
        public virtual DbSet<Rank1> Ranks1 { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<RulesInGroup> RulesInGroups { get; set; }
        public virtual DbSet<Station> Stations { get; set; }
        public virtual DbSet<Stock> Stocks { get; set; }
        public virtual DbSet<UserDetail> UserDetails { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<VatTable> VatTables { get; set; }
        public virtual DbSet<Bureau> Bureaus { get; set; }
        public virtual DbSet<TransType> TransTypes { get; set; }
        public virtual DbSet<qryopenningBal> qryopenningBals { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<AuditLog> AuditLogs { get; set; }
        public virtual DbSet<StockPurSum> StockPurSums { get; set; }
        public virtual DbSet<StockSaleSum> StockSaleSums { get; set; }
        public virtual DbSet<BOGStockPosition> BOGStockPositions { get; set; }
        public virtual DbSet<Purchase> Purchases { get; set; }
        public virtual DbSet<Sale> Sales { get; set; }
        public virtual DbSet<PurchasesDTime> PurchasesDTimes { get; set; }
        public virtual DbSet<SalesDTime> SalesDTimes { get; set; }
        public virtual DbSet<BOGPucRate> BOGPucRates { get; set; }
        public virtual DbSet<BOGSalesRate> BOGSalesRates { get; set; }
        public virtual DbSet<WeeklyRate> WeeklyRates { get; set; }
        public virtual DbSet<WEEKLYDATE> WEEKLYDATES { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }
    }
}