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
    [Register ("HomeVC")]
    partial class HomeVC
    {
        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView actionMenu { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView actionView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel alertCount { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton bellButton { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnActionMenuClose { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnAlphabeticalOrder { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnDelete { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnDeleteCancel { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnDeleteYes { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnDocumentCount { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnRecentlyModified { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnRename { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnRenameNo { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnRenameYes { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnShare { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSheetClose { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton btnSort { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView deleteView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView gradientView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView maskView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UILabel navTitle { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView navView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView profileView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView renameView { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIButton searchButton { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UIView sortMenu { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITableView table { get; set; }

        [Outlet]
        [GeneratedCode ("iOS Designer", "1.0")]
        UIKit.UITextField txtRename { get; set; }

        [Action ("BellButton_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BellButton_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnActionMenuClose_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnActionMenuClose_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnAlphabeticalOrder_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnAlphabeticalOrder_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnDeleteCancel_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnDeleteCancel_TouchUpInside (UIKit.UIButton sender);

        [Action ("btnDeleteTapped:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void btnDeleteTapped (UIKit.UIButton sender);

        [Action ("BtnDeleteYes_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnDeleteYes_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnDocumentCount_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnDocumentCount_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnRecentlyModified_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnRecentlyModified_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnRename_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnRename_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnRenameNo_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnRenameNo_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnRenameYes_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnRenameYes_TouchUpInside (UIKit.UIButton sender);

        [Action ("btnShareButtonTapped:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void btnShareButtonTapped (UIKit.UIButton sender);

        [Action ("btnShareTapped:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void btnShareTapped (UIKit.UIButton sender);

        [Action ("BtnSheetClose_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnSheetClose_TouchUpInside (UIKit.UIButton sender);

        [Action ("BtnSort_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void BtnSort_TouchUpInside (UIKit.UIButton sender);

        [Action ("SearchButton_TouchUpInside:")]
        [GeneratedCode ("iOS Designer", "1.0")]
        partial void SearchButton_TouchUpInside (UIKit.UIButton sender);

        void ReleaseDesignerOutlets ()
        {
            if (actionMenu != null) {
                actionMenu.Dispose ();
                actionMenu = null;
            }

            if (actionView != null) {
                actionView.Dispose ();
                actionView = null;
            }

            if (alertCount != null) {
                alertCount.Dispose ();
                alertCount = null;
            }

            if (bellButton != null) {
                bellButton.Dispose ();
                bellButton = null;
            }

            if (btnActionMenuClose != null) {
                btnActionMenuClose.Dispose ();
                btnActionMenuClose = null;
            }

            if (btnAlphabeticalOrder != null) {
                btnAlphabeticalOrder.Dispose ();
                btnAlphabeticalOrder = null;
            }

            if (btnDelete != null) {
                btnDelete.Dispose ();
                btnDelete = null;
            }

            if (btnDeleteCancel != null) {
                btnDeleteCancel.Dispose ();
                btnDeleteCancel = null;
            }

            if (btnDeleteYes != null) {
                btnDeleteYes.Dispose ();
                btnDeleteYes = null;
            }

            if (btnDocumentCount != null) {
                btnDocumentCount.Dispose ();
                btnDocumentCount = null;
            }

            if (btnRecentlyModified != null) {
                btnRecentlyModified.Dispose ();
                btnRecentlyModified = null;
            }

            if (btnRename != null) {
                btnRename.Dispose ();
                btnRename = null;
            }

            if (btnRenameNo != null) {
                btnRenameNo.Dispose ();
                btnRenameNo = null;
            }

            if (btnRenameYes != null) {
                btnRenameYes.Dispose ();
                btnRenameYes = null;
            }

            if (btnShare != null) {
                btnShare.Dispose ();
                btnShare = null;
            }

            if (btnSheetClose != null) {
                btnSheetClose.Dispose ();
                btnSheetClose = null;
            }

            if (btnSort != null) {
                btnSort.Dispose ();
                btnSort = null;
            }

            if (deleteView != null) {
                deleteView.Dispose ();
                deleteView = null;
            }

            if (gradientView != null) {
                gradientView.Dispose ();
                gradientView = null;
            }

            if (maskView != null) {
                maskView.Dispose ();
                maskView = null;
            }

            if (navTitle != null) {
                navTitle.Dispose ();
                navTitle = null;
            }

            if (navView != null) {
                navView.Dispose ();
                navView = null;
            }

            if (profileView != null) {
                profileView.Dispose ();
                profileView = null;
            }

            if (renameView != null) {
                renameView.Dispose ();
                renameView = null;
            }

            if (searchButton != null) {
                searchButton.Dispose ();
                searchButton = null;
            }

            if (sortMenu != null) {
                sortMenu.Dispose ();
                sortMenu = null;
            }

            if (table != null) {
                table.Dispose ();
                table = null;
            }

            if (txtRename != null) {
                txtRename.Dispose ();
                txtRename = null;
            }
        }
    }
}