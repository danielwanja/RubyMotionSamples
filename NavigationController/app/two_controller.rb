class TwoController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.blueColor
    navigationItem.title = 'Two'

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.frame = [[10,10],[view.frame.size.width-20, 30]] 
    @button.setTitle("-> 3", forState: UIControlStateNormal)
    @button.addTarget(self, action: "goto3", forControlEvents: UIControlEventTouchUpInside)
    view.addSubview(@button)    
  end

  def goto3
    navigationController.pushViewController(ThreeController.new, animated:true)
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end