RSpec.describe DOF::DateFormatter do
  it "returns a valid date with Date type param" do
    # Given
    date = Date.new(2020,10,3)
    expected_format = "03-10-2020"

    # when
    formatted_date = DOF::DateFormatter.format(date)

    # Then 
    expect(formatted_date).to eq(expected_format)
    expect{DOF::DateFormatter.format(date)}.not_to raise_error
  end

  it "returns a valid date with String type param and d-m-Y format" do
    # Given
    date = "03-10-2020"
    expected_format = "03-10-2020"

    # when
    formatted_date = DOF::DateFormatter.format(date)

    # Then 
    expect(formatted_date).to eq(expected_format)
    expect{DOF::DateFormatter.format(date)}.not_to raise_error
  end

  it "returns a valid date with String type param and d/m/Y format" do
    # Given
    date = "03/10/2020"
    expected_format = "03-10-2020"

    # when
    formatted_date = DOF::DateFormatter.format(date)

    # Then 
    expect(formatted_date).to eq(expected_format)
    expect{DOF::DateFormatter.format(date)}.not_to raise_error
  end

  it "returns a valid date with String type param and d.m.Y format" do
    # Given
    date = "03.10.2020"
    expected_format = "03-10-2020"

    # when
    formatted_date = DOF::DateFormatter.format(date)

    # Then 
    expect(formatted_date).to eq(expected_format)
    expect{DOF::DateFormatter.format(date)}.not_to raise_error
  end

  it "raises error when invalid string" do
    # Given
    date = "03102020"

    # When / Then
    expect{DOF::DateFormatter.format(date)}.to raise_error(DOF::Errors::PreconditionFailed)
  end

  it "raises error when invalid params" do
    # Given
    date = 03102020
    expected_format = "03-10-2020"

    # When / Then
    expect{DOF::DateFormatter.format(date)}.to raise_error(DOF::Errors::PreconditionFailed)
  end
end
