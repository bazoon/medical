class Mse < ActiveRecord::Base
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  belongs_to :client

  scope :before, lambda {|end_time| {:conditions => ["indefinitely=false and conclusion_date+conclusion_till < ?", Mse.format_date(end_time)]}}
  scope :after, lambda {|start_time| {:conditions => ["indefinitely=false and conclusion_date+conclusion_till > ?", Mse.format_date(start_time)] }}

  validates :conclusion_date,:mkb_type_id,:send_date,:client_id,:user_id, :presence => true


 def next_conclusion_date
  conclusion_date+conclusion_till unless indefinitely 
 end

  def mkb_info
    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
  end


  def reason_info
   result=case reason
           when 1 then I18n.t(:mse_first_group)
           when 2 then I18n.t(:mse_second_group)
           when 3 then I18n.t(:mse_third_group)
           when 4 then I18n.t(:mse_unchanged)
           when 5 then I18n.t(:mse_third_to_one)
           when 6 then I18n.t(:mse_second_to_one)
           when 7 then I18n.t(:mse_third_to_second)
          end 
   result
  end




  def conclusion_info
   result=case conclusion_group
           when 0 then I18n.t(:mse_refused)
           when 1 then I18n.t(:mse_first_group)
           when 2 then I18n.t(:mse_second_group)
           when 3 then I18n.t(:mse_third_group)
          end 
   result
  end


  def again
    if indefinitely
      result = I18n.t(:mse_indefinitely)
    else
      result = I18n.l(conclusion_date + conclusion_till) unless conclusion_date.nil?
    end
  end

 
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  
 def as_json(options = {})
    {
      :id => self.id,
      :title => self.client.fio,
      :description => "Descr",
      :start => next_conclusion_date.rfc822,
      :end => next_conclusion_date.rfc822,
      :allDay => false,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.client_mses_path(self.client.id)
    }
  end


end
