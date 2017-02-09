
using System.Collections.Generic;


namespace JD.API
{
    public class CategoryItem
    {
       
        public string Name { get; set; }
        
        public User User { get; set; }
     
        public Category Category { get; set; }       

        public string FileName { get; set; }

        public string Notes { get; set; }

        
        public string MetaData { get; set; }

      
        public virtual ICollection<CategoryItemImage> CategoryItemImages { get; set; }
        //links to other metadata

    }
}