# Start with http://www.freelancemadscience.com/process/CreateJournalEntryComment?moduleId=9994348&entryId=16316773&finalize=true
# and now adapting the iOS Tutorial book example on using Storyboard.

# TODO:
# game_picker_view should keep track of the selected game
# when editing the selected player should be passed to the details
# when editing the selected game should be passed to the game picker


# Similar to BubbleWrap extension but for UIBarButtonItem. Note the action must be a string:
module UIBarButtonItemWrap
  def target_action(target, action)
    self.target = target
    self.action = action
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIBarButtonItem.send(:include, UIBarButtonItemWrap)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    storyboard = UIStoryboard.storyboardWithName("Main", bundle:nil)
    rootVC = storyboard.instantiateViewControllerWithIdentifier("Main")

    @window.rootViewController = rootVC
    @window.makeKeyAndVisible
    true
  end
end
