class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @tabBarController = UITabBarController.alloc.init
    v1 =  UINavigationController.alloc.initWithRootViewController(WhiteController.new)
    v2 =  UINavigationController.alloc.initWithRootViewController(BlueController.new)
    v3 =  UINavigationController.alloc.initWithRootViewController(GreenController.new)
    @tabBarController.viewControllers = [v1,v2,v3]    
    @tabBarController.tabBar.items[0].title="white" # TODO: find nicere way to set tab names
    @tabBarController.tabBar.items[1].title="blue"
    @tabBarController.tabBar.items[2].title="green"
    @window = UIWindow.alloc.initWithFrame( UIScreen.mainScreen.bounds )
    @window.rootViewController = @tabBarController
    @window.makeKeyAndVisible
    true
  end
end
