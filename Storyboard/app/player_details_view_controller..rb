class PlayerDetailsViewController < UITableViewController
  
  attr_accessor :delegate
  attr_accessor :selected_player
      
  def awakeFromNib
    # make sure our views are loaded
    self.view
  end
  
  def selected_player
    @selected_player
  end
  
  def selected_player=(value)
    @selected_player = value
    puts "[1] setting selected player:#{selected_player}"
  end

  def viewDidLoad
    @done_button   = self.navigationItem.rightBarButtonItem
    @cancel_button = self.navigationItem.leftBarButtonItem
    
    @done_button.target_action(self, 'done_clicked')  # FIXME: is there not another way via delegates?
    @cancel_button.target_action(self, 'cancel_clicked')   
    puts "[2] view did load :#{self}"
    #load_fields  <-- field are not there yet???
  end
  
  def load_fields
    self.title = selected_player ? "Edit Player" : "Add Player"
    nameField.text = selected_player ? selected_player.name : ""
    gameField.detailLabel.text = selected_player ? selected_player.game : ""
  end

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    puts "selected @nameField:#{nameField} self:#{self}"
    nameField.becomeFirstResponder
  end
  
  def done_clicked
    player = Player.new
    player.game = "Chess"
    player.name = nameField.text
    player.rating = 1
    delegate.player_added(player)
    dismissViewControllerAnimated(true, completion: lambda {})
  end
  
  def cancel_clicked 
    dismissViewControllerAnimated(true, completion:lambda {})
  end
  
  def did_select_game(game)
    selected_player.game = game if selected_player
    puts "selected game:#{game}"
  end
  
  def prepareForSegue(segue, sender:sender)
    puts "#{self.to_s}: CustomViewController1::prepareForSegue '#{segue.identifier}'"

    if segue.identifier == "PickGame"
      game_picker_view_controller = segue.destinationViewController
      game_picker_view_controller.delegate = self
      game_picker_view_controller.selected_game = selected_player.game if selected_player
    end
  end  
  
  def nameField
    @nameField ||= view.viewWithTag(2)
  end
      
  def gameField
    @gameField ||= view.viewWithTag(3)
  end
end