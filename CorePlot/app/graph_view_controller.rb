# From http://www.e-string.com/content/simple-graph-using-core-plot
class GraphViewController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    navigationItem.title = 'Data Graph'

    @data = DataSamples.new
    
    # bound = CGMakePoint(self.view.bounds.size.width, self.view.bounds.size.height)

    hosting_view =  CPTGraphHostingView.alloc.initWithFrame([[0,0], [view.bounds.size.width,view.bounds.size.height-80]])
    self.view.addSubview(hosting_view)

    graph =  CPTXYGraph.alloc.initWithFrame(self.view.bounds)  # was CPXYGraph
    graph.paddingLeft = 20.0
    graph.paddingTop = 20.0
    graph.paddingRight = 20.0
    graph.paddingBottom = 20.0

    graph.applyTheme(CPTTheme.themeNamed(KCPTDarkGradientTheme))

    hosting_view.hostedGraph = graph
    hosting_view.allowPinchScaling = true;

    axisSet = graph.axisSet
    lineStyle = CPTLineStyle.lineStyle
    lineStyle.lineColor = CPTColor.blackColor
    lineStyle.lineWidth = 2.0

    axisSet.xAxis.majorIntervalLength = CPTDecimalFromInt(5) #NSDecimalNumber.decimalNumberWithString("5")
    axisSet.xAxis.minorTicksPerInterval = 4
    axisSet.xAxis.majorTickLineStyle = lineStyle
    axisSet.xAxis.minorTickLineStyle = lineStyle
    axisSet.xAxis.axisLineStyle = lineStyle
    axisSet.xAxis.minorTickLength = 5.0
    axisSet.xAxis.majorTickLength = 7.0
    # axisSet.xAxis.axisLabelOffset = 3.0

    axisSet.yAxis.majorIntervalLength = CPTDecimalFromInt(5) 
    axisSet.yAxis.minorTicksPerInterval = 4
    axisSet.yAxis.majorTickLineStyle = lineStyle
    axisSet.yAxis.minorTickLineStyle = lineStyle
    axisSet.yAxis.axisLineStyle = lineStyle
    axisSet.yAxis.minorTickLength = 5.0
    axisSet.yAxis.majorTickLength = 7.0
    # axisSet.yAxis.axisLabelOffset = 3.0

    data_source_line_plot =  CPTScatterPlot.alloc.init  # was CPScatterPlot
    data_source_line_plot.dataSource = @data

    data_source_line_plot.dataLineStyle.lineWidth = 2.0
    data_source_line_plot.dataLineStyle.lineColor = CPTColor.redColor

    graph.addPlot(data_source_line_plot)

  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end