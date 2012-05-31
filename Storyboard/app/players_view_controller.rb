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
    
    protected
    
    def rating_image(rating)
      UIImage.imageNamed "#{rating}StarsSmall.png"
    end
    
end