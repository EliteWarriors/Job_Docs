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
    [Register ("SaveLocationVC")]
    partial class SaveLocationVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView bottomFrameView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnBack { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCancel { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView navBarView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

        [Action ("BtnBack_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnBack_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnCancel_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnCancel_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (bottomFrameView != null) {
                bottomFrameView.Dispose ();
                bottomFrameView = null;
            }

            if (btnBack != null) {
                btnBack.Dispose ();
                btnBack = null;
            }

            if (btnCancel != null) {
                btnCancel.Dispose ();
                btnCancel = null;
            }

            if (navBarView != null) {
                navBarView.Dispose ();
                navBarView = null;
            }

            if (table != null) {
                table.Dispose ();
                table = null;
            }
        }
    }
}