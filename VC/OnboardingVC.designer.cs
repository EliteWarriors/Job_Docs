// WARNING
//
// This file has been generated automatically by Xamarin Studio from the outlets and
// actions declared in your storyboard file.
// Manual changes to this file will not be maintained.
//
using Foundation;
using System;
using System.CodeDom.Compiler;
using UIKit;

namespace JD.iPhone
{
    [Register ("OnboardingVC")]
    partial class OnboardingVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView bottomView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnLogin { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSignUp { get; set; }

        [Action ("BtnLogin_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnLogin_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnSignUp_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnSignUp_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (bottomView != null) {
                bottomView.Dispose ();
                bottomView = null;
            }

            if (btnLogin != null) {
                btnLogin.Dispose ();
                btnLogin = null;
            }

            if (btnSignUp != null) {
                btnSignUp.Dispose ();
                btnSignUp = null;
            }
        }
    }
}