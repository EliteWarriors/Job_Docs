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
    [Register ("LoginVC")]
    partial class LoginVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCreate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnForgot { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSignin { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtEmail { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtPassword { get; set; }

        [Action ("BtnForgot_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnForgot_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnSignin_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnSignin_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnCreate != null) {
                btnCreate.Dispose ();
                btnCreate = null;
            }

            if (btnForgot != null) {
                btnForgot.Dispose ();
                btnForgot = null;
            }

            if (btnSignin != null) {
                btnSignin.Dispose ();
                btnSignin = null;
            }

            if (txtEmail != null) {
                txtEmail.Dispose ();
                txtEmail = null;
            }

            if (txtPassword != null) {
                txtPassword.Dispose ();
                txtPassword = null;
            }
        }
    }
}