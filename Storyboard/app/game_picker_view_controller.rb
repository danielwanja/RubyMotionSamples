class GamePickerViewController < UITableViewController
  
  attr_accessor :delegate
  attr_accessor :selected_game

  def viewDidLoad
    puts "viewDidLoad:#{self}"
    @games = ['Angry Birds' , 'Chess', 'Russian Roulette', 'Spin the Bottle', 'Textas Hold''em Poker', 'Tic-Tac-Toe']
    puts @games
    self.selected_game = "Chess"
  end

  def numberOfSectionsInTableView(table_view)
    1
  end
    
  def tableView(tableView, numberOfRowsInSection:section)
      @games.size
  end
  
  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier("GameCell")
    game = @games[index_path.row]
    cell.textLabel.text = game
    cell.accessoryType = game==selected_game ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone
    cell
  end
  
  
  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    selected_game = @games[index_path.row]
    delegate.did_select_game(selected_game)
    dismissViewControllerAnimated(true, completion: lambda {})
    # FIXME: that returns to far 
  end

  
end