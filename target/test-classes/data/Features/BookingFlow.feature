Feature:  Task 2

  @BASIC_FLOW
  Scenario Outline: Setup basic flow

    Given def getCall = call read('classpath:data/Features/Search.feature')

    * print response
    * def roomTypeCode = getCall.response.availablity_price[0].room_type_code
    * print 'RoomTypeCode code is', roomTypeCode
    * def ratePlanCode = getCall.response.availablity_price[0].available_plans[0].rate_plan_code
    * print 'RatePlanCode is', ratePlanCode


    Then match getCall.response.success == true
    And match getCall.response.availablity_price[0].room_type_code == "K1DAA"
    And match getCall.response.availablity_price[0].available_plans[0].rate_plan_code == "DAPR"
    Then assert getCall.response.availablity_price[0].available_plans[0].total_amount_before_tax<getCall.response.availablity_price[0].available_plans[0].total_amount_after_tax

    Given def postCall = call read('classpath:data/Features/Book.feature')

    * print response
    And match postCall.response.confirmation[0].confirmation_code != null
    And match postCall.response.confirmation[0].room_type_code == "K1DAA"
    And match postCall.response.confirmation[0].rate_plan_code == "LPSGO0"
    And match postCall.response.confirmation[0].adults_count == 2
    And match postCall.response.confirmation[0].children_count == 0
    And match postCall.response.confirmation[0].infants_count == 0

    Examples:
      | read('classpath:data/csv/data.csv')|