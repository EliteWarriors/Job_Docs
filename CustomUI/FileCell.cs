using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class FileCell : UITableViewCell
    {
		public BaseVC parent;
        public FileCell (IntPtr handle) : base (handle)
        {
        }
		public void setCell()
		{
			btnOptions.TouchUpInside -= (sender, e) =>
				{
			};
			btnOptions.TouchUpInside += (sender, e) =>
			{
				((CategoryVC)parent).openSheet(false);
			};
		}

		public void setFileName(String name, bool listMode = true)
		{
			if (listMode)
				this.fileName.Text = name;
			else
				this.fileName2.Text = name;
		}
		public void setFileImage(UIImage image,bool listMode = true)
		{
			if(listMode)
				this.fileImage.Image = image;
			else
				this.fileImage2.Image = image;
		}
		public void setDatedIssued(String date, bool listMode = true)
		{
			if (!listMode)
				this.issuedDate.Text = date;
		}
    }
}