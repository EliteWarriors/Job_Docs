
using Foundation;
using Newtonsoft.Json;

namespace JD.API
{
    public class JobResource
    {
		[JsonProperty("Name")]
        public string Name { get; set; }

		[JsonProperty("ResourceLinkUri")]
        public string ResourceLinkUri { get; set; }

		[JsonProperty("ResourceImageBlobUri")]
        public string ResourceImageBlobUri { get; set; }  

		[JsonProperty("DisplaySubTitle")]
		public string DisplaySubTitle { get; set;}

		[JsonProperty("JobId")]
        public string JobId { get; set; }

		[JsonProperty("JobRoleId")]
        public string JobRoleId { get; set; }

		[JsonProperty("Id")]
		public string Id { get; set;}

		[JsonProperty("UpdatedAt")]
		public string UpdatedAt { get; set;}

		[JsonProperty("CreatedAt")]
		public string CreatedAt { get; set;}

    }
}	