using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class ProfileCell : UITableViewCell
    {
        public ProfileCell (IntPtr handle) : base (handle)
        {
        }
		public void setContent(String name)
		{
			this.content.Text = name;
		}

		public void setLabel(String name)
		{
			this.label.Text = name;
		}
		public void setPlaceholder(String text)
		{
			this.content.Placeholder = text;
		}
		public void setItemImage(UIImage image)
		{
			this.itemImage.Image = image;
		}
    }
}