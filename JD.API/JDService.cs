using System;
using System.Net;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace JD.API
{
	public class Client
	{
		const string API_BASE = "https://jdmobileapp.azurewebsites.net/api/";

		private WebClient GetClient(User user = null)
		{
			var client = new WebClient();
			client.Headers.Add("Content-Type: application/json");
			return client;
		}

		public string Register(User user)
		{
			var client = GetClient();

			try
			{
				var url = API_BASE + "Users";
				var data = String.Format("{{\"FullName\": \"{0}\",\"ZipCode\": \"{1}\",\"Password\": \"{2}\",\"Email\": \"{3}\" }}", user.Name,user.ZipCode,user.Password,user.Email);
				var response = client.UploadString(url, data);
				return response;
			}
			catch (Exception e)
			{
				// The call failed, so we want to register the suer
				// TODO: We need to actually check the exception to make sure it was a UserNotFound
				Console.WriteLine("Registration Exception:" + e.Message);
				return null;
			}
		}

		/// <summary>
		/// Get User Detail.
		/// </summary>
		/// <returns>User Detail.</returns>
		public string GetUserDetail(User user)
		{
			var client = GetClient(user);

			try
			{
				var url = API_BASE + "auth/session";
				var response = client.DownloadString(url);

				return response;
			}
			catch (Exception e)
			{
				Console.WriteLine("Exception in GetUserDetail:" + e.Message);
				return null;
			}
		}

		/// <summary>
		/// Get Jobs.
		/// </summary>
		/// <returns>string</returns>
		public string GetJobs()
		{
			var client = GetClient();
			try
			{
				var url = API_BASE + "Jobs";
				var response = client.DownloadString(url);
				return response;
			}
			catch (Exception e)
			{
				Console.WriteLine("Exception in GetUserDetail:" + e.Message);
				return null;
			}
		}

		/// <summary>
		/// Get Job Roles.
		/// </summary>
		/// <returns>string</returns>
		public string GetJobRoles()
		{
			var client = GetClient();
			try
			{
				var url = API_BASE + "Jobs";
				var response = client.DownloadString(url);
				return response;
			}
			catch (Exception e)
			{
				Console.WriteLine("Exception in GetUserDetail:" + e.Message);
				return null;
			}
		}

		/// <summary>
		/// Get Categories.
		/// </summary>
		/// <returns>string</returns>
		public string GetCategories()
		{
			var client = GetClient();
			try
			{
				var url = API_BASE + "Categories";
				var response = client.DownloadString(url);
				return response;
			}
			catch (Exception e)
			{
				Console.WriteLine("Exception in GetCategories:" + e.Message);
				return null;
			}
		}

	}
}

