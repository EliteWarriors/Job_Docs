using Foundation;
using System;
using UIKit;
using System.Collections.Generic;
using System.Linq;
using JD.API;

namespace JD.iPhone
{
    public class RoleTablesource : UITableViewSource
	{
		int selectedIndex;
		List<JobRole> roleList;
		SelectRoleVC parent;
		public RoleTablesource(List<JobRole> roleList, SelectRoleVC parent)
		{
			this.roleList = roleList;
			this.parent = parent;

		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			var cell = (CheckCell)tableView.DequeueReusableCell("roleCell", indexPath);
			if ((cell != null) && BaseVC.selectedRoles.Contains(roleList[indexPath.Row]))
				cell.setCheck(true);
			else
				cell.setCheck(false);
			cell.setText(roleList[indexPath.Row].Name.ToString());
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return roleList.Count;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			if (BaseVC.selectedRoles.Contains(roleList[indexPath.Row]))
				BaseVC.selectedRoles.Remove(roleList[indexPath.Row]);
			else
				BaseVC.selectedRoles.Add(roleList[indexPath.Row]);
			
			//Adding the selected RobRole items to the BaseVC static variablee
			tableView.ReloadData();
		}

	}
	public partial class SelectRoleVC : BaseVC
	{
		private List<JobRole> filteredResults;
		private List<JobRole> roleList;
		private void Initialize()
		{
			//var job = loadJobPreference();
			var job = selectedJob;
			roleList = (System.Collections.Generic.List<JD.API.JobRole>)job.JobRoles;
			filteredResults = new List<JobRole>();
			BaseVC.selectedRoles = new List<JobRole>();
		}

		public SelectRoleVC(IntPtr handle) : base(handle)
		{
			
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			Initialize();
			var roleArray = new List<string>();
			foreach (var item in roleList)
			{
				roleArray.Add(item.Name);
			}
			//BaseVC.selectedRoles = roleList;
			table.Source = new RoleTablesource(roleList,this);
			table.EstimatedRowHeight = 108;
			table.RowHeight = UITableView.AutomaticDimension;
			searchBar.TextChanged += (object sender, UISearchBarTextChangedEventArgs e) =>
			{
				filteredResults = new List<JobRole>();
				string text = e.SearchText.Trim();
				foreach (var item in roleList)
				{
					if (item.Name.ToUpper().Contains(text.ToUpper()))
					{
						filteredResults.Add(item);
					}
				}
				
				table.Source = new RoleTablesource(filteredResults,this);
				table.ReloadData();
			};
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
			dismissVC(false);
		}
	}
}