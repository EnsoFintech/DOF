RSpec.describe DOF::Indicator do
  it "returns USD rates without params" do
    # Given
    raw_response = {
      "messageCode" =>200,
      "response" =>"OK",
      "ListaIndicadores" =>[{
        "codIndicador" =>30454,
        "codTipoIndicador" =>158,
        "fecha" =>"08-10-2020",
        "valor" =>"21.4930"
      }],
      "TotalIndicadores" =>1
    }

    # When
    stub_request(:get, "#{DOF.base_uri}#{DOF::Endpoints::INDICATORS}/#{DOF::Indicator_Codes::USD}/08-10-2020/08-10-2020").to_return(
      status: 200,
      body: raw_response.to_json
    )
    response = DOF::Indicator.USD_rate

    # Then 
    expect(response).to be_instance_of DOF::Responses::RequestResponse
  end

  it "returns USD rates with date params" do
    # Given
    initial_date = Date.today
    end_date = Date.today
    raw_response = {
      "messageCode" =>200,
      "response" =>"OK",
      "ListaIndicadores" =>[{
        "codIndicador" =>30454,
        "codTipoIndicador" =>158,
        "fecha" =>"08-10-2020",
        "valor" =>"21.4930"
      }],
      "TotalIndicadores" =>1
    }

    # When
    stub_request(:get, "#{DOF.base_uri}#{DOF::Endpoints::INDICATORS}/#{DOF::Indicator_Codes::USD}/08-10-2020/08-10-2020").to_return(
      status: 200,
      body: raw_response.to_json
    )
    response = DOF::Indicator.USD_rate(date: initial_date, end_date: end_date)

    # Then 
    expect(response).to be_instance_of DOF::Responses::RequestResponse
  end

  it "returns USD rates with date params as strings" do
    # Given
    initial_date = "05/10/2020"
    end_date = "08/10/2020"
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
    stub_request(:get, "#{DOF.base_uri}#{DOF::Endpoints::INDICATORS}/#{DOF::Indicator_Codes::USD}/05-10-2020/08-10-2020").to_return(
      status: 200,
      body: raw_response.to_json
    )
    response = DOF::Indicator.USD_rate(date: initial_date, end_date: end_date)

    # Then 
    expect(response).to be_instance_of DOF::Responses::RequestResponse
  end

  it "returns UDIS rates without params" do
    # Given
    raw_response = {
      "messageCode" =>200,
      "response" =>"OK",
      "ListaIndicadores" =>[{
        "codIndicador" =>30418,
        "codTipoIndicador" =>159,
        "fecha" =>"08-10-2020",
        "valor" =>"6.555272"
      }],
      "TotalIndicadores" =>1
    }

    # When
    stub_request(:get, "#{DOF.base_uri}#{DOF::Endpoints::INDICATORS}/#{DOF::Indicator_Codes::UDIS}/08-10-2020/08-10-2020").to_return(
      status: 200,
      body: raw_response.to_json
    )
    response = DOF::Indicator.UDIS_rate

    # Then 
    expect(response).to be_instance_of DOF::Responses::RequestResponse
  end

  it "returns UDIS rates value with date params" do
    # Given
    initial_date = Date.today
    end_date = Date.today
    raw_response = {
      "messageCode" =>200,
      "response" =>"OK",
      "ListaIndicadores" =>[{
        "codIndicador" =>30418,
        "codTipoIndicador" =>159,
        "fecha" =>"08-10-2020",
        "valor" =>"6.555272"
      }],
      "TotalIndicadores" =>1
    }

    # When
    stub_request(:get, "#{DOF.base_uri}#{DOF::Endpoints::INDICATORS}/#{DOF::Indicator_Codes::UDIS}/08-10-2020/08-10-2020").to_return(
      status: 200,
      body: raw_response.to_json
    )
    response = DOF::Indicator.UDIS_rate(date: initial_date, end_date: end_date)

    # Then 
    expect(response).to be_instance_of DOF::Responses::RequestResponse
  end

end
