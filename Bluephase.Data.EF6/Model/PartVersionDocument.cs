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
    
    public partial class PartVersionDocument
    {
        public int PartVersionId { get; set; }
        public int DocumentId { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual Document Document { get; set; }
        public virtual PartVersion PartVersion { get; set; }
    }
}
