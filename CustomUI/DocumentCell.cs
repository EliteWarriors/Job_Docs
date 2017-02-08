using System;

using Foundation;
using UIKit;

namespace JD.iPhone
{
	
	public partial class DocumentCell : UITableViewCell
	{
		public BaseVC parent;
		protected DocumentCell(IntPtr handle) : base(handle)
		{
			// Note: this .ctor should not contain any initialization logic.
		}
		public void setSlider(NSMutableArray imageArray)
		{
			int width = (int)scrollView.Frame.Size.Width;
			int height = (int)scrollView.Frame.Size.Height;
			int count =0;
			if (imageArray!=null)
				count = (int)imageArray.Count;
			scrollView.ContentSize = new CoreGraphics.CGSize(width * count, height);
			pageControl.CurrentPage = 0;
			pageControl.Pages = count;
			scrollView.PagingEnabled = true;
			scrollView.Delegate = new ImageScrollDelegate(this);
			for (int i = 0; i < count; i++)
			{
				UIImageView imageView = new UIImageView(new CoreGraphics.CGRect(width * i, 0, width, height));
				imageView.Image = imageArray.GetItem<UIImage>((System.nuint)i);
				scrollView.AddSubview(imageView);
				                                        
			}
		}

		public void setSaveButton()
		{
			
			btnSave.TouchUpInside += (sender, e) => 
			{
				CategorySingleFileVC vc = ((CESaveContentsVC)parent).Storyboard.InstantiateViewController("CategorySingleFileCE") as CategorySingleFileVC;
				parent.NavigationController.PushViewController(vc, true);
			};
			btnSave.TouchUpInside -= (sender, e) => { };
		}

		public class ImageScrollDelegate : UIScrollViewDelegate
		{
			DocumentCell parent;
			public ImageScrollDelegate(DocumentCell parent)
			{
				this.parent = parent;
			}
			public override void DecelerationEnded(UIScrollView scrollView)
			{
				
				parent.pageControl.CurrentPage = (System.nint)Math.Floor(parent.scrollView.ContentOffset.X / parent.scrollView.Frame.Size.Width);
			}

		}
	

	}

}
