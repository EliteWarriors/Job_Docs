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
    [Register ("RegistrationVC")]
    partial class RegistrationVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnClose { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnFBlogin { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnGoogleLogin { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSignup { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView imgPhoto { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtEmail { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtFullName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtPassword { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtZipCode { get; set; }

        [Action ("BtnClose_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnClose_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnSignup_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnSignup_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnClose != null) {
                btnClose.Dispose ();
                btnClose = null;
            }

            if (btnFBlogin != null) {
                btnFBlogin.Dispose ();
                btnFBlogin = null;
            }

            if (btnGoogleLogin != null) {
                btnGoogleLogin.Dispose ();
                btnGoogleLogin = null;
            }

            if (btnSignup != null) {
                btnSignup.Dispose ();
                btnSignup = null;
            }

            if (imgPhoto != null) {
                imgPhoto.Dispose ();
                imgPhoto = null;
            }

            if (txtEmail != null) {
                txtEmail.Dispose ();
                txtEmail = null;
            }

            if (txtFullName != null) {
                txtFullName.Dispose ();
                txtFullName = null;
            }

            if (txtPassword != null) {
                txtPassword.Dispose ();
                txtPassword = null;
            }

            if (txtZipCode != null) {
                txtZipCode.Dispose ();
                txtZipCode = null;
            }
        }
    }
}