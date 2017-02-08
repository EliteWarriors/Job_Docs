using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class AlertCell : UITableViewCell
    {
        public AlertCell (IntPtr handle) : base (handle)
        {
        }
		public void setMessage(String message)
		{
			this.message.Text = message;
		}
		public void setImage(UIImage image)
		{
			this.alertImage.Image = image;
		}

    }
}