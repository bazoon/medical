Feature: Manage ins_companys
    In order to manage ins_companys
    As an user
    I want to create and manage ins_company information
 
    Scenario Outline: View companies list
        Given a ref_ins_company exists with name: <name>
        When i go to "ref_ins_companies" index page
        Then I should see <name>
        Examples:
                | name      |
                | "Ugoria"  |
                | "MDM"     |
                | "Roscomp" |

    Scenario Outline: Add new ins_company
        Given no "Ref::InsCompany"
        When i go to "ref_ins_companies" index page
        When i click add_new_link
        When i enter 
            | value  | field_name           |
            | <name> | ref_ins_company_name |
       
        When i click "Сохранить" button
        Then I should see
            | string |
            | <name> |
            
        Examples:
                | name      |
                | "Ugoria"  |
                | "MDM"     |
                | "Roscomp" |
        
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
