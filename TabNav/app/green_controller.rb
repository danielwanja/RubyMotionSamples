class GreenController < UITableViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.greenColor
    navigationItem.title = 'Green Pane'
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end