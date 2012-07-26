class HelloController < UIViewController
  extend IB

  attr_accessor :data_source, :label, :btn_hello


  ## ib outlets
  ib_outlet :label  
  ib_outlet :btn_hello

  def viewWillAppear animated
    @counter = 0
    label.text = "Click the button"
  end

  def say_hello(sender)
    @counter += 1
    label.text = "Touched #{@counter} times"
  end

  ## ib actions
  ib_action :say_hello

end