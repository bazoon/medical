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

Factory.define(:hospitalization) do |hosp|
 hosp.hospitalization_type_id  1
end  


Factory.define(:client_sex) do |cx|
end  


Factory.define(:diagnostic_test) do |obj|
 obj.diagnostic_test_type_id 1
 obj.test_date '01.01.2011'
 obj.result "ok"
end  


Factory.define(:disp) do |obj|
 obj.actual_date '01.01.2011'
end  

Factory.define(:htm_help_note) do |obj|
 obj.actual_date '01.01.2011'
 obj.association :htm_help_type,:factory => :htm_help_type
end  


Factory.define(:lab_test) do |obj|
 obj.lab_test_type_id 1
 obj.test_date '01.01.2011'
 obj.result "ok"
 obj.client_id 1
end  

Factory.define(:med_diagnostic_test) do |obj|
 obj.hospitalization_type_id 1
 obj.test_date '01.01.2011'
 obj.result "ok"
 obj.client_id 1
end  

Factory.define(:doctor_type, :class => "Ref::DoctorType") do |obj|
 obj.name "doctor"

end  

Factory.define(:user) do |obj|
 obj.association :doctor_type, :factory => :doctor_type
 obj.name "doctor"
 obj.surname "ivanov"
end  



Factory.define(:mkb_type, :class => "Ref::MkbType") do |obj|
 obj.sequence(:code) {|n| "A#{n+1}"} 
 obj.name "mkbtype"
 obj.association :doctor_type,:factory => :doctor_type
 #obj.code_i 0
end  

Factory.define(:mkb) do |obj|
 obj.association :mkb_type, :factory => :mkb_type
 obj.actual_date '01.01.2011'
 obj.association :client, :factory => :client
 obj.association :user,:factory => :user
end  

Factory.define(:mse) do |obj|
 obj.association :mkb_type, :factory => :mkb_type
 obj.conclusion_date '01.01.2011'
 obj.send_date '01.01.2011'
 obj.association :client, :factory => :client
 obj.association :user,:factory => :user
end  

Factory.define(:prof_inspection) do |obj|
 obj.actual_date "01.01.2011"
 obj.inspection_type 1  

 obj.association :client, :factory => :client
 obj.association :user,:factory => :user
end  

Factory.define(:sanatorium_note) do |obj|
 obj.neediness_ref_date '01.01.2011'
 obj.sanatorium_card_fill_date '01.01.2011'
 obj.period_start '01.01.2011'
 obj.period_end '01.01.2011'
 obj.association :client, :factory => :client
end  

Factory.define(:diagnosis) do |obj|
 obj.association :mkb_type, :factory => :mkb_type
 obj.association :prof_inspection, :factory => :prof_inspection
end  


#Ref Factories

Factory.define(:death_reason,:class => Ref::DeathReason) do |obj|
  obj.name "d"
end

Factory.define(:desease_type,:class => Ref::DeseaseType) do |obj|
  obj.name "d"
end  

Factory.define(:diagnostic_test_type,:class => Ref::DiagnosticTestType) do |obj|
  obj.name "d"
end  

Factory.define(:hospitalization_type,:class => Ref::HospitalizationType) do |obj|
  obj.name "d"
end  

Factory.define(:htm_help_type,:class => Ref::HtmHelpType) do |obj|
  obj.name "d"
end  

Factory.define(:ins_company,:class => Ref::InsCompany) do |obj|
  obj.name "d"
end  

Factory.define(:lab_test_type,:class => Ref::LabTestType) do |obj|
  obj.name "d"
end  

Factory.define(:med_diagnostic_test_type,:class => Ref::MedDiagnosticTestType) do |obj|
  obj.name "d"
end  

Factory.define(:sanatorium,:class => Ref::Sanatorium) do |obj|
  obj.name "d"
end  
