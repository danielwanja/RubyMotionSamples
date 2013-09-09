class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    @tabBarController = UITabBarController.alloc.init
    v1 =  UINavigationController.alloc.initWithRootViewController(BarViewController.new)
    v2 =  UINavigationController.alloc.initWithRootViewController(GraphViewController.new)
    v3 =  UINavigationController.alloc.initWithRootViewController(PieViewController.new)
    @tabBarController.viewControllers = [v1,v2,v3]    
    @tabBarController.tabBar.items[0].title="Bar" # TODO: find nicere way to set tab names
    @tabBarController.tabBar.items[1].title="Line"
    @tabBarController.tabBar.items[2].title="Pie"
    @window = UIWindow.alloc.initWithFrame( UIScreen.mainScreen.bounds )
    @window.rootViewController = @tabBarController
    @window.makeKeyAndVisible


    true
  end
end