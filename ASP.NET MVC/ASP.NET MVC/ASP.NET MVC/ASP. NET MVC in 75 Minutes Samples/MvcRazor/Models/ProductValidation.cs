using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace MvcRazor.Models
{
    // Needs the following using statement:
    // using System.ComponentModel.DataAnnotations;

    [MetadataType(typeof(Product_Validation))]
    public partial class Product : IValidatableObject
    {
            public IEnumerable<ValidationResult> Validate(ValidationContext vc)
        {
            if (Discontinued && UnitsOnOrder > 0)
            {
                yield return new ValidationResult(
                    "We should not be ordering products that have been discontinued.",
                    new string[] { "UnitsOnOrder" }
                    );
            }
        }   
    }

    public class Product_Validation
    {
        [Required(ErrorMessage = "Product Name required.")]
        [StringLength(40, ErrorMessage = "Must be 40 characters or less.")]
        [Remote("ValidateProductName", "Home", AdditionalFields = "ProductID", ErrorMessage = "A product with this name already exists. Product names must be unique.")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Supplier required.")]
        public int SupplierID { get; set; }

        [Required(ErrorMessage = "Category required.")]
        public int CategoryID { get; set; }

        [Range(0.99, 99.99, ErrorMessage = "Price must be between $0.99 and $99.99.")]
        public decimal UnitPrice { get; set; }
    }
}