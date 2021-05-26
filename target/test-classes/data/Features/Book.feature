Feature: Task 1.2

  @POST
  Scenario Outline: Testing a POST endpoint with request body

    Given url searchUrl
    Given path 'hotels/book/v1/JAQ/reservations'

#    Given url 'http://172.16.3.39:9090/hotels/book/v1/JAQ/reservations'
    * def postRequest = read('classpath:data/json/BookRQ.json')

    * set postRequest.phone_no = phone_no
    * set postRequest.card_security_code = card_security_code
    * set postRequest.card_expiry_date = card_expiry_date
    * set postRequest.card_number = card_number
    * set postRequest.card_holder_name = card_holder_name
    * set postRequest.last_name = last_name
    * set postRequest.card_type = card_type
    * set postRequest.first_name = first_name
    * set postRequest.email = email
    * set postRequest.date_check_in = date_check_in
    * set postRequest.date_check_out = date_check_out


    * set postRequest.req_rooms[0].room_type_code = roomTypeCode
    * set postRequest.req_rooms[0].rate_plan_code = ratePlanCode
    * set postRequest.req_rooms[0].adults_count = adults_count
    * set postRequest.req_rooms[0].children_count = children_count
    * set postRequest.req_rooms[0].infants_count = infants_count


    When request postRequest
    When method POST
    Then status 200
    And print 'Response is: ', response

  Examples:
  | read('classpath:data/csv/data.csv')|