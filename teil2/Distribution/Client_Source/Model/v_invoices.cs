//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBClient.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class v_invoices
    {
        public int ID_Invoice { get; set; }
        public Nullable<System.DateTime> InvoiceDate { get; set; }
        public int ID_Customer { get; set; }
        public bool Closed { get; set; }
        public Nullable<decimal> BetragOhneGutschrift { get; set; }
        public Nullable<decimal> BetragMitGutschrift { get; set; }
    }
}
