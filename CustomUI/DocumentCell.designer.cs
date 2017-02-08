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
    [Register ("DocumentCell")]
    partial class DocumentCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSave { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel expiryDate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel fileName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel issuedDate { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel notes { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIPageControl pageControl { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel saveLocation { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView saveLocationView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIScrollView scrollView { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnSave != null) {
                btnSave.Dispose ();
                btnSave = null;
            }

            if (expiryDate != null) {
                expiryDate.Dispose ();
                expiryDate = null;
            }

            if (fileName != null) {
                fileName.Dispose ();
                fileName = null;
            }

            if (issuedDate != null) {
                issuedDate.Dispose ();
                issuedDate = null;
            }

            if (notes != null) {
                notes.Dispose ();
                notes = null;
            }

            if (pageControl != null) {
                pageControl.Dispose ();
                pageControl = null;
            }

            if (saveLocation != null) {
                saveLocation.Dispose ();
                saveLocation = null;
            }

            if (saveLocationView != null) {
                saveLocationView.Dispose ();
                saveLocationView = null;
            }

            if (scrollView != null) {
                scrollView.Dispose ();
                scrollView = null;
            }
        }
    }
}