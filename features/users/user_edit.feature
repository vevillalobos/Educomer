Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

  	Scenario: I sign in and edit my account
      Given I am logged in
      And I am on the home page
      When I edit my account details
      Then I should see an account edited message
