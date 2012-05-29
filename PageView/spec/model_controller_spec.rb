describe "ModelController" do
  before do
    @model_controller = ModelController.new
  end

  it "haspage" do
    @model_controller.page_data.length.should == 12
  end
end
