using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class ExportTableSource : UITableViewSource
	{
		NSMutableArray categoryArray;
		public ExportTableSource(NSMutableArray catArray)
		{
			categoryArray = new NSMutableArray();
			categoryArray = catArray;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			ExportCell cell = (ExportCell)tableView.DequeueReusableCell("closedCell", indexPath);
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (categoryArray != null)
				return (System.nint)categoryArray.Count;
			else
				return 0;
		}

	}
	public partial class ExportVC : BaseVC
	{
		public ExportVC(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			NSMutableArray tableArray = new NSMutableArray();
			tableArray.Add(new NSMutableSet("Licenses", "3"));
			tableArray.Add(new NSMutableSet("Licenses", "3"));
			table.Source = new ExportTableSource(tableArray);
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
		}

		public override void ViewDidLayoutSubviews()
		{
			base.ViewDidLayoutSubviews();
			newGradient.Frame = navBarView.Bounds;
			navBarView.Layer.InsertSublayer(newGradient,0);
			navBarView.Layer.ShadowColor = UIColor.FromRGB(21, 21, 21).CGColor;
			navBarView.Layer.ShadowOpacity = 0.29f;
			navBarView.Layer.ShadowRadius = 3;
			navBarView.Layer.ShadowOffset = new CoreGraphics.CGSize(0, 3);
		}

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
		}

		partial void BtnCancel_TouchUpInside(UIButton sender)
		{
			//this.TabBarController.SelectedIndex = ((MainTapBarVC)TabBarController).selec
		}
	}
}

