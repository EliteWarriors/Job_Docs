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
    [Register ("AlertVC")]
    partial class AlertVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView navBarView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

        [Action ("UIButtonA0vvadsO_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void UIButtonA0vvadsO_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
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