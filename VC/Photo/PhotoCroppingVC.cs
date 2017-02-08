using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class PhotoCroppingVC : UIViewController
    {
		public NSMutableArray imageArray;
		private UIImageView imageView;
        public PhotoCroppingVC (IntPtr handle) : base (handle)
        {
			
        }
		public override void ViewDidLoad()
		{
			//imageView = new UIImageView(UIImage.FromBundle("TB"));
			//scrollView.ContentSize = imageView.Image.Size;
			//scrollView.AddSubview(imageView);
			//scrollView.MaximumZoomScale = 3f;
			//scrollView.MinimumZoomScale = .1f;
			//scrollView.ViewForZoomingInScrollView += (UIScrollView sv) => { return imageView; };
		}

		partial void BtnNext_TouchUpInside(UIButton sender)
		{
			CESaveContentsVC vc = Storyboard.InstantiateViewController("CESaveContents") as CESaveContentsVC;
			vc.imageArray = new NSMutableArray();
			vc.imageArray = imageArray;
			NavigationController.PushViewController(vc,true);
		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			DismissViewController(true, null);
		}

		partial void BtnCancel_TouchUpInside(UIButton sender)
		{
			NavigationController.DismissViewController(true, null);
		}
	}
	public partial class ResizingFrame : UIView
	{
		public override void TouchesBegan(NSSet touches, UIEvent evt)
		{
			var touch = touches.AnyObject as UITouch;

			Console.WriteLine(touch);
		}
	}
}