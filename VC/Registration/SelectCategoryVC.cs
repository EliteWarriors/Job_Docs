using Foundation;
using System;
using UIKit;
using System.Drawing;
using JD.API;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace JD.iPhone
{
	public class CategoryCollectionSource : UICollectionViewSource
	{
		List<Category> categoryList;

		public CategoryCollectionSource(List<Category> categoryList)
		{
			this.categoryList = new List<Category>();
			this.categoryList = categoryList;
			BaseVC.selectedCategories = categoryList;
		}

		public override nint GetItemsCount(UICollectionView collectionView, nint section)
		{
			int count = 0;
			if (categoryList != null)
				count = categoryList.Count;
			return count;
		}

		public override UICollectionViewCell GetCell(UICollectionView collectionView, NSIndexPath indexPath)
		{
			var cell = (CategoryCollectionCell)collectionView.DequeueReusableCell("categoryCollectionCell", indexPath);
			if (categoryList != null)
			{
				cell.setCategoryName(categoryList[indexPath.Row].Name);
				cell.setSelected(categoryList[indexPath.Row].IsDefaultSuggestion);
			}
			return cell;
		}

		public override void ItemSelected(UICollectionView collectionView, NSIndexPath indexPath)
		{
			var cell = (CategoryCollectionCell)collectionView.DequeueReusableCell("categoryCollectionCell", indexPath);
			categoryList[indexPath.Row].IsDefaultSuggestion = !categoryList[indexPath.Row].IsDefaultSuggestion;
			BaseVC.selectedCategories = categoryList;
			collectionView.ReloadData();
		}

	}
	public partial class SelectCategoryVC : BaseVC
    {
		string result = "";
		private List<Category> categories;
        public SelectCategoryVC (IntPtr handle) : base (handle)
        {
			
        }

		public override void ViewDidLoad()
		{
			CategoryCollectionSource collectionSource = null;
			base.ViewDidLoad();
			showIndicator("Loading categories...");
			var client = new Client();
			result = client.GetCategories();
			var categoryList = new List<string>();
			hideIndicator();
			if (result != null)
			{
				categories = JsonConvert.DeserializeObject<List<Category>>(result);
			    collectionSource = new CategoryCollectionSource(categories);
				collectionView.Source = collectionSource;
			}
		}

		public override void ViewDidLayoutSubviews()
		{
			UICollectionViewFlowLayout layout = new UICollectionViewFlowLayout();
			layout.ItemSize = new CoreGraphics.CGSize((float)(collectionView.Window.Frame.Size.Width / 4), (float)(collectionView.Window.Frame.Size.Width / 4));
			collectionView.SetCollectionViewLayout(layout, true);
		}

		partial void BtnBack_TouchUpInside(UIButton sender)
		{
			dismissVC();
		}

		partial void BtnNext_TouchUpInside(UIButton sender)
		{
			ConfirmInfoVC vc = (ConfirmInfoVC)Storyboard.InstantiateViewController("ConfirmInfoVC");
			this.NavigationController.PushViewController(vc,true);
		}
	}
}