using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
	public partial class MainTabMenuVC : UIViewController
	{
		UIImagePickerController imagePicker;
		public MainTabMenuVC(IntPtr handle) : base(handle)
		{
		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			BaseVC.applyShadow(createNewMenu);
			UITapGestureRecognizer viewTapGesture = new UITapGestureRecognizer((obj) =>
			{
				this.View.RemoveFromSuperview();
			}
			);
			spaceView.AddGestureRecognizer(viewTapGesture);
			imagePicker = new UIImagePickerController();

		}
		partial void BtnOpenCategory_TouchUpInside(UIButton sender)
		{
			this.View.RemoveFromSuperview();
		}

		partial void BtnOpenDocument_TouchUpInside(UIButton sender)
		{

			UIAlertController actionSheetAlert = UIAlertController.Create("Document Settings", "", UIAlertControllerStyle.ActionSheet);
			actionSheetAlert.AddAction(UIAlertAction.Create("Take Photo", UIAlertActionStyle.Default, (action) => takePhoto(true)));
			actionSheetAlert.AddAction(UIAlertAction.Create("Choose From Library", UIAlertActionStyle.Default, (action) => takePhoto(false)));
			actionSheetAlert.AddAction(UIAlertAction.Create("Cancel", UIAlertActionStyle.Cancel, (action) => Console.WriteLine("Cancel button pressed.")));

			// Required for iPad - You must specify a source for the Action Sheet since it is
			// displayed as a popove
			UIPopoverPresentationController presentationPopover = actionSheetAlert.PopoverPresentationController;
			if (presentationPopover != null)
			{
				presentationPopover.SourceView = this.View;
				presentationPopover.PermittedArrowDirections = UIPopoverArrowDirection.Up;
			}

			// Display the aler
			this.PresentViewController(actionSheetAlert, true, () =>
			{
				this.View.RemoveFromSuperview();
			});
		}

		partial void BtnMenuClose_TouchUpInside(UIButton sender)
		{
			this.View.RemoveFromSuperview();
		}

		void takePhoto(bool fromCamera = true)
		{
			if (fromCamera)
			{
				UINavigationController cameraVC = Storyboard.InstantiateViewController("CameraNavVC") as UINavigationController;
				UIApplication.SharedApplication.KeyWindow.RootViewController.PresentViewController(cameraVC, true, null);
				/*imagePicker.SourceType = UIImagePickerControllerSourceType.Camera;
				imagePicker.MediaTypes = UIImagePickerController.AvailableMediaTypes(UIImagePickerControllerSourceType.PhotoLibrary);
				imagePicker.FinishedPickingMedia += ImagePicker_FinishedPickingMedia;
				imagePicker.Canceled += ImagePicker_Canceled;
				imagePicker.CameraOverlayView = cameraVC.View;
				imagePicker.WantsFullScreenLayout = true;
				imagePicker.NavigationBarHidden = true;
				

				UIApplication.SharedApplication.KeyWindow.RootViewController.PresentModalViewController(imagePicker, true);*/
			}
			else
			{
				imagePicker.SourceType = UIImagePickerControllerSourceType.PhotoLibrary;
				imagePicker.MediaTypes = UIImagePickerController.AvailableMediaTypes(UIImagePickerControllerSourceType.PhotoLibrary);
				imagePicker.FinishedPickingMedia += ImagePicker_FinishedPickingMedia;
				imagePicker.Canceled += ImagePicker_Canceled;
				UIApplication.SharedApplication.KeyWindow.RootViewController.PresentModalViewController(imagePicker, true);
			}
		}

		void ImagePicker_FinishedPickingMedia (object sender, UIImagePickerMediaPickedEventArgs e)
		{

		}

		void ImagePicker_Canceled (object sender, EventArgs e)
		{
			imagePicker.DismissViewController(true, null);
		}
	}
}