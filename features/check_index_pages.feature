@current
Feature: Manage patient's index pages
    In order to
    As an user
    I want check if index pages open and records can be created
    
    @javascript
    Scenario Outline: Visit index page, add a record and check if it saved 
        Given a client exists with name: "Ivan", father_name: "Petrovich"
        Given doctor_type exists with name: "surgeon"
        Given a user exists with name: "Petr", father_name: "Ivanovich", surname: "Ivanov", doctor_type: the doctor_type

             When i go to <path>
               Given i click add_new_link
                   When i enter 
                       | value    | field_name   |
                       | <value>  | <field_name> |
                   When i select 
                       | value          | field_name    |
                       | <select_value> | <select_name> |
                   When i click "Сохранить" button
                   Then I should see <value>

             Examples:
                 | atrib | value        | path                           | field_name                  | select_name             | select_value   |
                 | name  | "01.01.2011" | "/clients/1/prof_inspections/" | prof_inspection_actual_date | prof_inspection_user_id | Ivanov P. I. & surgeon|
            
