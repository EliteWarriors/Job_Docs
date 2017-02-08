using System;

using Foundation;
using UIKit;

namespace JD.iPhone
{
	public partial class BaseCell : UITableViewCell
	{
		public BaseCell(IntPtr handle) : base(handle)
		{
			UIView BGViewColor = new UIView();
			BGViewColor.BackgroundColor = UIColor.Clear; //or whatever color you want.
			SelectedBackgroundView = BGViewColor;
		}
		public void setMessage(String message)
		{
			this.message.Text = message;
		}
	}
}
