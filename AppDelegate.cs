using System;

using AVFoundation;
using CoreFoundation;
using CoreMedia;
using CoreVideo;
using Foundation;
using UIKit;


namespace JD.iPhone
{
    // The UIApplicationDelegate for the application. This class is responsible for launching the
    // User Interface of the application, as well as listening (and optionally responding) to application events from iOS.
    [Register("AppDelegate")]
    public class AppDelegate : UIApplicationDelegate
    {
        // class-level declarations

		#region Private Variables

		NSError Error;

		#endregion

		#region Computed Properties

		/// <summary>
		/// Gets or sets the window.
		/// </summary>
		/// <value>The window.</value>
		public override UIWindow Window
        {
            get;
            set;
        }
		/// <summary>
		/// Gets or sets a value indicating whether this device's camera is available.
		/// </summary>
		/// <value><c>true</c> if camera available; otherwise, <c>false</c>.</value>
		public bool CameraAvailable { get; set; }

		/// <summary>
		/// Gets or sets the session.
		/// </summary>
		/// <value>The session.</value>
		public AVCaptureSession Session { get; set; }

		/// <summary>
		/// Gets or sets the capture device.
		/// </summary>
		/// <value>The capture device.</value>
		public AVCaptureDevice CaptureDevice { get; set; }

		/// <summary>
		/// Gets or sets the recorder.
		/// </summary>
		/// <value>The recorder.</value>
		public OutputRecorder Recorder { get; set; }

		/// <summary>
		/// Gets or sets the queue.
		/// </summary>
		/// <value>The queue.</value>
		public DispatchQueue Queue { get; set; }

		/// <summary>
		/// Gets or sets the input.
		/// </summary>
		/// <value>The input.</value>
		public AVCaptureDeviceInput Input { get; set; }

		/// <summary>
		/// Gets or sets the still image output.
		/// </summary>
		/// <value>The still image output.</value>
		public AVCaptureStillImageOutput StillImageOutput { get; set; }

		#endregion

		#region Override Methods

		public static UIStoryboard Storyboard = UIStoryboard.FromName("Storyboard", null);
		public static UIViewController initialViewController;
        public override bool FinishedLaunching(UIApplication application, NSDictionary launchOptions)
        {
            // create a new window instance based on the screen size
            Window = new UIWindow(UIScreen.MainScreen.Bounds);

            Microsoft.WindowsAzure.MobileServices.CurrentPlatform.Init();

			// If you have defined a root view controller, set it here:
			initialViewController = Storyboard.InstantiateInitialViewController() as UIViewController;
            Window.RootViewController = initialViewController;
			UITabBar.Appearance.SelectedImageTintColor = UIColor.FromRGB(14, 125, 202);
			UITabBar.Appearance.BackgroundColor = UIColor.White;
            // make the window visible
            Window.MakeKeyAndVisible();

			// Create a new capture session
			Session = new AVCaptureSession();
			Session.SessionPreset = AVCaptureSession.PresetMedium;

			// Create a device input
			CaptureDevice = AVCaptureDevice.DefaultDeviceWithMediaType(AVMediaType.Video);
			if (CaptureDevice == null)
			{
				//throw new Exception("Video recording not supported on this device");
			}
			else
			{
				// Prepare device for configuration
				if (!CaptureDevice.LockForConfiguration(out Error))
				{
					// There has been an issue, abort
					Console.WriteLine("Error: {0}", Error.LocalizedDescription);
					CaptureDevice.UnlockForConfiguration();
					return false;
				}

				// Configure stream for 15 frames per second (fps)
				CaptureDevice.ActiveVideoMinFrameDuration = new CMTime(1, 15);

				// Unlock configuration
				CaptureDevice.UnlockForConfiguration();

				// Get input from capture device
				Input = AVCaptureDeviceInput.FromDevice(CaptureDevice);
				if (Input == null)
				{
					// Error, report and abort
					Console.WriteLine("Unable to gain input from capture device.");
					CameraAvailable = false;
					return false;
				}

				// Attach input to session
				Session.AddInput(Input);

				// Create a new output
				var output = new AVCaptureVideoDataOutput();
				var settings = new AVVideoSettingsUncompressed();
				settings.PixelFormatType = CVPixelFormatType.CV32BGRA;
				output.WeakVideoSettings = settings.Dictionary;

				// Configure and attach to the output to the session
				Queue = new DispatchQueue("ManCamQueue");
				Recorder = new OutputRecorder();
				output.SetSampleBufferDelegate(Recorder, Queue);
				Session.AddOutput(output);

				// Configure and attach a still image output for bracketed capture
				StillImageOutput = new AVCaptureStillImageOutput();
				var dict = new NSMutableDictionary();
				dict[AVVideo.CodecKey] = new NSNumber((int)AVVideoCodec.JPEG);
				Session.AddOutput(StillImageOutput);

				// Let tabs know that a camera is available
				CameraAvailable = true;
			}
            return true;
        }
		#endregion
        public override void OnResignActivation(UIApplication application)
        {
            // Invoked when the application is about to move from active to inactive state.
            // This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) 
            // or when the user quits the application and it begins the transition to the background state.
            // Games should use this method to pause the game.
        }

        public override void DidEnterBackground(UIApplication application)
        {
            // Use this method to release shared resources, save user data, invalidate timers and store the application state.
            // If your application supports background exection this method is called instead of WillTerminate when the user quits.
        }

        public override void WillEnterForeground(UIApplication application)
        {
            // Called as part of the transiton from background to active state.
            // Here you can undo many of the changes made on entering the background.
        }

        public override void OnActivated(UIApplication application)
        {
            // Restart any tasks that were paused (or not yet started) while the application was inactive. 
            // If the application was previously in the background, optionally refresh the user interface.
        }

        public override void WillTerminate(UIApplication application)
        {
            // Called when the application is about to terminate. Save data, if needed. See also DidEnterBackground.
        }
    }
}


