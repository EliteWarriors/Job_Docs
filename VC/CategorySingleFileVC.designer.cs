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
    [Register ("CategorySingleFileVC")]
    partial class CategorySingleFileVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnBack { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnMore { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView gradientView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel navTitle { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView navView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView profileView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

        [Action ("BtnBack_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnBack_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnMore_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnMore_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnBack != null) {
                btnBack.Dispose ();
                btnBack = null;
            }

            if (btnMore != null) {
                btnMore.Dispose ();
                btnMore = null;
            }

            if (gradientView != null) {
                gradientView.Dispose ();
                gradientView = null;
            }

            if (navTitle != null) {
                navTitle.Dispose ();
                navTitle = null;
            }

            if (navView != null) {
                navView.Dispose ();
                navView = null;
            }

            if (profileView != null) {
                profileView.Dispose ();
                profileView = null;
            }

            if (table != null) {
                table.Dispose ();
                table = null;
            }
        }
    }
}