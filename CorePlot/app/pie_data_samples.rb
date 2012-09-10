class PieDataSamples
  START_POINT = -2.0
  END_POINT = 2.0
  NUM_SAMPLES = 30


  def initialize
    @data = [90.0, 20.0, 30.0, 40.0, 50.0, 60.0]
  end


  def numberOfRecordsForPlot(plot)
    @data.length
  end

  def numberForPlot(plot, field: fieldNum, recordIndex: index)
    fieldNum == CPTPieChartFieldSliceWidth ? @data[index] : 0
  end 

end