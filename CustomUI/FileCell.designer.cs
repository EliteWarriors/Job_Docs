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
    [Register ("FileCell")]
    partial class FileCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnOptions { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnOptions2 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView fileImage { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView fileImage2 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel fileName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel fileName2 { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel issuedDate { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnOptions != null) {
                btnOptions.Dispose ();
                btnOptions = null;
            }

            if (btnOptions2 != null) {
                btnOptions2.Dispose ();
                btnOptions2 = null;
            }

            if (fileImage != null) {
                fileImage.Dispose ();
                fileImage = null;
            }

            if (fileImage2 != null) {
                fileImage2.Dispose ();
                fileImage2 = null;
            }

            if (fileName != null) {
                fileName.Dispose ();
                fileName = null;
            }

            if (fileName2 != null) {
                fileName2.Dispose ();
                fileName2 = null;
            }

            if (issuedDate != null) {
                issuedDate.Dispose ();
                issuedDate = null;
            }
        }
    }
}