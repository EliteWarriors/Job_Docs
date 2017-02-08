using System;
using Foundation;
using UIKit;

namespace JD.iPhone
{
	public class ProfileTableSource : UITableViewSource
	{
		public string[] profileArray;
		private UIImage[] itemImageArray;
		public ProfileTableSource(string[] profileArray)
		{
			this.profileArray = profileArray;
			itemImageArray = new UIImage[6];
			itemImageArray[0] = UIImage.FromBundle("Pencil");
			itemImageArray[1] = UIImage.FromBundle("Envelop");
			itemImageArray[2] = UIImage.FromBundle("Business");
			itemImageArray[3] = UIImage.FromBundle("People");
			itemImageArray[4] = UIImage.FromBundle("Location");
			itemImageArray[5] = UIImage.FromBundle("Lock");
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			ProfileCell cell = (ProfileCell)tableView.DequeueReusableCell("profileCell", indexPath);
			cell.setItemImage(itemImageArray[indexPath.Row]);
			cell.setPlaceholder(profileArray[indexPath.Row]);
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			if (profileArray != null)
				return profileArray.Length;
			else
				return 0;
		}

	}
	public partial class ProfileVC : BaseVC
	{

		public ProfileVC(IntPtr handle) : base(handle)
		{

		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			string[] settingArray = { "Profile", "Notifications", "Help", "Privacy Policy", "Feedback", "About" };
			table.Source = new ProfileTableSource(settingArray);

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

		partial void BtnChangePhoto_TouchUpInside(UIButton sender)
		{
			UIAlertController actionSheetAlert = UIAlertController.Create("Change Profile Photo", "", UIAlertControllerStyle.ActionSheet);

			// Add Actions
			actionSheetAlert.AddAction(UIAlertAction.Create("Remove Current Photo", UIAlertActionStyle.Destructive, (action) => Console.WriteLine("Item One pressed.")));

			actionSheetAlert.AddAction(UIAlertAction.Create("Take Photo", UIAlertActionStyle.Default, (action) => Console.WriteLine("Item Two pressed.")));

			actionSheetAlert.AddAction(UIAlertAction.Create("Choose From Library", UIAlertActionStyle.Default, (action) => Console.WriteLine("Item Three pressed.")));

			actionSheetAlert.AddAction(UIAlertAction.Create("Cancel", UIAlertActionStyle.Cancel, (action) => Console.WriteLine("Cancel button pressed.")));

			// Required for iPad - You must specify a source for the Action Sheet since it is
			// displayed as a popover
			UIPopoverPresentationController presentationPopover = actionSheetAlert.PopoverPresentationController;
			if (presentationPopover != null)
			{
				presentationPopover.SourceView = this.View;
				presentationPopover.PermittedArrowDirections = UIPopoverArrowDirection.Up;
			}

			// Display the alert
			this.PresentViewController(actionSheetAlert, true, null);
		}
	}
}

