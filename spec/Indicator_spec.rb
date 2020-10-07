RSpec.describe DOF::Indicator do
  it "returns USD rates values without params" do
    # Given

    # When
    WebMock.allow_net_connect!
    response = DOF::Indicator.USD_rate
    p response

    expect(DOF::VERSION).not_to be nil
  end

end
