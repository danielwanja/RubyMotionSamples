class ThreeController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.greenColor
    navigationItem.title = 'Three'
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end