class BlueController < UIViewController
  attr_accessor :popoverViewController
  attr_accessor :masterViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.blueColor
    navigationItem.title = 'Right Pane'
   @button = UIBarButtonItem.alloc.initWithTitle("Show Master", style:UIBarButtonItemStylePlain, target:self, action:'showDetails')   
   if UIDevice.currentDevice.orientation == UIDeviceOrientationPortrait ||
      UIDevice.currentDevice.orientation == UIDeviceOrientationPortraitUpsideDown
     navigationItem.leftBarButtonItem = @button 
   end
  end
  
  def showDetails
    @popoverViewController = UIPopoverController.alloc.initWithContentViewController(masterViewController)
    @popoverViewController.presentPopoverFromBarButtonItem(@button, permittedArrowDirections:UIPopoverArrowDirectionUp, animated:false)
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end

  # Note: not implementing this method results in the default behavior which hides the first controller
  #       in portrait.
  # def splitViewController(sc, shouldHideViewController:c, inOrientation:o)
  #   true
  # end

  def splitViewController(svc, willHideViewController:vc, withBarButtonItem:barButtonItem, forPopoverController:pc)
    @masterViewController = vc
    # We ignore withBarButtonItem and forPopoverController to better control the display
    navigationItem.leftBarButtonItem = @button      
  end

  def splitViewController(svc, willShowViewController:vc, invalidatingBarButtonItem:barButtonItem) 
    navigationItem.leftBarButtonItem = nil
    if (popoverViewController)
      popoverViewController.dismissPopoverAnimated(true)
      popoverViewController = nil
    end
  end
        
end