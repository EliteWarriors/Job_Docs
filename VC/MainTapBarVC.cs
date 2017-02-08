using Foundation;
using System;
using UIKit;
using CoreGraphics;

namespace JD.iPhone
{
    public partial class MainTapBarVC : UITabBarController
    {
		public UIButton button;
		public static int previousIndex = 0 ;
		public MainTapBarVC (IntPtr handle) : base (handle)
        {
			
        }
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			//Adding center button
			UIImage buttonImage = UIImage.FromBundle("Plus");
			button = new UIButton(UIButtonType.Custom);
			button.Frame = new CoreGraphics.CGRect(0.0, 0.0, buttonImage.Size.Width+10, buttonImage.Size.Height+10);
			button.SetBackgroundImage(buttonImage, UIControlState.Normal);
			button.SetBackgroundImage(buttonImage, UIControlState.Highlighted);
			var heightDifference = buttonImage.Size.Height - this.TabBar.Frame.Size.Height;
			if (heightDifference< 0)
			   button.Center = this.TabBar.Center;
			else
			{
				CGPoint center = this.TabBar.Center;
				center.Y = (System.nfloat)(center.Y - heightDifference / 2.0) + 10;
				button.Center = center;
			}

			button.TouchUpInside += (sender, e) =>
			{
				MainTabMenuVC menu = (MainTabMenuVC)Storyboard.InstantiateViewController("MainTabBarMenu");
				menu.ModalPresentationStyle = UIModalPresentationStyle.Popover;
				menu.ModalTransitionStyle = UIModalTransitionStyle.CoverVertical;

				this.View.AddSubview(menu.View);
			};
			this.View.AddSubview(button);

		
			this.ViewControllerSelected += (sender, e) =>
			{
				// Take action based on the tab being selected
				switch (TabBar.SelectedItem.Title)
				{
					
					case "Export":
						// Make sure the light information is Up-to-date

						break;
				}
			};
		}


    }
}