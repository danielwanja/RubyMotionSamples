class OneController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    navigationItem.title = 'One'
    
    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.frame = [[10,10],[view.frame.size.width-20, 30]] 
    @button.setTitle("-> 2", forState: UIControlStateNormal)
    @button.addTarget(self, action: "goto2", forControlEvents: UIControlEventTouchUpInside)
    view.addSubview(@button)    
  end

  def goto2
    navigationController.pushViewController(TwoController.new, animated:true)
  end    

  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end