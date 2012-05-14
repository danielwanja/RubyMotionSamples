=begin
  see https://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UISplitViewControllerDelegate_protocol/Reference/Reference.html
=end
class AppDelegate
    
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    splitViewController =  UISplitViewController.alloc.init
    @blue = BlueController.new
    master = UINavigationController.alloc.initWithRootViewController(WhiteController.new)
    @detail = UINavigationController.alloc.initWithRootViewController(@blue)
    splitViewController.viewControllers = [master, @detail]
    splitViewController.delegate = @blue
    @window =  UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = splitViewController
    @window.makeKeyAndVisible
    true
  end
  
  
end