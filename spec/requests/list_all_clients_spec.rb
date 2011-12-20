require 'spec_helper'

describe "ListAllClients" do
    after(:all) do
      Client.find_by_surname('Capybara').destroy
    end

#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get list_all_clients_index_path
#      response.status.should be(200)
#    end


    it 'lists clients when clients link clicked' do
      visit root_path
      click_link I18n.t(:clients)
      page.should have_content I18n.t(:clients)
      page.should have_link I18n.t(:new_client)
      page.should have_table("clients_table")
    end  

  context "it creates ins_company in db" do
    
    before(:all) do
     @ins = FactoryGirl.create(:ins_company,:name =>"Ugoria") 
    end
  
    after(:all) do
     @ins.destroy 
    end

    it 'creates new clients' do
      visit clients_path
      click_link I18n.t(:new_client)
      fill_in("client_surname",:with => "Capybara") 
      fill_in("client_name",:with => "Tester") 
      fill_in("client_birth_date",:with => "01.01.2001") 
      select(I18n.t(:c_female),:from => "client_client_sex_id")
      select(@ins.name,:from => "client_ins_company_id")
      click_button("submit")
#
      page.should have_content("Capybara Tester")
      page.should have_content("01.01.2001")
      page.should have_content(I18n.t(:c_female))
      page.should have_content(@ins.name)
  end

 
    context 'it creates client in db' do
      before(:all) do
       @client = FactoryGirl.create(:client,:name => "Ivan",:surname => "Petrov",:father_name => "Ivanovich",:ins_company_id => @ins.id)
       @client.birth_date = '01.01.2011'
       @client.num_card = "101101"
       @client.snils = "snils"
       @client.client_sex_id = Client::FEMALE
       @client.work_place = "OOO"
       @client.work_position = "worker"
       @client.pensioner = true
       @client.blood_group = 2
       @client.attach_date = '01.01.2011'
       @client.save!
      end

      after(:all) do
        @client.destroy
      end

      it 'visit edit client path and saves changes ' do
        visit edit_client_path(@client)
        page.should have_content(@client.local_date(:birth_date))
        page.should have_content(@client.num_card)
        page.should have_content(@client.snils)
        page.should have_content(@client.sex)
        page.should have_content(@client.work_place)
        page.should have_content(@client.work_position)
        page.should have_content(@client.blood)
        page.should have_content(@client.local_date(:attach_date))


      end
    

    end

  end


end
