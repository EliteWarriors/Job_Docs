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
    [Register ("ExportCell")]
    partial class ExportCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSelect { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel categoryName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView fileImage { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel fileName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel issuedDate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel itemCount { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView openStatus { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnSelect != null) {
                btnSelect.Dispose ();
                btnSelect = null;
            }

            if (categoryName != null) {
                categoryName.Dispose ();
                categoryName = null;
            }

            if (fileImage != null) {
                fileImage.Dispose ();
                fileImage = null;
            }

            if (fileName != null) {
                fileName.Dispose ();
                fileName = null;
            }

            if (issuedDate != null) {
                issuedDate.Dispose ();
                issuedDate = null;
            }

            if (itemCount != null) {
                itemCount.Dispose ();
                itemCount = null;
            }

            if (openStatus != null) {
                openStatus.Dispose ();
                openStatus = null;
            }
        }
    }
}