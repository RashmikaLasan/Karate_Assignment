Feature: Task 1.1

  @GET
  Scenario: GET scenario

#  Given url 'http://172.16.3.39:9090/hotels/book/v1/JAQ/availability'
    Given url searchUrl
    Given path 'hotels/book/v1/JAQ/availability'

    * param date_check_in = '2021-12-23'
    * param date_check_out = '2021-12-25'
    * param adults_count = '2'
    * param children_count = '0'
    * param infants_count = '0'

  When method get
  Then status 200
  And print response
