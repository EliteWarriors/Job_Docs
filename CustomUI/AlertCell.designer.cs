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
    [Register ("AlertCell")]
    partial class AlertCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView alertImage { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel message { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (alertImage != null) {
                alertImage.Dispose ();
                alertImage = null;
            }

            if (message != null) {
                message.Dispose ();
                message = null;
            }
        }
    }
}