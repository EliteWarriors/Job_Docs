using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
	public class SingleFileTableSource : UITableViewSource
	{
		CategorySingleFileVC parent;

		public SingleFileTableSource(CategorySingleFileVC parent)
		{
			this.parent = parent;

		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			SingleCategoryCell cell;
			if (indexPath.Row == 0)
			{
				cell = (SingleCategoryCell)tableView.DequeueReusableCell("imageCell", indexPath);
				cell.setScrollView();

			}
			else 
				cell = (SingleCategoryCell)tableView.DequeueReusableCell("contentCell", indexPath);
			cell.parent = parent;

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

	public partial class CategorySingleFileVC : BaseVC
    {
        public CategorySingleFileVC (IntPtr handle) : base (handle)
        {
        }

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			SingleFileTableSource source = new SingleFileTableSource(this);
			table.Source = source;
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
		}

		public override void ViewDidLayoutSubviews()
		{
			base.ViewDidLayoutSubviews();
			//Gradient on navigation bar
			newGradient.Frame = gradientView.Layer.Bounds;
			gradientView.Layer.AddSublayer(newGradient);
			gradientView.Layer.MasksToBounds = true;
			gradientView.AddSubview(profileView);
			gradientView.AddSubview(navView);

		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}

	}
}