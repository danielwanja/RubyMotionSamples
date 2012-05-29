class Object
  def im
    (methods-Object.methods).sort    
  end
end
  
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    alert = UIAlertView.new
    alert.message = "Hello!"
    alert.addButtonWithTitle("OK")
    alert.show
    true
  end
end
