using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class SingleCategoryCell : UITableViewCell
    {
		public CategorySingleFileVC parent;
        public SingleCategoryCell (IntPtr handle) : base (handle)
        {
        }
		public void setScrollView()
		{
			int width = (int)scrollView.Frame.Size.Width;
			int height = (int)scrollView.Frame.Size.Height;
			UIImageView image1 = new UIImageView(new CoreGraphics.CGRect(width * 0, 0, width, height));
			image1.Image = UIImage.FromBundle("TB");
			image1.ContentMode = UIViewContentMode.ScaleToFill;
			scrollView.AddSubview(image1);

			UIImageView image2 = new UIImageView(new CoreGraphics.CGRect(width * 1, 0, width, height));
			image2.Image = UIImage.FromBundle("TB");
			image2.ContentMode = UIViewContentMode.ScaleToFill;
			scrollView.AddSubview(image2);
		}
    }

}