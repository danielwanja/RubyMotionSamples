# Inspired by on Erica Sadun's examples: https://github.com/erica/iOS-5-Cookbook/tree/master/C05/05-Basic%20Pages
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @rootViewController = RootViewController.alloc.init
    @window =  UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = @rootViewController
    @window.makeKeyAndVisible    
    true
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end

end
