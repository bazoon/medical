Then /^I should see "([^"]*)"$/ do |value|         #"
 value.split(",").each {|v| page.should have_content(v) }


end

Then /^I should not see "([^"]*)"$/ do |fio|         #"
 page.should_not have_content(fio)
end


Then /^I should see$/ do |table|
  table.hashes.each do |values| 
    page.should have_content(values[:string])
  end

end

Then /^I should not see$/ do |table|
  table.hashes.each do |values| 
    page.should_not have_content(values[:string])
  end
end

Then /^I should see record updated message$/ do
  page.should have_content(I18n.t(:record_updated))
end

When /^i go to root$/ do
 visit root_path
end

When /^i go to "([^"]*)" index page$/ do |model|
 visit polymorphic_path(model)
end


When /^i go to "([^"]*)"$/ do |path|
 visit path
end


Given /^no "([^"]*)"$/ do |model|
 model.classify.constantize.delete_all
end

Given /^i click add_new_link/ do 
 click_link I18n.t(:new_record)
end

When /^i enter "([^"]*)" in "([^"]*)"$/ do |values, fields|
 field_array = fields.split(",")

 values.split(",").each_with_index do |v,index|
  #binding.pry
  fill_in(field_array[index],:with => v ) 
 end 

 #fill_in(field,:with => value) 
 

end

When /^i enter$/ do |table|

  table.hashes.each do |rows| 
  
    fields = rows[:field_name].split(",")
    values = rows[:value].split(",")
    
    values.count.should == fields.count

    values.each_with_index do |v,index|
      fill_in(fields[index], :with => v)
    end


  end

#  binding.pry
 # save


end

When /^i select "([^"]*)" in "([^"]*)"$/ do |value, select|
  select(value,:from => select)
end


When /^i select$/ do |table|

  table.hashes.each do |rows| 
  
    fields = rows[:field_name].split(",")
    values = rows[:value].split(",")
    
    values.count.should == fields.count

    values.each_with_index do |v,index|
      select(v, :from => fields[index])
    end


  end

end



When /^i click "([^"]*)" button$/ do |button_name|
  click_button(button_name)
end

When /^i click "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

# Goes to edit path of model with field_name=value
When /^i go to "([^"]*)" with "([^"]*)" "([^"]*)"$/ do |model, field_name, value|
 id = model.classify.constantize.where("#{field_name} = ?",value)[0].id
 obj = model.classify.constantize.find(id)
 visit edit_polymorphic_path(obj)
end

#Clicks link with id replaced by found record
When /^i hit "([^"]*)" for "([^"]*)" with "([^"]*)" "([^"]*)"$/ do |link, model , field_name, value|
 id = model.classify.constantize.where("#{field_name} = ?",value)[0].id
 obj = model.classify.constantize.find(id)
 visit link.gsub(/id/,obj.id.to_s) 
end

#Clik link within tr row if found string
When /^i hit "([^"]*)" for "([^"]*)"$/ do |link, string|
 # within(:xpath, "//table/tr[contains(.,'#{string}')]") do
  within(:xpath, "//tr[.//*[contains(text(), '#{string}')]]") do  
    find(link).click
  end

end

When /^i press ok button$/ do 
 page.driver.browser.switch_to.alert.accept
end

Then /^Save page$/ do 
 save_page
end
