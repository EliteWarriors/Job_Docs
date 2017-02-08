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
    [Register ("ProfileCell")]
    partial class ProfileCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField content { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView itemImage { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel label { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (content != null) {
                content.Dispose ();
                content = null;
            }

            if (itemImage != null) {
                itemImage.Dispose ();
                itemImage = null;
            }

            if (label != null) {
                label.Dispose ();
                label = null;
            }
        }
    }
}