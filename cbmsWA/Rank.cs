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
    
    public partial class Rank
    {
        public int RankId { get; set; }
        public string RankName { get; set; }
    
        public virtual Rank Rank1 { get; set; }
        public virtual Rank Rank2 { get; set; }
    }
}
