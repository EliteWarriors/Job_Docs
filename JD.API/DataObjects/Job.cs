using System;
using System.Collections.Generic;
using Foundation;
using Newtonsoft.Json;

namespace JD.API
{
	public class Job:NSObject
	{
		[JsonProperty("Id")]
		public string Id { get; set; }

		[JsonProperty("Name")]
		public string Name { get; set; }

		[JsonProperty("JobRoles")]
		public IList<JobRole> JobRoles { get; set; }

		[JsonProperty("JobResources")]
		public IList<JobResource> JobResources { get; set; }

		[JsonProperty("AllowedCategoryTypes")]
		public IList<CategoryType> AllowedCategoryTypes{get; set; }

		[JsonProperty("UpdatedAt")]
		public string UpdatedAt { get; set; }

		[JsonProperty("CreatedAt")]
		public string CreatedAt { get; set;}


	}
}