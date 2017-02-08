using System;
using Foundation;
using UIKit;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using AVFoundation;
using CoreVideo;
using CoreMedia;
using CoreGraphics;
using CoreFoundation;
using System.Timers;
using CoreImage;
using Wapps.TOCrop;

namespace JD.iPhone
{
	public partial class CameraVC : UIViewController
	{
		#region Computed Properties
		public NSMutableArray imageArray;
		public AppDelegate ThisApp
		{
			get { return (AppDelegate)UIApplication.SharedApplication.Delegate; }
		}
		public Timer SampleTimer { get; set; }
		#endregion
		public static int selectedImgIndex = 0;
		public CameraVC(IntPtr handle) : base(handle)
		{
		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			DismissViewController(true, null);
		}
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

			// Hide no camera label
			//NoCamera.Hidden = ThisApp.CameraAvailable;

			// Attach to camera view
			ThisApp.Recorder.DisplayView = cameraView;

			// Create a timer to monitor and update the UI
			SampleTimer = new Timer(100);
			//SampleTimer.Elapsed += (sender, e) =>
			imageArray = new NSMutableArray();
			ThisApp.CaptureDevice.UnlockForConfiguration();

		}

		public override void ViewDidAppear(bool animated)
		{
			base.ViewDidAppear(animated);

			// Start udating the display
			if (ThisApp.CameraAvailable)
			{
				// Remap to this camera view
				ThisApp.Recorder.DisplayView = cameraView;

				ThisApp.Session.StartRunning();
				SampleTimer.Start();
			}
		}

		public override void ViewWillDisappear(bool animated)
		{
			// Stop display
			if (ThisApp.CameraAvailable)
			{
				SampleTimer.Stop();
				ThisApp.Session.StopRunning();
			}

			base.ViewWillDisappear(animated);
		}

		partial void BtnShutter_TouchUpInside(UIButton sender)
		{

			var Settings = new AVCaptureBracketedStillImageSettings[] {
				
				AVCaptureAutoExposureBracketedStillImageSettings.Create (0f)
			};
			// Tell the camera that we are getting ready to do a bracketed capture
			ThisApp.StillImageOutput.PrepareToCaptureStillImageBracket(ThisApp.StillImageOutput.Connections[0], Settings, (ready, err) =>
			{
				// Was there an error, if so report it
				if (err != null)
					Console.WriteLine("Error: {0}", err.LocalizedDescription);
			});

			// Ask the camera to snap a bracketed capture
			ThisApp.StillImageOutput.CaptureStillImageBracket(ThisApp.StillImageOutput.Connections[0], Settings, (sampleBuffer, settings, err) =>
			{
				// Convert raw image stream into a Core Image Image
				var imageData = AVCaptureStillImageOutput.JpegStillToNSData(sampleBuffer);
				var image = CIImage.FromData(imageData);

				// Display the resulting image
				imageArray.Add(UIImage.FromImage(image));
				btnCheck.Hidden = false;
				lblCount.Hidden = false;
				lblCount.Text = imageArray.Count.ToString();

			});
		}

		partial void BtnCheck_TouchUpInside(UIButton sender)
		{
			PhotoCroppingVC vc = Storyboard.InstantiateViewController("PhotoCroppingVC") as PhotoCroppingVC;
			vc.imageArray = this.imageArray;
			NavigationController.PushViewController(vc, true);
		}

		//class CropVCDelegate : TOCropViewControllerDelegate
		//{
		//	NSMutableArray imageArray;
		//	public CropVCDelegate(NSMutableArray imgArray)
		//	{
		//		imageArray = new NSMutableArray();
		//		imageArray = imgArray;
		//	}
		//	public override void DidCropImageToRect(TOCropViewController cropViewController, CGRect cropRect, nint angle)
		//	{
		//		selectedImgIndex++;
		//		if ((nuint)selectedImgIndex < imageArray.Count)
		//		{
		//			cropViewController.PresentingViewController.DismissViewController(true,HandleAction(cropViewController));

		//		}
		//		else
		//		{
		//			cropViewController.PresentingViewController.DismissViewController(true, null);
		//		}
		//		var myImage = cropViewController.FinalImage;
		//	}

		//	void HandleAction(TOCropViewController cropViewController)
		//	{
		//		var cropVC = new TOCropViewController(TOCropViewCroppingStyle.Default, imageArray.GetItem<UIImage>((System.nuint)selectedImgIndex));

		//		cropVC.Delegate = new CropVCDelegate(imageArray);
		//		cropViewController.PresentingViewController.PresentViewController(cropVC, true, null);
		//	}
		//}
	}
}