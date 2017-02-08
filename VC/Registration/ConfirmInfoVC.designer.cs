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
    [Register ("ConfirmInfoVC")]
    partial class ConfirmInfoVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnBack { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnCategoryEdit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnChangeProfile { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnConfirm { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnInfoEdit { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UICollectionView collectionView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIImageView imgPhoto { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

        [Action ("BtnBack_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnBack_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnCategoryEdit_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnCategoryEdit_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnChangeProfile_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnChangeProfile_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnConfirm_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnConfirm_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnInfoEdit_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnInfoEdit_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (btnBack != null) {
                btnBack.Dispose ();
                btnBack = null;
            }

            if (btnCategoryEdit != null) {
                btnCategoryEdit.Dispose ();
                btnCategoryEdit = null;
            }

            if (btnChangeProfile != null) {
                btnChangeProfile.Dispose ();
                btnChangeProfile = null;
            }

            if (btnConfirm != null) {
                btnConfirm.Dispose ();
                btnConfirm = null;
            }

            if (btnInfoEdit != null) {
                btnInfoEdit.Dispose ();
                btnInfoEdit = null;
            }

            if (collectionView != null) {
                collectionView.Dispose ();
                collectionView = null;
            }

            if (imgPhoto != null) {
                imgPhoto.Dispose ();
                imgPhoto = null;
            }

            if (table != null) {
                table.Dispose ();
                table = null;
            }
        }
    }
}