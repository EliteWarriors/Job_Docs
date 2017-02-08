using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class NotificationTableSource : UITableViewSource
	{
		
		NotificationVC parent;
		int[] dayArray;
		int selectedIndex = -1;
		public NotificationTableSource(int[] dayArray, NotificationVC parent)
		{
			this.dayArray = dayArray;
			this.parent = parent;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			BaseCell cell = (JD.iPhone.BaseCell)tableView.DequeueReusableCell("notificationCell", indexPath);
			cell.TextLabel.Text = dayArray[indexPath.Row].ToString()+" Days";
			if (indexPath.Row == selectedIndex)
				cell.Accessory = UITableViewCellAccessory.Checkmark;
			return cell;
		}


		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (dayArray != null)
				return dayArray.Length;
			else
				return 0;
		}
		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			base.RowSelected(tableView, indexPath);
			selectedIndex = indexPath.Row;
			tableView.ReloadData();

		}


	}
	public partial class NotificationVC : BaseVC
	{

		public NotificationVC(IntPtr handle) : base(handle)
		{

		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			int[] dayArray = { 30, 60, 90 };
			table.Source = new NotificationTableSource(dayArray, this);
			//table.EstimatedRowHeight = 55;
			//table.RowHeight = UITableView.AutomaticDimension;

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


		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}
	}
}

