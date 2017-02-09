using System;
using Newtonsoft.Json;

namespace JD.API
{
	public class HourTrackerType
	{
		[JsonProperty("Id")]
		public string Id { get; set; }

		[JsonProperty("SortOrder")]
		public string SortOrder { get; set; }

		[JsonProperty("Name")]
		public string Name { get; set; }

		[JsonProperty("DisplayName")]
		public string DisplayName { get; set; }

		[JsonProperty("MaxDisplayDecimals")]
		public int MaxDisplayDecimals { get; set; }
	}
}
