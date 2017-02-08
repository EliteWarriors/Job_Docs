using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
	public partial class CategoryCell : BaseCell
    {
		public HomeVC parent;
        public CategoryCell (IntPtr handle) : base (handle)
        {
		}
		public void setCell()
		{
			
			btnOptions.TouchUpInside += (sender, e) => {
				parent.openSheet(false);
			};
			btnOptions.TouchUpInside -= (sender, e) =>
			{
			};
		}
		public void setCategoryName(string category)
		{
			categoryName.Text = category;
		}
		public void setItemCount(string count)
		{
			itemCount.Text = count;
		}
	}
}