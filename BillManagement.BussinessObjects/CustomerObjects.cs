using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BillManagement.BussinessObjects
{
  public  class CustomerObjects
    {
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        public int CustomerType { get; set; }
        public string Email { get; set; }
        public string ContactNumber { get; set; }
        public string CustomerAddress { get; set; }
        public string City { get; set; }
        public string Zip { get; set; }
        public string State { get; set; }
        public string CustomerLogo { get; set; }
        public int ClientID { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedOn { get; set; }

        public int PaymentTerms { get; set; }
        public int PaymentMethod { get; set; }

        public string Shippingaddress { get; set; }
        public string BillingAddress { get; set; }
        public string AccountHoldername { get; set; }
        public string AccountNumber { get; set; }
        public string RoutingNumber { get; set; }
       



    }



    public class CustomerarObjects
    {
        
        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string CustomerdAddress { get; set; }
        public string Cityd { get; set; }
        public string Zipd { get; set; }
        public string Stated { get; set; }
        public string CustomerbAddress { get; set; }
        public string Cityb { get; set; }
        public string Zipb { get; set; }
        public string Stateb { get; set; }
        public int PaymentTerms { get; set; }
        public int PaymentMethod { get; set; }

    }

    public class InvoiceObjects
    {
        public int Customer { get; set; }
        public string Invoicedate { get; set; }
        public string Paymentterms { get; set; }
        public string Invoice { get; set; }
        public string Duedate { get; set; }
        public string Referanceorder { get; set; }
        public int Paymenttype { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Discount { get; set; }
        public decimal Shipping { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }
        public string Distype { get; set; }
        public int Isrecurring { get; set; }
        public string Recurringstartdate { get; set; }
        public string Recurringenddate { get; set; }
        public string Frequency { get; set; }



    }


    public class UpdateinvoiceObjects
    {
        public int Customer { get; set; }
        public string Invoicedate { get; set; }
        public string Paymentterms { get; set; }
        public string Invoice { get; set; }
        public string Duedate { get; set; }
        public string Referanceorder { get; set; }
        public int Status { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Discount { get; set; }
        public decimal Shipping { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }
        public string Distype { get; set; }

        public int Invoiceid { get; set; }
        public int Isrecurring { get; set; }

        public string Recurringstartdate { get; set; }
        public string Recurringenddate { get; set; }
        public string Frequency { get; set; }
        public int Billstatus { get; set; }

        

    }

}
