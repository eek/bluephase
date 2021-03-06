//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bluephase.Data.EF6.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class NonConformancy
    {
        public int NonConformancyId { get; set; }
        public int SalesOrderItemId { get; set; }
        public int PartVersionId { get; set; }
        public System.DateTime RaisedOn { get; set; }
        public int RaisedBy { get; set; }
        public int QuantityAffected { get; set; }
        public int QuantityRejected { get; set; }
        public string Reason { get; set; }
        public string RemedialAction { get; set; }
        public string PreventativeAction { get; set; }
        public Nullable<System.DateTime> ClosedOn { get; set; }
        public Nullable<int> ClosedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual PartVersion PartVersion { get; set; }
        public virtual Person Person { get; set; }
        public virtual Person Person1 { get; set; }
        public virtual SalesOrderItem SalesOrderItem { get; set; }
    }
}
