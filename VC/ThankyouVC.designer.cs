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
    [Register ("ThankyouVC")]
    partial class ThankyouVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnGoHome { get; set; }

        [Action ("BtnGoHome_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnGoHome_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnGoHome != null) {
                btnGoHome.Dispose ();
                btnGoHome = null;
            }
        }
    }
}