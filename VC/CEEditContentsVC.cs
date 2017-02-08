using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
	public class CEEditTableSource : UITableViewSource
	{
		CEEditContentsVC parent;

		public CEEditTableSource(CEEditContentsVC parent)
		{
			this.parent = parent;

		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			CategoryCell cell;
			if (indexPath.Row == 0)
				cell = tableView.DequeueReusableCell("fileNameCell", indexPath) as CategoryCell;

			else
				cell = tableView.DequeueReusableCell("expireCell", indexPath) as CategoryCell;
			
			 
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return 2;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{

		}
	}
	public partial class CEEditContentsVC : BaseVC
    {
        public CEEditContentsVC (IntPtr handle) : base (handle)
        {
        }
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.Source = new CEEditTableSource(this);	

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
			
		}
	}
}