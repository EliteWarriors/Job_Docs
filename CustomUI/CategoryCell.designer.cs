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
    [Register ("CategoryCell")]
    partial class CategoryCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnOptions { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel categoryName { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel itemCount { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIScrollView scrollView { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (btnOptions != null) {
                btnOptions.Dispose ();
                btnOptions = null;
            }

            if (categoryName != null) {
                categoryName.Dispose ();
                categoryName = null;
            }

            if (itemCount != null) {
                itemCount.Dispose ();
                itemCount = null;
            }

            if (scrollView != null) {
                scrollView.Dispose ();
                scrollView = null;
            }
        }
    }
}