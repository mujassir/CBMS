//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Purchase
    {
        public string ReceiptNo { get; set; }
        public string CurrencyId { get; set; }
        public double Amount { get; set; }
        public double PurchaseRate { get; set; }
        public double CediEquivalent { get; set; }
        public System.DateTime Dated { get; set; }
        public string Username { get; set; }
        public System.DateTime DTime { get; set; }
        public string FirstName { get; set; }
        public string SurName { get; set; }
        public string Gender { get; set; }
        public string CustAddress { get; set; }
        public int TransactionType { get; set; }
        public string Physical { get; set; }
        public string Region { get; set; }
        public string Nationality { get; set; }
        public int IdentityType { get; set; }
        public string IdentityNo { get; set; }
        public string TinNumber { get; set; }
        public Nullable<byte> Deleted { get; set; }
        public string PreviousName { get; set; }
        public string MiddleName { get; set; }
        public Nullable<System.DateTime> DOBirth { get; set; }
        public int CompanyID { get; set; }
        public int BureauID { get; set; }
        public string Active { get; set; }
    
        public virtual Bureau Bureau { get; set; }
        public virtual Company Company { get; set; }
        public virtual IdentityType IdentityType1 { get; set; }
    }
}