Feature: Manage clients
    In order to manage clients
    As an user
    I want to create and manage clients information


    Scenario: Client list
        Given I have clients Petrov Ivan Petrovich,Sidorov Andrey Egorovich
        When i go to "clients" index page
        Then I should see "Petrov I. P."
        Then I should see "Sidorov A. E."


    Scenario: Add new client
        Given no clients
        Given 1 ins_company in db named "Ugoria"
        When i go to clients add form
        When i enter name "Ivan"
        When i enter surname "Petrov"
        When i enter father_name "Petrovich"
        When i enter birth_date "01.01.1980"
        When i select ins_company "Ugoria"
        When i select sex "Ж"
        When i click "Сохранить" button
        Then I should see fio "Petrov Ivan Petrovich"
        Then I should see birthdate "01.01.1980""
        Then I should see company name "Ugoria"
        Then I should see sex "Ж"

    Scenario: Edit client
        Given the following clients exists
              | name   | surname | father_name |
              | Ivan   | Petrov  | Petrovich   |
              | Andrey | Sidorov | Egorovich   |
  
        Given a ins_company exists with name: "Ugoria"
          
        When i go to "clients" index page
        When i go to "Petrov" edit form
        When i enter name "Ivan"
        When i enter surname "Petrov"
        When i enter father_name "Petrovich"
        When i enter birth_date "01.01.1980"
        When i select ins_company "Ugoria"
        When i select sex "Ж"
        When i click "Сохранить" button
        Then I should see fio "Petrov Ivan Petrovich"
        Then I should see birthdate "01.01.1980""
        Then I should see company name "Ugoria"
        Then I should see sex "Ж"

    Scenario: Should not save client without required fields
        Given no clients
        Given a ins_company exists with name: "Ugoria"
        When i go to clients add form
        When i click "Сохранить" button
        Then I Should see add form "Новый пациент"
   
    @javascript
    Scenario: Should delete client if yes pressed
        Given no clients
        Given the following clients exists
            | name   | surname | father_name |
            | Ivan   | Petrov  | Petrovich   |
            | Andrey | Sidorov | Egorovich   |
            | Victor | Didorov | Egorovich   |
        #Тест не выполнится если после удаления пациент будет только 1 произойдет редирект на страницу операций
        When i go to "clients" index page
        When i click link del with client surname "Petrov"
        When i press ok button
        Then I should not see surname "Petrov"
        Then I should see "Sidorov A. E."


    Scenario: Should find client with full fio
        Given no "clients"
        Given the following clients exists
            | name   | surname | father_name |
            | Ivan   | Petrov  | Petrovich   |
            | Andrey | Sidorov | Egorovich   |
            | Victor | Didorov | Egorovich   |
        When i go to root
        When i enter "Sidorov Andrey Egorovich" in "client_search"
        When i click "Искать" button
        Then I should see "Sidorov Andrey Egorovich"

    @focus @javascript
    Scenario:
        Given a lab_test_type exists with name: "MNO" 
        Given the following clients exists
            | name   | surname | father_name |
            | Andrey | Sidorov | Egorovich   |
        And a lab_test exists with client: the client, lab_test_type: the lab_test_type
        When i go to root
        When i enter "Sidorov Andrey Egorovich" in "client_search"
        When i click "Искать" button
        When i click "Лаб. анализы" link
        Then I should see "Лабораторные анализы"
        Then I should see "MNO"

