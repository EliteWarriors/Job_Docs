using System;
using System.Collections.Generic;
using CoreAnimation;
using CoreFoundation;
using Foundation;
using JD.API;
using Newtonsoft.Json;
using UIKit;

namespace JD.iPhone
{
	public partial class BaseVC : UIViewController
	{
		public CAGradientLayer newGradient, bottomGradient;
		protected LoadingOverlay loadingOverlay;
		public static User newUser;
		public static Job selectedJob;
		public static List<JobRole> selectedRoles;
		public static List<Category> selectedCategories;
		public static UIImage profilePhoto;
		public static RegistrationVC registrationVC;
		public BaseVC(IntPtr handle) : base(handle)
		{
		}

		public override void ViewDidLoad()
		{
			base.ViewDidLoad();
			newGradient = new CAGradientLayer();
			bottomGradient = new CAGradientLayer();
			newGradient.Colors = new CoreGraphics.CGColor[]
			{
				UIColor.FromRGB(29,131,216).CGColor,
				UIColor.FromRGB(66,151,213).CGColor
			};

			bottomGradient.Colors = new CoreGraphics.CGColor[]
			{
				UIColor.FromRGB(29,131,216).CGColor,
				UIColor.FromRGB(66,151,213).CGColor
			};
			newGradient.Locations = new Foundation.NSNumber[]
			{
				0f,1f
				};

			bottomGradient.Locations = new Foundation.NSNumber[]
			{
				0f,1f
				};

			if (HandlesKeyboardNotifications)
			{
				NSNotificationCenter.DefaultCenter.AddObserver(UIKeyboard.WillHideNotification, OnKeyboardNotification);
				NSNotificationCenter.DefaultCenter.AddObserver(UIKeyboard.WillShowNotification, OnKeyboardNotification);
			}

		}

		public override void DidReceiveMemoryWarning()
		{
			base.DidReceiveMemoryWarning();
			// Release any cached data, images, etc that aren't in use.
		}

		public void dismissVC(bool animation = true)
		{
			if (!animation)
			{
				CATransition transition = new CATransition();
				transition.Duration = 0.3;
				transition.TimingFunction = CAMediaTimingFunction.FromName(CAMediaTimingFunction.EaseInEaseOut);
				transition.Type = CATransition.TransitionPush;
				transition.Subtype = CATransition.TransitionFromRight;
				this.View.Window.Layer.AddAnimation(transition, null);

			}
			if (this.NavigationController != null)
				this.NavigationController.PopViewController(animation);
			else
				this.DismissViewController(animation, null);
		}


		public virtual bool HandlesKeyboardNotifications
		{
			get
			{
				return false;
			}
		}

		/// <summary>
		/// This is how orientation is setup on iOS 6
		/// </summary>
		public override bool ShouldAutorotate()
		{
			return true;
		}

		/// <summary>
		/// This is how orientation is setup on iOS 6
		/// </summary>
		public override UIInterfaceOrientationMask GetSupportedInterfaceOrientations()
		{
			return UIInterfaceOrientationMask.All;
		}

		void OnKeyboardNotification(NSNotification notification)
		{
			if (!IsViewLoaded)
				return;

			//Check if the keyboard is becoming visible
			bool visible = notification.Name == UIKeyboard.WillShowNotification;

			//Start an animation, using values from the keyboard
			UIView.BeginAnimations("AnimateForKeyboard");
			UIView.SetAnimationBeginsFromCurrentState(true);
			UIView.SetAnimationDuration(UIKeyboard.AnimationDurationFromNotification(notification));
			UIView.SetAnimationCurve((UIViewAnimationCurve)UIKeyboard.AnimationCurveFromNotification(notification));

			//Pass the notification, calculating keyboard height, etc.
			bool landscape = InterfaceOrientation == UIInterfaceOrientation.LandscapeLeft || InterfaceOrientation == UIInterfaceOrientation.LandscapeRight;
			if (visible)
			{
				var keyboardFrame = UIKeyboard.FrameEndFromNotification(notification);
				OnKeyboardChanged(visible, landscape ? keyboardFrame.Width : keyboardFrame.Height);
			}
			else {
				var keyboardFrame = UIKeyboard.FrameBeginFromNotification(notification);
				OnKeyboardChanged(visible, landscape ? keyboardFrame.Width : keyboardFrame.Height);
			}

			//Commit the animation
			UIView.CommitAnimations();
		}

		/// <summary>
		/// Override this method to apply custom logic when the keyboard is shown/hidden
		/// </summary>
		/// <param name='visible'>
		/// If the keyboard is visible
		/// </param>
		/// <param name='height'>
		/// Calculated height of the keyboard (width not generally needed here)
		/// </param>
		protected virtual void OnKeyboardChanged(bool visible, nfloat height)
		{

		}

		public static void applyShadow(UIView view)
		{
			view.Layer.ShadowColor = UIColor.FromRGB(0, 0, 0).CGColor;
			view.Layer.ShadowOpacity = 0.50f;
			view.Layer.ShadowRadius = 2;
			view.Layer.ShadowOffset = new CoreGraphics.CGSize(0, -2);
		}

		protected void showIndicator(string message)
		{

			DispatchQueue.MainQueue.DispatchAsync(() =>
			{
				var bounds = UIScreen.MainScreen.Bounds;

				// show the loading overlay on the UI thread using the correct orientation sizing
				loadingOverlay = new LoadingOverlay(bounds, message);

				//var response = client.Register(user);
				View.Add(loadingOverlay);
			});
		}

		protected void hideIndicator()
		{
			DispatchQueue.MainQueue.DispatchAsync(() =>
			{
				loadingOverlay.Hide();
			});
		}

		protected void storeJobPreference(Job job)
		{
			var plist = NSUserDefaults.StandardUserDefaults;
			plist.SetString(JsonConvert.SerializeObject(job), (Foundation.NSString)"selected_job");
			plist.Synchronize();
		}

		protected Job loadJobPreference()
		{
			var plist = NSUserDefaults.StandardUserDefaults;
			string jobString = plist.StringForKey("selected_job");
			return JsonConvert.DeserializeObject<Job>(jobString);
		}

	}
}