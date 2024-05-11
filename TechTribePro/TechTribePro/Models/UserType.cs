using System.ComponentModel.DataAnnotations;

namespace TechTribePro.Models
{
    public class UserType
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(20)]
        public string Name { get; set; }

        public static int EMPLOYEE_ID => 1;
        public static int CUSTOMER_ID => 2;
    }
}
