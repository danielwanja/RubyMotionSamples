class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window =  UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = LayoutController.new
    @window.makeKeyAndVisible
    true
  end

end
