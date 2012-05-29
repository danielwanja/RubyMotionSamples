class ModelController # <UIPageViewControllerDataSource>
  attr_reader :page_data
  
  def initialize
    @page_data = 10.times.to_a # 10 pages
  end
  
  def viewControllerAtIndex(index, storyboard:storyboard)  # FIXME: why is storyboard needed?
    return nil if page_data.length==0 || index >= page_data.length
    dataViewController = DataViewController.alloc.init
    dataViewController.data_object = {text:page_data[index], index:index}  # Structure is not really used, but could carry page data.
    dataViewController
  end
  
  def indexOfViewController(viewController)
    viewController.data_object[:index]
  end
  
  def pageViewController(pvc, viewControllerBeforeViewController: vc)
    index = indexOfViewController(vc)
    return nil if (index==0 || index==-1)
    index -= 1
    viewControllerAtIndex(index, storyboard:vc.storyboard)
  end
  
  
  def pageViewController(pvc, viewControllerAfterViewController:vc)
    index = indexOfViewController(vc)
    return nil if index==-1
    index += 1
    return nil if index==page_data.length
    viewControllerAtIndex(index, storyboard:vc.storyboard)
  end
  
end
