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
    [Register ("PhotoCroppingVC")]
    partial class PhotoCroppingVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnBack { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCancel { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnDelete { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnNext { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnRotate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView cropView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel lblCount { get; set; }

        [Action ("BtnBack_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnBack_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnCancel_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnCancel_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnNext_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnNext_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnBack != null) {
                btnBack.Dispose ();
                btnBack = null;
            }

            if (btnCancel != null) {
                btnCancel.Dispose ();
                btnCancel = null;
            }

            if (btnDelete != null) {
                btnDelete.Dispose ();
                btnDelete = null;
            }

            if (btnNext != null) {
                btnNext.Dispose ();
                btnNext = null;
            }

            if (btnRotate != null) {
                btnRotate.Dispose ();
                btnRotate = null;
            }

            if (cropView != null) {
                cropView.Dispose ();
                cropView = null;
            }

            if (lblCount != null) {
                lblCount.Dispose ();
                lblCount = null;
            }
        }
    }
}