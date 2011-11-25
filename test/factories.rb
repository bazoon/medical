
Factory.define(:benefit_category,:class => Ref::BenefitCategory) do |bc|
  bc.code  10
end


Factory.define(:benefit,:class => Benefit) do |benefit|
  benefit.association :benefit_category,:factory => :benefit_category
  benefit.doc_name "docs"
end





Factory.define(:client,:class => Client) do |client|
  client.name "Ivan"
  client.surname "Petrov"
  client.ins_company_id 1
  client.birth_date '01.01.2004'
  client.client_sex_id  1
end  








