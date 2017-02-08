using System;
using System.Collections.Generic;
using JD.API;
using UIKit;

namespace JD.iPhone
{
	public partial class RegistrationVC : BaseVC
	{
		UIImagePickerController imagePicker;
		public RegistrationVC(IntPtr handle) : base(handle)
		{
		}

		partial void BtnSignup_TouchUpInside(UIButton sender)
		{
			var user = new User();

			user.Name = txtFullName.Text;
			user.Email = txtEmail.Text;
			user.ZipCode = txtZipCode.Text;
			user.Password = txtPassword.Text;
			user.ProfilePicBloblUri = null;
			BaseVC.newUser = user;
			CreateAccountJobVC nav = (CreateAccountJobVC)Storyboard.InstantiateViewController("CreateAccountJobVC");
			this.NavigationController.PushViewController(nav, true);
		}

		partial void BtnClose_TouchUpInside(UIButton sender)
		{
			DismissViewController(true, null);
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			//Round photo
			imgPhoto.Layer.CornerRadius = (System.nfloat)(imgPhoto.Frame.Width / 2.0);
			imgPhoto.Layer.MasksToBounds = true;

			txtEmail.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};

			txtPassword.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};

			txtZipCode.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};

			txtFullName.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
			UITapGestureRecognizer tapPhoto = new UITapGestureRecognizer((obj) =>
			{
				openSheet();
			});
			imgPhoto.AddGestureRecognizer(tapPhoto);

		}
		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}

		void openSheet()
		{
			UIAlertController actionSheetAlert = UIAlertController.Create("", "Upload Profile Photo", UIAlertControllerStyle.ActionSheet);

			// Add Action
			actionSheetAlert.AddAction(UIAlertAction.Create("Take Photo", UIAlertActionStyle.Default, (action) => openCamera()));
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

		void openCamera()
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