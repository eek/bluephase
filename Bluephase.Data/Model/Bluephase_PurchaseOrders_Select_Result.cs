//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bluephase.Data.Model
{
    using System;
    
    public partial class Bluephase_PurchaseOrders_Select_Result
    {
        public int PurchaseOrderId { get; set; }
        public int SupplierId { get; set; }
        public int SupplierPersonId { get; set; }
        public string InternalReference { get; set; }
        public System.DateTime OrderedOn { get; set; }
        public bool HasBeenSent { get; set; }
        public bool HasBeenApproved { get; set; }
        public string Status { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    }
}