using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class ThankyouVC : UIViewController
    {
        public ThankyouVC (IntPtr handle) : base (handle)
		{
        }

		partial void BtnGoHome_TouchUpInside(UIButton sender)
		{
			LoginVC nav = Storyboard.InstantiateViewController("LoginVC") as LoginVC;
			this.NavigationController.PushViewController(nav, false);

		}
	}
}