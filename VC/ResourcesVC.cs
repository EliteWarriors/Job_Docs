using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{

	public class ResourceTableSource : UITableViewSource
	{

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			BaseCell cell = null;
			switch (indexPath.Row)
			{
				case 0:
					cell = (BaseCell)tableView.DequeueReusableCell("anaCell", indexPath);
					break;
				case 1:
					cell = (BaseCell)tableView.DequeueReusableCell("nurseCell", indexPath);
					break;
				case 2:
					cell = (BaseCell)tableView.DequeueReusableCell("cdcCell", indexPath);
					break;
				case 3:
					cell = (BaseCell)tableView.DequeueReusableCell("gcCell", indexPath);
					break;
				case 4:
					cell = (BaseCell)tableView.DequeueReusableCell("ahaCell", indexPath);
					break;
				case 5:
					cell = (BaseCell)tableView.DequeueReusableCell("cdcCell", indexPath);
					break;
				case 6:
					cell = (BaseCell)tableView.DequeueReusableCell("rooCell", indexPath);
					break;
			}

			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return 7;
		}

	}

	public partial class ResourcesVC : BaseVC
	{
		public ResourcesVC(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.Source = new ResourceTableSource();
			table.EstimatedRowHeight = 108;
			table.RowHeight = UITableView.AutomaticDimension;
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
	}
}

