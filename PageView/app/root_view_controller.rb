class RootViewController < UIViewController
  attr_accessor :modelController
  attr_accessor :pageViewController
  
  def viewDidLoad
    super
    @pageViewController = UIPageViewController.alloc.initWithTransitionStyle(UIPageViewControllerTransitionStylePageCurl,
                        navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal, options:nil)
    @pageViewController.delegate = self; 
    
    
    startingViewController = modelController.viewControllerAtIndex(0, storyboard:nil)
    viewControllers = [startingViewController]
    @pageViewController.setViewControllers(viewControllers, direction:UIPageViewControllerNavigationDirectionForward,
                                           animated:false, completion:lambda{|a|}) # completion:nil blows up!
    @pageViewController.dataSource = modelController
    
    addChildViewController(@pageViewController)
    view.addSubview(@pageViewController.view)

    # Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
#    self.pageViewController.view.frame = CGRectInset(view.bounds, 40.0, 40.0)
    @pageViewController.didMoveToParentViewController(self)

    # Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    view.gestureRecognizers = @pageViewController.gestureRecognizers    
  end
  
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end  
  
  def modelController
    @modelController ||= ModelController.new
  end

  #  UIPageViewController delegate methods
  
  def pageViewController(pvc, spineLocationForInterfaceOrientation:orientation)
    currentViewController = @pageViewController.viewControllers[0]
    portrait = UIDevice.currentDevice.orientation == UIDeviceOrientationPortrait || UIDevice.currentDevice.orientation == UIDeviceOrientationPortraitUpsideDown
    if (portrait) 
      # In portrait orientation: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
      viewControllers = [currentViewController]
      pageViewController.setViewControllers(viewControllers, direction:UIPageViewControllerNavigationDirectionForward, animated:true, completion:lambda{|a|})
      @pageViewController.doubleSided = false;
      return UIPageViewControllerSpineLocationMin
    else
      # In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
      index = modelController.indexOfViewController(currentViewController)
      if (index==0||index%2==0)
        nextViewController = modelController.pageViewController(pageViewController, viewControllerAfterViewController: currentViewController)
        viewControllers = [currentViewController, nextViewController]
      else
        previousViewController = modelController.pageViewController(pageViewController, viewControllerBeforeViewController: currentViewController)
        viewControllers = [previousViewController, currentViewController]
      end
      pageViewController.setViewControllers(viewControllers, direction:UIPageViewControllerNavigationDirectionForward, animated:true, completion:lambda{|a|})
      @pageViewController.doubleSided = true;
      return UIPageViewControllerSpineLocationMid
    end
  end
  
end