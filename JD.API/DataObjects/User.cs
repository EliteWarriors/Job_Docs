using System.Collections.Generic;

namespace JD.API
{
	public class User
	{

		public string Name { get; set; }

		public string Email { get; set; }

		public string ZipCode { get; set; }
		public string Password { get; set; }	
		public int? NotificationTriggerTimeDays { get; set; }

		public string ProfilePicBloblUri { get; set; }


	}
}
