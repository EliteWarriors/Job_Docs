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
    [Register ("BaseCell")]
    partial class BaseCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView mainView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel message { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView openStatus { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (mainView != null) {
                mainView.Dispose ();
                mainView = null;
            }

            if (message != null) {
                message.Dispose ();
                message = null;
            }

            if (openStatus != null) {
                openStatus.Dispose ();
                openStatus = null;
            }
        }
    }
}