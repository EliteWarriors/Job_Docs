using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class SearchTableSource : UITableViewSource
	{
		NSMutableArray resultArray;
		public SearchTableSource(NSMutableArray searchArray)
		{
			resultArray = new NSMutableArray();
			resultArray = searchArray;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			FileCell cell = (JD.iPhone.FileCell)tableView.DequeueReusableCell("fileCell", indexPath);
			//cell.setImage(UIImage.FromBundle("Alert"));
			//	NSMutable
			//	cell.setMessage(alertArray.GetItem(indexPath.Row).
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (resultArray != null)
				return (System.nint)resultArray.Count;
			else
				return 0;

		}

	}
	public partial class SearchVC : BaseVC
	{
		public SearchVC(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
			NSMutableArray tableArray = new NSMutableArray();

			tableArray.Add(new NSMutableSet("NRP Certificate", "is expiring", "43 days"));
			tableArray.Add(new NSMutableSet("BLS Certificate", "is expiring", "67 days"));
			table.Source = new SearchTableSource(tableArray);
			searchBar.BecomeFirstResponder();
			searchBar.BackgroundImage = new UIImage();
			searchBar.CancelButtonClicked += SearchBar_CancelButtonClicked;
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


		void SearchBar_CancelButtonClicked(object sender, EventArgs e)
		{
			dismissVC();
		}
	}
}

