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
    using System.Collections.Generic;
    
    public partial class ProductionCentre
    {
        public ProductionCentre()
        {
            this.ProductionOperations = new HashSet<ProductionOperation>();
            this.ProductionOrderOperations = new HashSet<ProductionOrderOperation>();
        }
    
        public int ProductionCentreId { get; set; }
        public string Name { get; set; }
        public string UniqueName { get; set; }
        public int ProductionCentreTypeId { get; set; }
        public Nullable<decimal> HourlyRate { get; set; }
        public Nullable<double> HoursPerWeek { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual ICollection<ProductionOperation> ProductionOperations { get; set; }
        public virtual ProductionCentreType ProductionCentreType { get; set; }
        public virtual ICollection<ProductionOrderOperation> ProductionOrderOperations { get; set; }
    }
}