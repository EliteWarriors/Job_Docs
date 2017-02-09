
using System.Collections.Generic;
using Foundation;
using Newtonsoft.Json;

namespace JD.API
{
    public class CategoryType
    {
		[JsonProperty("Id")]
		public string Id { get; set; }

		[JsonProperty("Name")]
        public string Name { get; set; }
              
		[JsonProperty("IsUserCreatable")]
		public bool IsUserCreatable { get; set; }
       
        [JsonProperty("MaxHourTrackers")]
		public int MaxHourTrackers { get; set; }

		[JsonProperty("HourTrackerTypes")]
		public IList<HourTrackerType> HourTrackerTypes { get; set; }
        

    }
}