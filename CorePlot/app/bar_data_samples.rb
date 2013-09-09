# From http://codejunkster.wordpress.com/2011/11/23/core-plot-2-bar-plot/
class BarDataSamples

  AXIS_START  = 0.0
  AXIS_END    = 50.0
  AXIS_LENGTH = (AXIS_END-AXIS_START)+5.0


  def initialize
    @data = [
            {color: UIColor.redColor,     height:20.0, category: "Plain Milk",      position: 1.0},
            {color: UIColor.blueColor,    height:30.0, category: "Milk+Chocolate",  position: 10.0},
            {color: UIColor.orangeColor,  height:10.0, category: "White",           position: 20.0},
            {color: UIColor.purpleColor,  height:40.0, category: "Dark",            position: 30.0}
            ]
  end


  def numberOfRecordsForPlot(plot)
    plot&&plot.identifier == "chocoplot" ? @data.length : 0
  end

  def numberForPlotOK(plot, field: fieldNum, recordIndex: index)
      bar = @data[index]
    if fieldNum == CPTBarPlotFieldBarLocation
      result =  NSNumber.numberWithFloat(bar[:position])
    elsif fieldNum == CPTBarPlotFieldBarTip      
      result = NSNumber.numberWithFloat(bar[:height])
    end
    puts "numberForPlot fieldNum:#{fieldNum}, index:#{index} -> #{result}"
    return result
  end

  def numberForPlot(plot, field: fieldNum, recordIndex: index)
    bar = @data[index]
    if fieldNum == CPTBarPlotFieldBarLocation
      return NSNumber.numberWithFloat(bar[:position])
    elsif fieldNum == CPTBarPlotFieldBarTip      
      return NSNumber.numberWithFloat(bar[:height])
    end
    puts "Unknown number"
    return 0.0 # NSNumber.numberWithFloat(result)
  end

  # def dataLabelForPlot(plot, recordIndex: index)
  #   # if plot.identifier == "chocoplot" 
  #   #   textStyle = CPTMutableTextStyle.textStyle
  #   #   textStyle.fontName = "Helvetica"
  #   #   textStyle.fontSize = 14
  #   #   textStyle.color = CPTColor.whiteColor
  #   #   label = CPTTextLayer.alloc.initWithText(@data[index][:category])
  #   #   label.textStyle = textStyle;
  #   #   return label;    
  #   # end
  #   defaultLabel =  CPTTextLayer.alloc.initWithText("Label") 
  #   return defaultLabel;
  # end

  # def barFillForBarPlot(plot, recordIndex: index)
  # end


end