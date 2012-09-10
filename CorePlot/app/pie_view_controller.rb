# From http://www.e-string.com/content/simple-graph-using-core-plot
class PieViewController < UIViewController
  
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    navigationItem.title = 'Pie Chart'

    @data = PieDataSamples.new
    
    hosting_view =  CPTGraphHostingView.alloc.initWithFrame([[0,0], [view.bounds.size.width,view.bounds.size.height-80]])
    self.view.addSubview(hosting_view)

    graph =  CPTXYGraph.alloc.initWithFrame(self.view.bounds)  # was CPXYGraph
    graph.title = "Pie Chart"
    graph.applyTheme(CPTTheme.themeNamed(KCPTDarkGradientTheme))
    

    # graph.applyTheme(CPTTheme.themeNamed(KCPTDarkGradientTheme))
    pieChart = CPTPieChart.alloc.initWithFrame(self.view.bounds)
    pieChart.dataSource = @data;
    # pieChart.delegate = self;
    pieChart.pieRadius = (hosting_view.bounds.size.height * 0.7) / 2;
    # pieChart.identifier = graph.title;
    # pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionClockwise;    

    # // 3 - Create gradient
    # CPTGradient *overlayGradient = [[CPTGradient alloc] init];
    # overlayGradient.gradientType = CPTGradientTypeRadial;
    # overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
    # overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.4] atPosition:1.0];
    # pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];

    graph.addPlot(pieChart)
    hosting_view.hostedGraph = graph

  end
  
  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
  
end