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
    [Register ("CheckCell")]
    partial class CheckCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCheck { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel lblText { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnCheck != null) {
                btnCheck.Dispose ();
                btnCheck = null;
            }

            if (lblText != null) {
                lblText.Dispose ();
                lblText = null;
            }
        }
    }
}