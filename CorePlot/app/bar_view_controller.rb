# From http://www.hameister.org/macfw_coreplotBalkendiagramm.html
class BarViewController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    navigationItem.title = 'Bar Chart'

    
    hosting_view =  CPTGraphHostingView.alloc.initWithFrame([[0,0], [view.bounds.size.width,view.bounds.size.height-80]])
    self.view.addSubview(hosting_view)

    graph =  CPTXYGraph.alloc.initWithFrame(hosting_view.bounds)  # was CPXYGraph
    graph.title = "Bar Chart"
    hosting_view.hostedGraph = graph

    graph.plotAreaFrame.paddingTop      = 20.0
    graph.plotAreaFrame.paddingRight    = 20.0
    graph.plotAreaFrame.paddingBottom   = 70.0
    graph.plotAreaFrame.paddingLeft     = 70.0


    @data = BarDataSamples.alloc.init    
    graph.applyTheme(CPTTheme.themeNamed(KCPTDarkGradientTheme))


    axisSet = graph.axisSet;
    # set axes' title, labels and their text styles
    textStyle = CPTMutableTextStyle.textStyle
    textStyle.fontName = "Helvetica"
    textStyle.fontSize = 14
    textStyle.color = CPTColor.whiteColor

    lineStyle = CPTMutableLineStyle.lineStyle
    lineStyle.lineColor = CPTColor.whiteColor
    lineStyle.lineWidth = 3.0

    axisSet.xAxis.title = "CHOCOLATE"
    axisSet.xAxis.titleTextStyle = textStyle
    axisSet.xAxis.titleOffset = 30.0 #CPTDecimalFromFloat(30.0)
    axisSet.xAxis.labelTextStyle = textStyle
    axisSet.xAxis.labelOffset = 3.0

    axisSet.xAxis.axisLineStyle = lineStyle
    axisSet.xAxis.majorTickLineStyle = lineStyle
    axisSet.xAxis.majorIntervalLength = CPTDecimalFromFloat(5.0)
    axisSet.xAxis.majorTickLength = 7.0
    axisSet.xAxis.minorTickLineStyle = lineStyle
    axisSet.xAxis.minorTicksPerInterval = 1
    axisSet.xAxis.minorTickLength = 5.0
    
    # axisSet.yAxis.title = "AWESOMENESS"
    # axisSet.yAxis.titleTextStyle = textStyle
    # axisSet.yAxis.titleOffset = 40.0 #CPTDecimalFromFloat(40.0)
    # axisSet.yAxis.labelTextStyle = textStyle
    # axisSet.yAxis.labelOffset = 3.0

    # axisSet.yAxis.axisLineStyle = lineStyle
    # axisSet.yAxis.majorTickLineStyle = lineStyle
    # axisSet.yAxis.majorIntervalLength = CPTDecimalFromFloat(5.0)
    # axisSet.yAxis.majorTickLength = 7.0
    # axisSet.yAxis.minorTickLineStyle = lineStyle
    # axisSet.yAxis.minorTicksPerInterval = 1
    # axisSet.yAxis.minorTickLength = 5.0

    # Create bar plot and add it to the graph
    plot = CPTBarPlot.alloc.init
    plot.dataSource = @data
    # plot.delegate = self # @data
    plot.plotRange = CPTPlotRange.plotRangeWithLocation(CPTDecimalFromFloat(0.0), length:CPTDecimalFromFloat( 60.0 ))

    plot.setBarsAreHorizontal(true)

    # plot.barOffset = 0.5   
    plot.barWidth = CPTDecimalFromInt(5) #NSDecimalNumber.decimalNumberWithString:"5.0".decimalValue
    plot.barOffset = CPTDecimalFromInt(10) #NSDecimalNumber.decimalNumberWithString:"10.0".decimalValue
    plot.barCornerRadius = 5.0
    #Remove bar outlines
    borderLineStyle = CPTMutableLineStyle.lineStyle
    borderLineStyle.lineColor = CPTColor.clearColor
    plot.lineStyle = borderLineStyle

    #Identifiers are handy if you want multiple plots in one graph
    plot.identifier = "chocoplot"

    # Define the space for the bars. (12 Bars with a max height of 150)
    plotSpace = graph.defaultPlotSpace;
    plotSpace.xRange = CPTPlotRange.plotRangeWithLocation(CPTDecimalFromFloat(0.0), length:CPTDecimalFromFloat( 55.0 ))
    plotSpace.yRange = CPTPlotRange.plotRangeWithLocation(CPTDecimalFromFloat(0.0), length:CPTDecimalFromFloat( 60.0 ))

    
    graph.addPlot(plot)

  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end


  def numberOfRecordsForPlot(plot)
    @data.numberOfRecordsForPlot(plot) 
  end

  def numberForPlot(plot, field: fieldNum, recordIndex: index)
    @data.numberForPlot(plot, field: fieldNum, recordIndex: index) 
  end  
  
end