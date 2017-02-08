using System;

using UIKit;

namespace JD.iPhone
{
	public partial class LoginVC : UIViewController
	{
		public LoginVC(IntPtr handle) : base(handle)
		{
		}

		partial void BtnSignin_TouchUpInside(UIButton sender)
		{
			UITabBarController nav = (UITabBarController)Storyboard.InstantiateViewController("mainTabBar");
			this.NavigationController.PushViewController(nav,true);
		}

		public override void ViewWillAppear(bool animated)
		{
			base.ViewWillAppear(animated);
		
			UITabBarController nav = (UITabBarController)Storyboard.InstantiateViewController("mainTabBar");
			//this.NavigationController.PushViewController(nav, true);
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			txtEmail.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
			txtPassword.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
		}

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}


		partial void BtnForgot_TouchUpInside(UIButton sender)
		{
			
		}
	}
}

