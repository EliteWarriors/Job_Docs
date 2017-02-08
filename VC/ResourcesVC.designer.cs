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
    [Register ("ResourcesVC")]
    partial class ResourcesVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

		[Outlet]
		[GeneratedCode("iOS Designer", "1.0")]
		UIKit.UIView navBarView { get; set; }

        void ReleaseDesignerOutlets ()
        {
            if (table != null) {
                table.Dispose ();
                table = null;
            }
        }
    }
}