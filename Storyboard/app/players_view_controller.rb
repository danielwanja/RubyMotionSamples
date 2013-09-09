class PlayersViewController < UITableViewController
    
    LABEL_FIELD  = 100
    GAME_FIELD   = 101
    RATING_FIELD = 102
    
    def viewDidLoad
      view.dataSource = view.delegate = self      
      @players = Player.default_players
    end    
    
    def tableView(tableView, numberOfRowsInSection:section)
        @players.size
    end
    
    def tableView(tableView, cellForRowAtIndexPath: index_path)
      cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell")
      player = @players[index_path.row]
      name_label = cell.viewWithTag(LABEL_FIELD)
      name_label.text = player.name      
      game_label = cell.viewWithTag(GAME_FIELD)
      game_label.text = player.game
      rating = cell.viewWithTag(RATING_FIELD)
      rating.image = rating_image(player.rating)
      cell
    end

    def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
      if editingStyle == UITableViewCellEditingStyleDelete
        @players.delete_at(indexPath.row)
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
      end
    end
    
    def tableView(table_view, didSelectRowAtIndexPath: index_path)
      puts "selected player:#{index_path.row} self:#{self}"
    end
        
    def prepareForSegue(segue, sender:sender)
      puts "#{self.to_s}: CustomViewController1::prepareForSegue '#{segue.identifier}'"

      if segue.identifier == "AddPlayer"
        navigation_controller = segue.destinationViewController
        player_details_view_controller = navigation_controller.viewControllers[0]
        player_details_view_controller.delegate = self
      end
      
      if segue.identifier == "EditPlayer"
        navigation_controller = segue.destinationViewController
        player_details_view_controller = navigation_controller.viewControllers[0]
        player_details_view_controller.delegate = self
        index_path = tableView.indexPathForCell(sender)
        player = @players[index_path.row]
        puts "[1] IN SEGUE:#{player.nil?}"
        player_details_view_controller.selected_player = player
      end
    end
    
    def player_added(player)
      @players << player
      index_path = NSIndexPath.indexPathForRow(-1, inSection:0)
      tableView.insertRowsAtIndexPaths([index_path], withRowAnimation:UITableViewRowAnimationAutomatic)
    end
    
    protected
    
    def rating_image(rating)
      UIImage.imageNamed "#{rating}StarsSmall.png"
    end
    
end