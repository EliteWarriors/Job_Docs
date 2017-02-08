using System;
using UIKit;

namespace JD.iPhone
{
	public partial class RegistrationVC : BaseVC
	{
		public RegistrationVC(IntPtr handle) : base(handle)
		{
		}

		partial void BtnSignup_TouchUpInside(UIButton sender)
		{
			CreateAccountJobVC nav = (CreateAccountJobVC)Storyboard.InstantiateViewController("CreateAccountJobVC");
			this.NavigationController.PushViewController(nav, true);
		}

		partial void BtnClose_TouchUpInside(UIButton sender)
		{
			DismissViewController(true, null);
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			txtEmail.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
			txtPassword.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
			txtZipCode.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
			txtFullName.ShouldReturn += (textField) =>
			{
				((UITextField)textField).ResignFirstResponder();
				return true;
			};
		}
		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}

	}
}