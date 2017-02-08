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
    [Register ("CategoryCollectionCell")]
    partial class CategoryCollectionCell
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView banner { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel categoryName { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (banner != null) {
                banner.Dispose ();
                banner = null;
            }

            if (categoryName != null) {
                categoryName.Dispose ();
                categoryName = null;
            }
        }
    }
}