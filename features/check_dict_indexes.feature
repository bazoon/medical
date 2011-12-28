Feature: Manage dict index paths
    In order to manage clients
    As an user
    I want to create and manage clients information

    Scenario Outline: visit dicts index paths
        Given a <model> exists with <atrib>: <value>
        When i go to <path>
        Then I should see <value>

        Examples:
            | model                | atrib | value    | path                         |
            | ins_company          | name  | "Ugoria" | "/ref/ins_companies"         |
            | lab_test_type        | name  | "labs"   | "/ref/lab_test_types"        |
            | diagnostic_test_type | name  | "diags"  | "/ref/diagnostic_test_types" |

