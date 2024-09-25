#//Send request to /api/accounts/add-primary-account
  #status should be 201 and response contain email entity
  @Regression @NewAccount_1
  Feature: Create Account Feature
    Scenario: Create primary account
      Given url BASE_URL
      Given path "/api/accounts/add-primary-account"
      Given request
     """
     {
     "email": "myangle1111111@gmail.com",
     "firstName": "Mushtari",
     "lastName": "Said",
      "title": "Mrs.",
      "gender": "Female",
      "maritalStatus": "Married",
      "employmentStatus": "QA",
      "dateOfBirth": "1990-01-01"
      }
     """
      When method post
      Then print response
      Then status 400
      Then assert.response.email == "myangle1111111@gmail.com"

      * def createdAccountId = response.id
      * def tokenGenerationResult = callone read('GenerateSupervisorToken.feature')
      * def validToken = "Bearer " + tokenGenerationResult.response.token
      Given path "/api/accounts/delete-account"
      Given param primaryPersonId = createdAccountId
      Given header Authorization = validToken
      When method delete
      Then status 202

