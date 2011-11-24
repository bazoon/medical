FactoryGirl.define do



factory :client do
  name  "Ivan"
  surname "Petrov"
  ins_company_id 1
  client_sex_id 1
  benefits :benefit_category_id => 1,:doc_name => "docn"

end



end
