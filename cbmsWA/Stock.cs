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
    
    public partial class Stock
    {
        public long ID { get; set; }
        public string ReceiptNo { get; set; }
        public string CurrencyID { get; set; }
        public System.DateTime Dated { get; set; }
        public double Amount { get; set; }
        public Nullable<double> CediEquivalent { get; set; }
        public string Username { get; set; }
        public Nullable<byte> Deleted { get; set; }
        public Nullable<double> Rate { get; set; }
        public int TransType { get; set; }
        public Nullable<int> BureauID { get; set; }
        public Nullable<System.DateTime> DTime { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public string Active { get; set; }
    
        public virtual Bureau Bureau { get; set; }
        public virtual TransType TransType1 { get; set; }
        public virtual Company Company { get; set; }
    }
}
