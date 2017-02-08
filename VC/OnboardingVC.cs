using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
    public partial class OnboardingVC : UIViewController
    {
        public OnboardingVC (IntPtr handle) : base (handle)
        {
        }
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			UITapGestureRecognizer gesture = new UITapGestureRecognizer(NextWindow);
			this.View.AddGestureRecognizer(gesture);
			bottomView.Layer.ShadowColor = UIColor.FromRGBA(0, 0, 0,0.13f).CGColor;
			bottomView.Layer.ShadowOpacity = 1;
			bottomView.Layer.ShadowRadius = 3;
			bottomView.Layer.ShadowOffset = new CoreGraphics.CGSize(0, -3);
			btnLogin.Layer.BorderWidth = 1.0f;
			btnLogin.Layer.BorderColor = UIColor.FromRGB(246, 141, 30).CGColor;
		}
		void NextWindow()
		{
			if (RestorationIdentifier == "Onboarding1")
			{
				var nav = (OnboardingVC)Storyboard.InstantiateViewController("Onboarding2");
				NavigationController.PushViewController(nav, true);
			}
			else if (RestorationIdentifier == "Onboarding2")
			{
				var nav = (OnboardingVC)Storyboard.InstantiateViewController("Onboarding3");
				NavigationController.PushViewController(nav, true);
			}

		}

		partial void BtnSignUp_TouchUpInside(UIButton sender)
		{
			UINavigationController registerVC = Storyboard.InstantiateViewController("RegistrationNav") as UINavigationController;
			PresentViewController(registerVC, true, null);

		}

		partial void BtnLogin_TouchUpInside(UIButton sender)
		{
			LoginVC loginVC = (LoginVC)Storyboard.InstantiateViewController("LoginVC");
			NavigationController.PushViewController(loginVC, true);
		}
	}
}