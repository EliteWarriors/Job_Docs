using System;

using Foundation;
using UIKit;
using Xamarin;

namespace JD.iPhone
{
	public class TableSource : UITableViewSource
	{
		NSMutableDictionary[] categoryArray;
		HomeVC parent;

		public TableSource(NSMutableDictionary[] catArray, HomeVC parent)
		{
			this.parent = parent;
			categoryArray = catArray;
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			CategoryCell cell = (CategoryCell)tableView.DequeueReusableCell("categoryCell", indexPath);
			NSMutableDictionary item = categoryArray[indexPath.Row];

			cell.setCategoryName(item.ValueForKey((Foundation.NSString)"name").ToString());
			cell.setItemCount(item.ValueForKey((Foundation.NSString)"count").ToString());
			cell.parent = parent;
			cell.setCell();
			return cell;
		}
		
		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (categoryArray != null)
				return (nint)categoryArray.Length;
			else
				return 0;
		}

		public override void RowSelected(UITableView tableView, NSIndexPath indexPath)
		{
			CategoryVC nav = (CategoryVC)parent.Storyboard.InstantiateViewController("CategoryVC");
			parent.NavigationController.PushViewController(nav, true);
		}
	}

	public partial class HomeVC : BaseVC
	{
		public byte sortMode = 1;
		public string[] sortStrings = { "Recently Modified", "Document Count", "Alphabetical Order" };
		public HomeVC(IntPtr handle) : base(handle)
		{

		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			tableData();

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
		protected void tableData()
		{
			//Dummy data
			NSMutableDictionary[] tableArray = new NSMutableDictionary[5];
			NSMutableDictionary item1 = new NSMutableDictionary();
			item1.SetValueForKey((Foundation.NSString)"License", (Foundation.NSString)"name");
			item1.SetValueForKey((Foundation.NSString)"3", (Foundation.NSString)"count");

			NSMutableDictionary item2 = new NSMutableDictionary();
			item2.SetValueForKey((Foundation.NSString)"Vaccine Compliance", (Foundation.NSString)"name");
			item2.SetValueForKey((Foundation.NSString)"6", (Foundation.NSString)"count");

			NSMutableDictionary item3 = new NSMutableDictionary();
			item3.SetValueForKey((Foundation.NSString)"Skill Certificates", (Foundation.NSString)"name");
			item3.SetValueForKey((Foundation.NSString)"7", (Foundation.NSString)"count");

			NSMutableDictionary item4 = new NSMutableDictionary();
			item4.SetValueForKey((Foundation.NSString)"Contact hours(CE)", (Foundation.NSString)"name");
			item4.SetValueForKey((Foundation.NSString)"2.8/0.1", (Foundation.NSString)"count");

			NSMutableDictionary item5 = new NSMutableDictionary();
			item5.SetValueForKey((Foundation.NSString)"Diplomas", (Foundation.NSString)"name");
			item5.SetValueForKey((Foundation.NSString)"3", (Foundation.NSString)"count");

			tableArray[0] = item1;
			tableArray[1] = item2;
			tableArray[2] = item3;
			tableArray[3] = item4;
			tableArray[4] = item5;
			table.EstimatedRowHeight = 55;
			table.RowHeight = UITableView.AutomaticDimension;
			this.table.Source = new TableSource(tableArray, this);
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

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}

		partial void BellButton_TouchUpInside(UIButton sender)
		{
			AlertVC nav = (AlertVC)this.Storyboard.InstantiateViewController("AlertVC");
			this.NavigationController.PushViewController(nav, true);
		}

		partial void SearchButton_TouchUpInside(UIButton sender)
		{
			SearchVC nav = (SearchVC)this.Storyboard.InstantiateViewController("SearchVC");
			this.NavigationController.PushViewController(nav, true);
		}

		partial void BtnSort_TouchUpInside(UIButton sender)
		{
			openSheet(true);
		}


		partial void BtnSheetClose_TouchUpInside(UIButton sender)
		{
			closeSheet();
		}

		partial void BtnRecentlyModified_TouchUpInside(UIButton sender)
		{
			sortMode = 0;
			changeSortMode(sortMode);
			closeSheet();
		}

		partial void BtnDocumentCount_TouchUpInside(UIButton sender)
		{
			sortMode = 1;
			changeSortMode(sortMode);
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

		partial void BtnAlphabeticalOrder_TouchUpInside(UIButton sender)
		{
			sortMode = 2;
			changeSortMode(sortMode);
			closeSheet();
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
					this.View.BringSubviewToFront(sortMenu);
				}, null);
			}
			else
			{
				UIView.Animate(20, () =>
				{
					actionMenu.Transform.Translate(0, -actionMenu.Frame.Size.Height);
					this.View.BringSubviewToFront(actionMenu);
				}, null);
			}
			((MainTapBarVC)this.TabBarController).button.Hidden = true;
		}
		protected void changeSortMode(byte selectedIndex)
		{
			btnSort.SetTitle(sortStrings[selectedIndex], UIControlState.Normal);
			switch (selectedIndex)
			{
				case 0:
					btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnRecentlyModified.Font = UIFont.BoldSystemFontOfSize(15);
					btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					break;
				case 1:
					btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnDocumentCount.Font = UIFont.BoldSystemFontOfSize(15);
					btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					break;
				case 2:
					btnRecentlyModified.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnDocumentCount.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnAlphabeticalOrder.Font = UIFont.FromName("HelveticaNeue-Bold", 15.0f);
					btnAlphabeticalOrder.Font = UIFont.BoldSystemFontOfSize(15);
					break;
			}
		}

		partial void BtnActionMenuClose_TouchUpInside(UIButton sender)
		{
			closeSheet();
		}


		partial void BtnRename_TouchUpInside(UIButton sender)
		{
			closeSheet();
			openDialog();
		}

		partial void btnShareTapped(UIButton sender)
		{
			closeSheet();
			var item = UIActivity.FromObject("");
			var activityItems = new NSObject[] { item };
			UIActivity[] applicationActivities = null;

			var activityController = new UIActivityViewController(activityItems, applicationActivities);

			PresentViewController(activityController, true, null);
		}

		partial void btnDeleteTapped(UIButton sender)
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
			this.txtRename.ShouldReturn += (textField) =>
			{
				textField.ResignFirstResponder();
				return true;
			};
		}

		partial void BtnRenameNo_TouchUpInside(UIButton sender)
		{
			closeDialog();
			this.txtRename.ShouldReturn += (textField) =>
			{
				textField.ResignFirstResponder();
				return true;
			};
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