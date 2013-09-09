class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    navigationController = UINavigationController.alloc.initWithRootViewController(OneController.new)
    @window =  UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible
    true
  end
end
