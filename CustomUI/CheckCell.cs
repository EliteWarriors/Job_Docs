using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class CheckCell : UITableViewCell
    {
        public CheckCell (IntPtr handle) : base (handle)
        {
        }
		public void setCheck(Boolean check)
		{
			btnCheck.Selected = check;
		}
		public void setText(string text)
		{
			lblText.Text = text;
		}
    }
}