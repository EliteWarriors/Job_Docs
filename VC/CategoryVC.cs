using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class CategorySource : UITableViewSource
	{
		NSMutableDictionary[] fileArray;
		CategoryVC parent;
		bool listMode;
		public CategorySource(NSMutableDictionary[] fileArray, CategoryVC parent,bool listMode=true)
		{
			this.parent = parent;
			this.fileArray = fileArray;
			this.listMode = listMode;
		}
		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			FileCell cell;
			if (listMode)
			{
				cell = tableView.DequeueReusableCell("fileCell", indexPath) as FileCell;
				NSMutableDictionary item = fileArray[indexPath.Row];

				cell.setFileName(item.ValueForKey((Foundation.NSString)"name").ToString());
				cell.setFileImage(UIImage.FromBundle("Alert"));
				NSString dateString = (Foundation.NSString)("Date issued " + item.ValueForKey((Foundation.NSString)"date").ToString());
				cell.setDatedIssued(dateString);

			}
			else
			{
				cell = tableView.DequeueReusableCell("thumbCell", indexPath) as FileCell;
				NSMutableDictionary item = fileArray[indexPath.Row*2];

				cell.setFileName(item.ValueForKey((Foundation.NSString)"name").ToString());
				cell.setFileImage(UIImage.FromBundle("Alert"));

				NSMutableDictionary item2 = fileArray[indexPath.Row * 2+1];
				cell.setFileName(item2.ValueForKey((Foundation.NSString)"name").ToString(),false);
				cell.setFileImage(UIImage.FromBundle("Alert"),false);

			}

			cell.parent = parent;
			cell.setCell();
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (this.fileArray != null)
			{
				if (listMode)
					return fileArray.Length;
				else
					return fileArray.Length / 2;
			}
			else
				return 0;
		}
		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			CategorySingleFileVC nav = (CategorySingleFileVC)parent.Storyboard.InstantiateViewController("CategorySingleFileCE");
			parent.NavigationController.PushViewController(nav, true);
		}
	}

	public partial class CategoryVC : BaseVC
	{
		public byte sortMode = 1;
		public bool listMode = true;
		public string[] sortStrings = { "Recently Modified", "Document Count", "Alphabetical Order" };
		public CategoryVC(IntPtr handle) : base(handle)
		{

		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
			tableData(listMode);
			maskView.Hidden = true;
			actionView.Hidden = true;
			applyShadow(sortMenu);
			sortMenu.Transform.Translate(0, sortMenu.Frame.Size.Height);
			actionMenu.Transform.Translate(0, actionMenu.Frame.Size.Height);
			UITapGestureRecognizer viewTapGesture = new UITapGestureRecognizer((obj) =>
			{
				//			closeSheet();
			}
			);	
			maskView.AddGestureRecognizer(viewTapGesture);
			changeSortMode(sortMode);
		}

		protected void tableData(bool listMode = true)
		{
			NSMutableDictionary[] tableArray = new NSMutableDictionary[5];
			NSMutableDictionary item1 = new NSMutableDictionary();
			item1.SetValueForKey((Foundation.NSString)"TB", (Foundation.NSString)"name");
			item1.SetValueForKey((Foundation.NSString)"1/13/16", (Foundation.NSString)"date");

			NSMutableDictionary item2 = new NSMutableDictionary();
			item2.SetValueForKey((Foundation.NSString)"Influenza", (Foundation.NSString)"name");
			item2.SetValueForKey((Foundation.NSString)"11/11/16", (Foundation.NSString)"date");

			NSMutableDictionary item3 = new NSMutableDictionary();
			item3.SetValueForKey((Foundation.NSString)"Tdap", (Foundation.NSString)"name");
			item3.SetValueForKey((Foundation.NSString)"5/10/13", (Foundation.NSString)"date");

			NSMutableDictionary item4 = new NSMutableDictionary();
			item4.SetValueForKey((Foundation.NSString)"Varicella", (Foundation.NSString)"name");
			item4.SetValueForKey((Foundation.NSString)"7/5/01", (Foundation.NSString)"date");

			NSMutableDictionary item5 = new NSMutableDictionary();
			item5.SetValueForKey((Foundation.NSString)"MMR", (Foundation.NSString)"name");
			item5.SetValueForKey((Foundation.NSString)"8/3/01", (Foundation.NSString)"date");

			tableArray[0] = item1;
			tableArray[1] = item2;
			tableArray[2] = item3;
			tableArray[3] = item4;
			tableArray[4] = item5;
				table.Source = new CategorySource(tableArray, this, listMode);
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

		partial void BtnAction_TouchUpInside(UIButton sender)
		{

		}

		partial void BtnSortOption_TouchUpInside(UIButton sender)
		{
			openSheet(true);
		}

		protected void changeSortMode(byte selectedIndex)
		{
			btnSort.SetTitle(sortStrings[selectedIndex], UIControlState.Normal);
			switch (selectedIndex)
			{
				//case 0:
				//	btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnRecentlyModified.Font = UIFont.BoldSystemFontOfSize(15);
				//	btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	break;
				//case 1:
				//	btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnDocumentCount.Font = UIFont.BoldSystemFontOfSize(15);
				//	btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	break;
				//case 2:
				//	btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
				//	btnAlphabeticalOrder.Font = UIFont.BoldSystemFontOfSize(15);
				//	break;
			}
		}

		public void openSheet(bool isSort = true)
		{
			TabBarController.TabBar.Hidden = true;
			maskView.Hidden = false;
			if (isSort)
			{
				UIView.Animate(20, () =>
				{
					sortMenu.Transform.Translate(0, -sortMenu.Frame.Size.Height);
					this.maskView.BringSubviewToFront(sortMenu);
				}, null);
			}
			else
			{
				UIView.Animate(20, () =>
				{
					actionMenu.Transform.Translate(0, -actionMenu.Frame.Size.Height);
					this.maskView.BringSubviewToFront(actionMenu);
				}, null);
			}
			((MainTapBarVC)this.TabBarController).button.Hidden = true;
		}

		partial void SortMenuClose(UIButton sender)
		{
			closeSheet();
		}

		private void closeSheet()
		{
			((MainTapBarVC)this.TabBarController).button.Hidden = false;
			TabBarController.TabBar.Hidden = false;
			maskView.Hidden = true;
			UIView.Animate(2f, () =>
			{
				sortMenu.Transform.Translate(0, sortMenu.Frame.Size.Height);
				actionMenu.Transform.Translate(0, actionMenu.Frame.Size.Height);
			}, null);
		}

		partial void actionMenuClose(UIButton sender)
		{
			closeSheet();
		}

		partial void viewOptionChange(UIButton sender)
		{
			listMode = !listMode;
			sender.Selected = !listMode;
			tableData(listMode);
			table.ReloadData();
		}


		partial void BtnRename_TouchUpInside(UIButton sender)
		{
			closeSheet();
			openDialog();
		}

		partial void BtnShare_TouchUpInside(UIButton sender)
		{
			closeSheet();
			var item = UIActivity.FromObject("");
			var activityItems = new NSObject[] { item };
			UIActivity[] applicationActivities = null;

			var activityController = new UIActivityViewController(activityItems, applicationActivities);

			PresentViewController(activityController, true, null);
		}

		partial void BtnDelete_TouchUpInside(UIButton sender)
		{
			closeSheet();
			openDialog(false);
		}

		public void openDialog(bool isRename = true)
		{

			TabBarController.TabBar.Hidden = true;

			if (isRename)
			{
				UIView.Animate(20, () =>
				{
					actionView.Hidden = false;
					renameView.Hidden = false;
					deleteView.Hidden = true;
				}, null);
			}
			else
			{
				UIView.Animate(20, () =>
				{
					actionView.Hidden = false;
					renameView.Hidden = true;
					deleteView.Hidden = false;
				}, null);
			}
			((MainTapBarVC)this.TabBarController).button.Hidden = true;

		}

		public void closeDialog()
		{
			((MainTapBarVC)this.TabBarController).button.Hidden = false;
			TabBarController.TabBar.Hidden = false;
			actionView.Hidden = true;
		}

		partial void BtnRenameYes_TouchUpInside(UIButton sender)
		{
			closeDialog();
		}

		partial void BtnRenameCancel_TouchUpInside(UIButton sender)
		{
			closeDialog();
		}

		partial void BtnDeleteYes_TouchUpInside(UIButton sender)
		{
			closeDialog();
		}

		partial void BtnDeleteCancel_TouchUpInside(UIButton sender)
		{
			closeDialog();
		}
	}
}

