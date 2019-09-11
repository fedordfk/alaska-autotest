Feature: Bears CRUD

  Background:
    * url 'http://127.0.0.1'

  Scenario: clean data before start of the tests and then check there is no data
    Given path 'bear'
    When method delete
    #todo change the status to 202 Accepted or 204 No Content
    Then status 200

    Given path 'bear'
    When method get
    Then status 200
    And match response == []


  Scenario: create a black bear and then get the bear by id and compare the initial and the stored bears
    * def black_bear = {'bear_type':'BLACK','bear_name':'Mikhail','bear_age':35.0}

    Given url 'http://127.0.0.1/bear'
    And request black_bear
    When method post
    #todo change the status to 201 Created
    Then status 200

    * def id = response
    * print 'Created ID of the black bear is:', id

    Given path id
    When method get
    Then status 200
    And match response == { bear_id: '#notnull', bear_type:'BLACK', bear_name:'Mikhail','bear_age':35.0}


  Scenario: update the bear and check is the bear updated correctly
    * def updated_bear = {'bear_type':'BLACK','bear_name':'MikhailPotapych','bear_age':37.0}

    Given path 'bear/1'
    And request updated_bear
    When method put
    #todo change the status to 202 Accepted or 204 No Content
    Then status 200

    Given path 'bear/1'
    When method get
    Then status 200
    And match response == { bear_id: '#notnull', bear_type:'BLACK', bear_name:'MikhailPotapych','bear_age':37.0}

  Scenario: get all bears and then get the first bear by id
    Given path 'bear'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'bear', first.id
    When method get
    Then status 200
