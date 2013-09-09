class LayoutController < UIViewController

  def viewDidLoad
    super
    view.fromLayout(NameEditorLayout, self)
  end

  def cancel
    alert = UIAlertView.new
    alert.message = "Cancelled"
    alert.show
  end

  def done
    alert = UIAlertView.alloc.initWithTitle:"Message",
                message: "Done",
                delegate: nil,
                cancelButtonTitle: "OK",
                otherButtonTitles: nil
    alert.show
  end

  def shouldAutorotateToInterfaceOrientation(o)
    true
  end

end