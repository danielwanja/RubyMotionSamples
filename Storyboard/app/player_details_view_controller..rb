class PlayerDetailsViewController < UITableViewController
  
  def awakeFromNib
    # make sure our views are loaded
    self.view
  end

  def viewDidLoad
    @done_button   = self.navigationItem.rightBarButtonItem
    @cancel_button = self.navigationItem.leftBarButtonItem
    raise "cancel_button not found" unless @cancel_button
    
    @done_button.target_action(self, 'done_clicked')  # FIXME: is there not another way via delegates?
    @cancel_button.target_action(self, 'cancel_clicked') 
  end

  def done_clicked
    self.view.backgroundColor = UIColor.greenColor
  end
  
  def cancel_clicked 
    self.view.backgroundColor = UIColor.redColor
  end
end