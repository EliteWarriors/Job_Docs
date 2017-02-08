using Foundation;
using System;
using UIKit;
using System.Linq;
using System.Collections.Generic;
using CoreAnimation;
using JD.API;
using Newtonsoft.Json;
using CoreFoundation;

namespace JD.iPhone
{
	public class JobTableSource : UITableViewSource
	{
		List<string> jobList;
		SelectJobVC parent;
		public JobTableSource(List<string> jobList, SelectJobVC parent)
		{
			this.jobList = new List<string>();
			this.jobList = jobList;
			this.parent = parent;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			var cell = (CheckCell)tableView.DequeueReusableCell("jobCell", indexPath);

			if (indexPath.Row == parent.selectedIndex)
				cell.setCheck(true);
			else
				cell.setCheck(false);
			cell.setText(jobList[indexPath.Row].ToString());
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return jobList.Count;
		}
		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			parent.selectedIndex = indexPath.Row;
			tableView.ReloadData();
		}
	}

	public partial class SelectJobVC : BaseVC
	{
		private List<string> filteredResults;
		private List<Job> jobs;
		string result = "";
		public int selectedIndex;

		public SelectJobVC(IntPtr handle) : base(handle)
		{

		}

		public override void ViewDidLoad()
		{
			showIndicator("Loading jobs...");
			base.ViewDidLoad();

			var client = new Client();

			result = client.GetJobs();

			hideIndicator();
			if (result != null)
			{
				jobs = JsonConvert.DeserializeObject<List<Job>>(result);
				var jobList = new List<string>();
				foreach (var item in jobs)
				{
					jobList.Add(item.Name);
				}
				table.Source = new JobTableSource(jobList, this);
				table.EstimatedRowHeight = 108;
				table.RowHeight = UITableView.AutomaticDimension;
				searchBar.TextChanged += (object sender, UISearchBarTextChangedEventArgs e) =>
				{
					string text = e.SearchText.Trim();
					filteredResults = (from fruit in jobList
									   where fruit.ToUpper().Contains(text.ToUpper()) ||
									   fruit.ToUpper().Contains(text.ToUpper())
									   select fruit).ToList();
					table.Source = new JobTableSource(filteredResults, this);
					table.ReloadData();
				};
			}
			else
			{

			}

		}

		public override void ViewDidLayoutSubviews()
		{
			base.ViewDidLayoutSubviews();
			newGradient.Frame = navBarView.Bounds;
			navBarView.Layer.InsertSublayer(newGradient, 0);
			navBarView.Layer.ShadowColor = UIColor.FromRGB(21, 21, 21).CGColor;
			navBarView.Layer.ShadowOpacity = 0.29f;
			navBarView.Layer.ShadowRadius = 3;
			navBarView.Layer.ShadowOffset = new CoreGraphics.CGSize(0, 3);
		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}

		partial void BtnNext_TouchUpInside(UIButton sender)
		{
			selectedJob = new Job();
			selectedJob = jobs[selectedIndex];
			//storeJobPreference(jobs[selectedIndex]);
			dismissVC(false);
		}
	}
}