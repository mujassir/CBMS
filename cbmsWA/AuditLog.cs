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
    
    public partial class AuditLog
    {
        public int AuditId { get; set; }
        public string Username { get; set; }
        public string Action { get; set; }
        public System.DateTime ActionDate { get; set; }
        public Nullable<int> StationID { get; set; }
        public Nullable<int> AreaID { get; set; }
    
        public virtual Area Area { get; set; }
    }
}