using System.Collections.Generic;
using Foundation;
using Newtonsoft.Json;

namespace JD.API
{
	public class JobRole
    {
		[JsonProperty("Name")]
        public string Name { get; set; }

		[JsonProperty("JobId")]
        public string JobId { get; set; }

		[JsonProperty("JobResources")]
		public IList<JobResource> JobResources { get; set;}

		[JsonProperty("Id")]
		public string Id { get; set; }

		[JsonProperty("UpdatedAt")]
		public string UpdatedAt { get; set;}

		[JsonProperty("CreatedAt")]
		public string CreatedAt { get; set;}
    }
}