class DataViewController < UIViewController
  attr_accessor :data_object
  attr_accessor :data_label

  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    index = data_object ? data_object[:index] : 0;
    targetWhite = 0.9 - index/10.0

    appRect = UIScreen.mainScreen.applicationFrame
    
    UIGraphicsBeginImageContext(appRect.size);
    UIColor.colorWithWhite(targetWhite, alpha:1.0).set();
    UIBezierPath.bezierPathWithRoundedRect(CGRectInset(appRect, 120.0, 120.0), cornerRadius:32.0).fill();
    
    thinRect = [[appRect.size.width - 10.0, 0.0], [10.0, appRect.size.height]]
    UIColor.blackColor.set
    CGContextFillRect(UIGraphicsGetCurrentContext(), thinRect)
    
    image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    # Add it as an image
    imageView = UIImageView.alloc.initWithImage(image)
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    view.addSubview(imageView)
    
    # Add a label
    @textLabel = UILabel.alloc.initWithFrame([[0,0], [200, 41]])
    @textLabel.text = "#{(targetWhite*100).round}% White" #NSString.stringWithFormat("%0.0f%% White", 100 * targetWhite);
    @textLabel.font = UIFont.fontWithName("Futura", size:30.0);
    @textLabel.center = CGPoint.new(150, 40)
    view.addSubview(@textLabel);        
  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
    
end