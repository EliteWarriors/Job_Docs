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
    [Register ("CameraVC")]
    partial class CameraVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnBack { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCheck { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnShutter { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView cameraView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel lblCount { get; set; }

        [Action ("BtnBack_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnBack_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnCheck_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnCheck_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnShutter_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnShutter_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnBack != null) {
                btnBack.Dispose ();
                btnBack = null;
            }

            if (btnCheck != null) {
                btnCheck.Dispose ();
                btnCheck = null;
            }

            if (btnShutter != null) {
                btnShutter.Dispose ();
                btnShutter = null;
            }

            if (cameraView != null) {
                cameraView.Dispose ();
                cameraView = null;
            }

            if (lblCount != null) {
                lblCount.Dispose ();
                lblCount = null;
            }
        }
    }
}