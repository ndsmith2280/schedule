Feature: administrator can create new user accounts
  
Scenario: create a new user account
  Given the following users have been added to Schedule
  | user_id | user_first_name | user_last_name  | user_administrator  | user_priority | user_phone_number | email       | password_digest |
  | 1       | SELT            | Unchained       | true                | 5             | (123) 456-7890    | 123@abc.com | 12345678        |
  | 2       | Bill            | Nye             | false               | 1             | (098) 765-4321    | abc@123.com | 12345678        |
  Given I am signed in as an administrator
  When I click the link "Manage Accounts"
  Then I should be on the "manage accounts" page
  When I click the link "Create New Account"
  Then I should be on the "new account" page
  When I have added a new user with the first name "SELT", last name "unchained", email "abc@123.com", phone number "(123) 456-7890", user id "12345678", administrative status "true", user priority "1", password "12345678", password confirmation "12345678"
  Then I should see a new user with the first name "SELT", last name "unchained", email "abc@123.com", phone number "(123) 456-7890", user id "12345678", administrative status "true", user priority "1", password "12345678", password confirmation "12345678"
  