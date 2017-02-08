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
    [Register ("MainTabMenuVC")]
    partial class MainTabMenuVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnMenuClose { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnOpenCategory { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnOpenDocument { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView createNewMenu { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView spaceView { get; set; }

        [Action ("BtnMenuClose_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnMenuClose_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnOpenCategory_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnOpenCategory_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnOpenDocument_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnOpenDocument_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnMenuClose != null) {
                btnMenuClose.Dispose ();
                btnMenuClose = null;
            }

            if (btnOpenCategory != null) {
                btnOpenCategory.Dispose ();
                btnOpenCategory = null;
            }

            if (btnOpenDocument != null) {
                btnOpenDocument.Dispose ();
                btnOpenDocument = null;
            }

            if (createNewMenu != null) {
                createNewMenu.Dispose ();
                createNewMenu = null;
            }

            if (spaceView != null) {
                spaceView.Dispose ();
                spaceView = null;
            }
        }
    }
}