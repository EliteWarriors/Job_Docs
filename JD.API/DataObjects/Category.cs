
using Newtonsoft.Json;

namespace JD.API
{
    public class Category
    {
		[JsonProperty("Id")]
		public string Id { get; set; }

        [JsonProperty("Name")]
		public string Name { get; set; }
              
		[JsonProperty("JobId")]
        public string JobId { get; set; }

		[JsonProperty("IsDefaultSuggestion")]
		public bool IsDefaultSuggestion { get; set; }

		[JsonProperty("IsSystemCategory")]
		public bool IsSystemCategory { get; set; }

		[JsonProperty("CategoryType")]
		public CategoryType CategoryType { get; set; }
       
		[JsonProperty("UpdatedAt")]
		public string UpdatedAt { get; set; }

		[JsonProperty("CreatedAt")]
		public string CreatedAt { get; set; }
    }
}