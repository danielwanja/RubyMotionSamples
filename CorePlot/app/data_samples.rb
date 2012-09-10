class DataSamples
  START_POINT = -2.0
  END_POINT = 2.0
  NUM_SAMPLES = 30


  def initialize
    @data = DataSamples.data_samples
  end

  def self.data_samples
    length = END_POINT - START_POINT
    delta  = (length / ( NUM_SAMPLES - 1 )).to_f
    samples = []
    NUM_SAMPLES.times do |i|
       x = START_POINT + ( delta * i.to_f )
       y = x * x

       data_point = { CPTScatterPlotFieldX => x, CPTScatterPlotFieldY => y }
       samples << data_point
    end
    samples
  end


  def numberOfRecordsForPlot(plot)
    @data.length
  end

  def numberForPlot(plot, field: fieldNum, recordIndex: index)
    sample = @data[index]
    result = sample[fieldNum == CPTScatterPlotFieldX ? CPTScatterPlotFieldX : CPTScatterPlotFieldY]
    result
  end 

end