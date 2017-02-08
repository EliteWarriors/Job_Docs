using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class CategoryCollectionCell : UICollectionViewCell
    {
        public CategoryCollectionCell (IntPtr handle) : base (handle)
        {
        }

		public void setCategoryName(string categoryName)
		{
			this.categoryName.Text = categoryName;
		}
		public void setSelected(bool selection)
		{
			this.banner.Hidden = !selection;
		}
    }
}