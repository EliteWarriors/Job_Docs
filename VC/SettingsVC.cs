using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{

	public class SettingsTableSource : UITableViewSource
	{
		public string[] settingArray;
		SettingsVC parent;
		public SettingsTableSource(string[] settingArray, SettingsVC parent)
		{
			this.settingArray = settingArray;
			this.parent = parent;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			BaseCell cell = (BaseCell)tableView.DequeueReusableCell("settingCell", indexPath);
			cell.setMessage(settingArray[indexPath.Row]);
			return cell;
		}


		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (settingArray != null)
				return settingArray.Length;
			else
				return 0;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			
			switch (indexPath.Row)
			{
				case 0:
					ProfileVC nav = (ProfileVC)parent.Storyboard.InstantiateViewController("ProfileVC");
					parent.NavigationController.PushViewController(nav, true);
					break;
				case 1:
					NotificationVC notificationVC = (NotificationVC)parent.Storyboard.InstantiateViewController("NotificationVC");
					parent.NavigationController.PushViewController(notificationVC, true);
					break;
			}

		}
			
	}
	public partial class SettingsVC : BaseVC
	{
		
		public SettingsVC(IntPtr handle) : base(handle)
		{
			
		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			string[] settingArray = { "Profile", "Notifications", "Help", "Privacy Policy", "Feedback", "About" };
			table.Source = new SettingsTableSource(settingArray,this);
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;

		}

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();

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

		partial void BtnLogout_TouchUpInside(UIButton sender)
		{
			this.TabBarController.NavigationController.PopViewController(true);
		}
	}
}

