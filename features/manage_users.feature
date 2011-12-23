Feature: Manage users
    In order to manage users
    As an user
    I want to create and manage user information

    Scenario: User list
      Given the following users exists
          | name   | surname | father_name |
          | Ivan   | Petrov  | Petrovich   |
          | Andrey | Sidorov | Egorovich   |
    When i go to "users" index page
    Then I should see "Врачи"
    Then I should see "Petrov"
    Then I should see "Sidorov"

    Scenario: Add new user
        Given no "users"
        Given a doctor_type exists with name: "surgeon"
        When i go to "users" index page
        When i click add_new_link
        When i enter 
            | value     | field_name       |
            | Ivan      | user_name        |
            | Petrov    | user_surname     |
            | Petrovich | user_father_name |

        When i select "surgeon" in "user_doctor_type_id"
        When i click "Сохранить" button
        Then I should see
            | string    |
            | Врачи     |
            | Petrov    |
            | Ivan      |
            | Petrovich |

    Scenario: Edit client
        Given the following users exists
              | name   | surname | father_name |
              | Ivan   | Petrov  | Petrovich   |
              | Andrey | Sidorov | Egorovich   |
  
        Given a doctor_type exists with name: "surgeon"
        When i go to "users" index page
       
    #    When i go to "user" with "surname" "Petrov"
 #       When i hit "users/id/edit" for "user" with "surname" "Petrov"
        When i hit ".edit_link" for "Petrov"

        When i enter 
            | value     | field_name       |
            | Andrey    | user_name        |
            | Smirnoff  | user_surname     |
            | Semen     | user_father_name |

        When i select "surgeon" in "user_doctor_type_id"
        When i click "Сохранить" button
        Then I should see
            | string    |
            | Врачи     |
            | Andrey    |
            | Smirnoff  |
            | Semen     |


    @javascript 
    Scenario: Should delete user if yes pressed
        Given no "users"
        Given the following users exists
            | name   | surname | father_name |
            | Ivan   | Petrov  | Petrovich   |
            | Andrey | Sidorov | Egorovich   |
            | Victor | Didorov | Egorovich   |
        #Тест не выполнится если после удаления пациент будет только 1 произойдет редирект на страницу операций
        When i go to "users" index page
        When i hit ".delete_link" for "Didorov"
        When i press ok button
        Then I should not see "Didorov"
        Then I should see "Sidorov"

