using Foundation;
using System;
using UIKit;
using JD.API;
using System.Collections.Generic;

namespace JD.iPhone
{
   
	public class ConfirmCategorySource : UICollectionViewSource
	{
		List<Category> categoryList;

		public ConfirmCategorySource(List<Category> categoryList)
		{
			this.categoryList = new List<Category>();
			this.categoryList = categoryList;
		}

		public override nint GetItemsCount(UICollectionView collectionView, nint section)
		{
			return categoryList.Count;
		}

		public override UICollectionViewCell GetCell(UICollectionView collectionView, NSIndexPath indexPath)
		{
			var cell = (CategoryCollectionCell)collectionView.DequeueReusableCell("categoryCollectionCell", indexPath);
			cell.setCategoryName(categoryList[indexPath.Row].Name);

			cell.setSelected(true);
			return cell;
		}

		public override void ItemSelected(UICollectionView collectionView, NSIndexPath indexPath)
		{
			var cell = (CategoryCollectionCell)collectionView.DequeueReusableCell("categoryCollectionCell", indexPath);
			collectionView.ReloadData();
		}

	}

	public class ConfirmTableSource : UITableViewSource
	{
		public ConfirmTableSource()
		{
			
		}

		public override UITableViewCell GetCell(UITableView tableView, NSIndexPath indexPath)
		{
			string btnRoleTitle = "";
			if (BaseVC.selectedRoles != null)
			{
				foreach (var item in BaseVC.selectedRoles)
				{
					btnRoleTitle += item.Name + ", ";
				}
				if (btnRoleTitle.Length > 2)
				{
					btnRoleTitle = btnRoleTitle.Remove(btnRoleTitle.Length - 2);
				}
			}
			var cell = (ProfileCell)tableView.DequeueReusableCell("profileCell", indexPath);
			switch (indexPath.Row)
			{
				case 0:
					cell.setItemImage(UIImage.FromBundle("Pencil"));
					cell.setLabel(BaseVC.newUser.Name);
					break;
				case 1:
					cell.setItemImage(UIImage.FromBundle("Envelop"));
					cell.setLabel(BaseVC.newUser.Email);
					break;
				case 2:
					cell.setItemImage(UIImage.FromBundle("Business"));
					if(BaseVC.selectedJob!=null)
						cell.setLabel(BaseVC.selectedJob.Name);
					break;
				case 3:
					cell.setItemImage(UIImage.FromBundle("People"));
					cell.setLabel(btnRoleTitle);
					break;
				case 4:
					cell.setItemImage(UIImage.FromBundle("Location"));
					cell.setLabel(BaseVC.newUser.ZipCode);
					break;
				case 5:
					cell.setItemImage(UIImage.FromBundle("Lock"));
					cell.setLabel("*******");
					break;
			}
			return cell;
		}

		public override nint RowsInSection(UITableView tableview, nint section)
		{
			return 6;
		}

	}

	public partial class ConfirmInfoVC : BaseVC
	{
		UIImagePickerController imagePicker;
		public ConfirmInfoVC(IntPtr handle) : base(handle)
		{

		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			var selected = new List<Category>();

			foreach (var item in BaseVC.selectedCategories)
			{
				if (item.IsDefaultSuggestion)
					selected.Add(item);
			}
			ConfirmCategorySource collectionSource = new ConfirmCategorySource(selected);
			collectionView.Source = collectionSource;
			table.Source = new ConfirmTableSource();

			// Setting the profile photo
			if(BaseVC.profilePhoto!= null)
				imgPhoto.Image = BaseVC.profilePhoto;
		}
		public override void ViewDidLayoutSubviews()
		{
			UICollectionViewFlowLayout layout = new UICollectionViewFlowLayout();
			layout.ItemSize = new CoreGraphics.CGSize((float)(collectionView.Window.Frame.Size.Width / 4), (float)(collectionView.Window.Frame.Size.Width / 4));

			collectionView.SetCollectionViewLayout(layout, true);
		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}

		partial void BtnConfirm_TouchUpInside(UIButton sender)
		{
			showIndicator("Processing...");
			var client = new Client();
			var response = client.Register(BaseVC.newUser);
			if (response != null)
			{
				hideIndicator();
				ThankyouVC nav = (ThankyouVC)Storyboard.InstantiateViewController("ThankyouVC");
				NavigationController.PushViewController(nav, true);
			}
			else
			{
				hideIndicator();
				var okAlertController = UIAlertController.Create("Registration", "Registration failed, please try again.", UIAlertControllerStyle.Alert);
				okAlertController.AddAction(UIAlertAction.Create("OK", UIAlertActionStyle.Default, null));
				PresentViewController(okAlertController, true, null);
			}

		}

		partial void BtnChangeProfile_TouchUpInside(UIButton sender)
		{
			UIAlertController actionSheetAlert = UIAlertController.Create("", "Change Profile Photo", UIAlertControllerStyle.ActionSheet);

			// Add Actions
			actionSheetAlert.AddAction(UIAlertAction.Create("Remove Current Photo", UIAlertActionStyle.Destructive, (action) => removePhoto()));
			actionSheetAlert.AddAction(UIAlertAction.Create("Take Photo", UIAlertActionStyle.Default, (action) => takePhoto()));
			actionSheetAlert.AddAction(UIAlertAction.Create("Choose From Library", UIAlertActionStyle.Default, (action) => chooseFromLibrary()));
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

		partial void BtnInfoEdit_TouchUpInside(UIButton sender)
		{
			//moving back to Registration VC
			NavigationController.PopToViewController(NavigationController.ViewControllers[NavigationController.ViewControllers.Length - 4],true);
		}

		partial void BtnCategoryEdit_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}

		void removePhoto()
		{
			imgPhoto.Image = UIImage.FromBundle("Profile_badge");
			BaseVC.profilePhoto = null;
		}	

		void takePhoto()
		{
			imagePicker = new UIImagePickerController();
			imagePicker.SourceType = UIImagePickerControllerSourceType.Camera;
			openPicker();
		}

		void chooseFromLibrary()
		{
			imagePicker = new UIImagePickerController();
			imagePicker.SourceType = UIImagePickerControllerSourceType.PhotoLibrary;
			openPicker();
		}

		void openPicker()
		{
			imagePicker.MediaTypes = UIImagePickerController.AvailableMediaTypes(UIImagePickerControllerSourceType.PhotoLibrary);
			imagePicker.FinishedPickingMedia += ImagePicker_FinishedPickingMedia;
			imagePicker.Canceled += ImagePicker_Canceled;
			NavigationController.PresentModalViewController(imagePicker, true);
		}

		void ImagePicker_FinishedPickingMedia(object sender, UIImagePickerMediaPickedEventArgs e)
		{
			UIImage originalImage = e.Info[UIImagePickerController.OriginalImage] as UIImage;
			if (originalImage != null)
			{
				profilePhoto = originalImage;
				imgPhoto.Image = profilePhoto;
				imagePicker.DismissModalViewController(true);
			}
		}

		void ImagePicker_Canceled(object sender, EventArgs e)
		{
			imagePicker.DismissModalViewController(true);
		}
	}
}