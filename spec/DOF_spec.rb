RSpec.describe DOF do
  it "has a version number" do
    expect(DOF::VERSION).not_to be nil
  end

  it 'configures gem' do
    # Given
    base_uri = 'http://google.com'

    # When
    DOF.config do |c|
      c.base_uri = base_uri
    end

    # Then
    expect(DOF.base_uri).to eq base_uri
  end
end
