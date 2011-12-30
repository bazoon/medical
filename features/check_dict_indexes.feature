Feature: Manage dict index paths
    In order to manage clients
    As an user
    I want to create and manage clients information

    Scenario Outline: visit dicts index paths
        When i go to <path>
        Given i click add_new_link
        When i enter 
            | value    | field_name   |
            | <value>  | <field_name> |
        When i click "Сохранить" button
        Then I should see <value>

        Examples:
            | model                | atrib | value         | path                         | field_name                          |
            | ins_company          | name  | "Ugoria"      | "/ref/ins_companies"         | ref_ins_company_name                |
            | lab_test_type        | name  | "labs"        | "/ref/lab_test_types"        | ref_lab_test_type_name              |
            | diagnostic_test_type | name  | "diags"       | "/ref/diagnostic_test_types" | ref_diagnostic_test_type_name       |
            | hospitalization_type | name  | "diags"       | "/ref/hospitalization_types" | ref_hospitalization_type_name       |
            | htm_help_type        | name  | "diags"       | "/ref/htm_help_types"        | ref_htm_help_type_name              |
            | doctor_type          | name  | "diags"       | "/ref/doctor_types"          | ref_doctor_type_name                |
            | benefit_category     | name  | "diags"       | "/ref/benefit_categories"    | ref_benefit_category_short_name     |
            | mkb_type             | name  | "diags,A10"   | "/ref/mkb_types"             | ref_mkb_type_name,ref_mkb_type_code |
            | sanatorium           | name  | "diags"       | "/ref/sanatoria"             | ref_sanatorium_name                 |

