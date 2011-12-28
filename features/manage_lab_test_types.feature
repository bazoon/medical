Feature: Manage lab_test_types
    In order to manage lab_test_types
    As an user
    I want to create and manage lab_test_type information
 
    Scenario: View lab_test_type list
        Given the following ref_lab_test_types exists
            | name  | norm  | valid_period |
            | "MNI" | "1-2" | 30           |
            | "MNO" | "1-3" | 40           |
        When i go to "ref_lab_test_types" index page
        Then I should see
            | string |
            | "MNI"  |
            | "MNO"  |
            | "1-2"  |
            | "1-3"  |
            | 30     |
            | 40     |
    @focus
    Scenario: Add new lab_test_type
        Given the following ref_lab_test_types exists
            | name  | norm  | valid_period |
            |  MNI  |  1-2  | 30           |
            |  MNO  |  1-3  | 40           |
        When i go to "ref_lab_test_types" index page

        When i click add_new_link
        When i enter 
            | value | field_name                     |
            | MNU   | ref_lab_test_type_name         |
            | 1-5   | ref_lab_test_type_norm         |
            | 34    | ref_lab_test_type_valid_period |
        When i click "Сохранить" button


        Then I should see lab_test_type table
            | Тип | Норма | Период действия | Теги | 
            | MNI | 1-2   | 30              |      | 
            | MNO | 1-3   | 40              |      | 
            | MNU | 1-5   | 34              |      | 
        
    Scenario: Edit ins company
        Given no "Ref::InsCompany"
        Given the following ins_companies exists
            | name      |
            | "Ugoria"  |
            | "MDM"     |
            | "Roscomp" |

        When i go to "ref_ins_companies" index page
        When i hit ".edit_link" for "MDM"

        When i enter 
            | value         | field_name           |
            | "TestCompany" | ref_ins_company_name |
        When i click "Сохранить" button
        Then I should see
            | string        |
            | "TestCompany" |
            | "Ugoria"      |
            | Roscomp       |
        Then I should not see
            | string        |
            | "MDM" |

        Then I should see record updated message


    @javascript 
    Scenario: Should delete ins_company if yes pressed
        Given no "Ref::InsCompany"
        Given the following ins_companies exists
            | name      |
            | "Ugoria"  |
            | "MDM"     |
            | "Roscomp" |

        When i go to "ref_ins_companies" index page
        When i hit ".delete_link" for "MDM"
        When i press ok button
        Then I should not see "MDM"
        Then I should see "Ugoria"
        Then I should see "Roscomp"
