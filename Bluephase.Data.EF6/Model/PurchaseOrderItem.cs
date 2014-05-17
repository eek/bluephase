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
    
    public partial class PurchaseOrderItem
    {
        public int PurchaseOrderItemId { get; set; }
        public int PurchaseOrderId { get; set; }
        public int MaterialId { get; set; }
        public Nullable<int> ProductionOrderId { get; set; }
        public double Quantity { get; set; }
        public System.DateTime ExpectedDelivery { get; set; }
        public Nullable<System.DateTime> ActualDelivery { get; set; }
        public string Status { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual Material Material { get; set; }
        public virtual ProductionOrder ProductionOrder { get; set; }
        public virtual PurchaseOrder PurchaseOrder { get; set; }
    }
}