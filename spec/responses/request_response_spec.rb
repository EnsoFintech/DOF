RSpec.describe DOF::Responses::RequestResponse do
  it "Builds the object" do
    # Given
    raw_response = {
      "messageCode" =>200,
      "response" =>"OK",
      "ListaIndicadores" =>[{
        "codIndicador" =>30442,
        "codTipoIndicador" =>158,
        "fecha" =>"05-10-2020",
        "valor" =>"21.7025"
      },
      {
        "codIndicador" =>30446,
        "codTipoIndicador" =>158,
        "fecha" =>"06-10-2020",
        "valor" =>"21.3960"
      },
      {
        "codIndicador" =>30450,
        "codTipoIndicador" =>158,
        "fecha" =>"07-10-2020",
        "valor" =>"21.4507"
      },
      {
        "codIndicador" =>30454,
        "codTipoIndicador" =>158,
        "fecha" =>"08-10-2020",
        "valor" =>"21.4930"
      }],
      "TotalIndicadores" =>4
    }

    # When
    response = DOF::Responses::RequestResponse.new(raw_response)

    # Then 
    expect(response.response_code).to eq(200)
    expect(response.response_status).to eq(raw_response["response"])
    expect(response.successful?).to be_truthy
    expect(response.total_indicators).to eq(raw_response["TotalIndicadores"])
    response.indicators.each_with_index  do |indicator, i|
      expect(indicator.indicador_code).to eq(raw_response["ListaIndicadores"][i]["codIndicador"])
      expect(indicator.indicador_type_code).to eq(raw_response["ListaIndicadores"][i]["codTipoIndicador"])
      expect(indicator.date).to eq(raw_response["ListaIndicadores"][i]["fecha"])
      expect(indicator.value).to eq(BigDecimal(raw_response["ListaIndicadores"][i]["valor"]))
    end
  end
end
