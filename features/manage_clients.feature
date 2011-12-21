Feature: Manage clients
    In order to manage clients
    As an user
    I want to create and manage clients information


    Scenario: Client list
        Given I have clients Petrov Ivan Petrovich,Sidorov Andrey Egorovich
        When i go to clients index page
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
        Given I have clients Petrov Ivan Petrovich,Sidorov Andrey Egorovich
        Given 1 ins_company in db named "Ugoria"
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
