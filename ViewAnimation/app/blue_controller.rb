class BlueController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.blueColor
    navigationItem.title = 'Blue Pane'
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end