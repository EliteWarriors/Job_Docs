using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class AlertTableSource : UITableViewSource
	{
		NSMutableArray alertArray;
		public AlertTableSource(NSMutableArray catArray)
		{
			alertArray = new NSMutableArray();
			alertArray = catArray;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			AlertCell cell = (JD.iPhone.AlertCell)tableView.DequeueReusableCell("alertCell", indexPath);
			cell.setImage(UIImage.FromBundle("Alert"));
		//	NSMutable
		//	cell.setMessage(alertArray.GetItem(indexPath.Row).
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (alertArray != null)
				return (System.nint)alertArray.Count;
			else
				return 0;

		}

	}
	public partial class AlertVC : BaseVC
	{
		public AlertVC(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
			NSMutableArray tableArray = new NSMutableArray();
				//	tableArray.Add(new string[] { "CPI Certificate", "is expiring", "15 days"});
			tableArray.Add(new NSMutableSet("NRP Certificate", "is expiring", "43 days"));
			tableArray.Add(new NSMutableSet("BLS Certificate", "is expiring", "67 days"));
			table.Source = new AlertTableSource(tableArray);
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
		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
		}

		partial void UIButtonA0vvadsO_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}
	}
}

