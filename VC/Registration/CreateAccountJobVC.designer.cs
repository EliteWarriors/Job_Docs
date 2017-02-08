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
    [Register ("CreateAccountJobVC")]
    partial class CreateAccountJobVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnNext { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSelectJob { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSelectRole { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnNext != null) {
                btnNext.Dispose ();
                btnNext = null;
            }

            if (btnSelectJob != null) {
                btnSelectJob.Dispose ();
                btnSelectJob = null;
            }

            if (btnSelectRole != null) {
                btnSelectRole.Dispose ();
                btnSelectRole = null;
            }
        }
    }
}