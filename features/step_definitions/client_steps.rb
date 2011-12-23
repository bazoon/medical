Given /^I have clients (.+)$/ do |clients|
  clients.split(',').each do |fio|
    fio_parts = fio.split(" ")
    FactoryGirl.create(:client,:surname => fio_parts[0],:name => fio_parts[1], :father_name => fio_parts[2])
  end
end




#----------------------------
#

Given /^no clients$/ do
 Client.delete_all
end

Given /^(\d+) ins_company in db named "([^"]*)"$/ do |arg1, name|
 FactoryGirl.create(:ins_company,:name => name)
end

When /^i go to clients add form$/ do
  visit clients_path
  click_link I18n.t(:new_client)
end

When /^i enter name "([^"]*)"$/ do |name|
  fill_in("client_name",:with => name) 
end

When /^i enter surname "([^"]*)"$/ do |surname|
  fill_in("client_surname",:with => surname) 
end

When /^i enter father_name "([^"]*)"$/ do |father_name|
  fill_in("client_father_name",:with => father_name) 
end

When /^i enter birth_date "([^"]*)"$/ do |bd|
  fill_in("client_birth_date",:with => bd) 
end

When /^i select ins_company "([^"]*)"$/ do |name|
  select(name,:from => "client_ins_company_id")
end

When /^i select sex "([^"]*)"$/ do |sex|
  select(sex,:from => "client_client_sex_id")
end


Then /^I should see fio "([^"]*)"$/ do |fio|
  page.should have_content(fio)
end

Then /^I should see birthdate "([^"]*)""$/ do |bd|
  page.should have_content(bd)
end

Then /^I should see company name "([^"]*)"$/ do |name|
  page.should have_content(name)
end

Then /^I should see sex "([^"]*)"$/ do |sex|
 page.should have_content(sex)
end

When /^i go to "([^"]*)" edit form$/ do |surname|
 c = Client.find_by_surname(surname)
 #save_page
 click_link("e_#{c.id}")
 #visit edit_client_path(c)
end

Then /^I Should see add form "([^"]*)"$/ do |form_title|
 page.should have_content(form_title)
end


When /^i click link del with client surname "([^"]*)"$/ do |surname|
 c = Client.find_by_surname(surname)
 click_link("d_#{c.id}")
end



Then /^I should not see surname "([^"]*)"$/ do |surname|
 page.should_not have_content(surname)
# Client.find_by_surname(surname).count.should == 0
end

