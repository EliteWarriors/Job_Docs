using Foundation;
using System;
using UIKit;

namespace JD.iPhone
{
	public partial class CreateAccountJobVC : BaseVC
    {
        public CreateAccountJobVC (IntPtr handle) : base (handle)
        {
        }
		public override void ViewDidLoad()
		{
			base.ViewDidLoad();

		}

		public override void ViewDidLayoutSubviews()
		{
			base.ViewDidLayoutSubviews();

		}

		public override void ViewWillAppear(bool animated)
		{
			base.ViewWillAppear(animated);
			if (selectedJob != null)
			{
				btnSelectRole.Enabled = true;
				btnSelectJob.SetTitle(selectedJob.Name, UIControlState.Normal);

			}
			if (selectedRoles != null)
			{
				string btnRoleTitle = "";
				foreach (var item in selectedRoles)
				{
					btnRoleTitle += item.Name+", ";
				}
				// Removing the last 2 characters
				if (btnRoleTitle.Length > 2)
				{
					btnRoleTitle = btnRoleTitle.Remove(btnRoleTitle.Length - 2);
					btnSelectRole.SetTitle(btnRoleTitle, UIControlState.Normal);
				}
			}

		}
	}
}