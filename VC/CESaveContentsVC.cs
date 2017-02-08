using Foundation;
using System;
using UIKit;
using System.Drawing;

namespace JD.iPhone
{
	public class CESaveTableSource : UITableViewSource
	{
		CESaveContentsVC parent;
		NSMutableArray imageArray;
		public CESaveTableSource(CESaveContentsVC parent,NSMutableArray imageArray)
		{
			this.parent = parent;
			this.imageArray = imageArray;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			DocumentCell cell;
			switch (indexPath.Row)
			{
				case 0:
					cell = tableView.DequeueReusableCell("imageCell", indexPath) as DocumentCell;
					cell.setSlider(imageArray);
					break;
				case 1:
					cell = tableView.DequeueReusableCell("fileNameCell", indexPath) as DocumentCell;
					break;
				case 2:
					cell = tableView.DequeueReusableCell("saveCell", indexPath) as DocumentCell;
					break;
				case 3:
					cell = tableView.DequeueReusableCell("expireCell", indexPath) as DocumentCell;
					break;
				case 4:
					cell = tableView.DequeueReusableCell("issueCell", indexPath) as DocumentCell;
					break;
				case 5:
					cell = tableView.DequeueReusableCell("noteCell", indexPath) as DocumentCell;
					break;
				default:
					cell = new UITableViewCell() as DocumentCell;
					break;
			}

			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return 6;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			UIAlertView alert = new UIAlertView();
			switch (indexPath.Row)
			{
				case 1:
					
					alert.Title = "File name";
					alert.AddButton("OK");
					alert.Message = "Please enter file name.";
					alert.AlertViewStyle = UIAlertViewStyle.PlainTextInput;
					alert.Clicked += (object s, UIButtonEventArgs ev) =>
					{
						// handle click event here
						// user input will be in alert.GetTextField(0).Text;
					};

					alert.Show();
					break;
				case 2:
					SaveLocationVC nav = parent.Storyboard.InstantiateViewController("SaveLocationVC") as SaveLocationVC;
					parent.NavigationController.PushViewController(nav, true);
					break;
				case 3:
					// Create alert
					break;
					
			}
			
		}
	}

	public partial class CESaveContentsVC : BaseVC
    {
		public NSMutableArray imageArray;
        public CESaveContentsVC (IntPtr handle) : base (handle)
        {
        }

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.Source = new CESaveTableSource(this,imageArray);
			table.EstimatedRowHeight = 55;
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

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}
			
		partial void BtnCancel_TouchUpInside(UIButton sender)
		{
			NavigationController.DismissViewController(true, null);
		}
	}
}