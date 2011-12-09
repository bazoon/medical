class Mse < ActiveRecord::Base
  REASON_UNCHOSEN = 0
  REASON_INIT_FIRST = 1
  REASON_INIT_SECOND = 2
  REASON_INIT_THIRD = 3

  REASON_RE_SECOND = 4
  REASON_RE_THIRD = 8
  REASON_RE_3_1 = 5
  REASON_RE_2_1 = 6
  REASON_RE_3_2 = 7
 
  C_REFUSED = 0
  C_FIRST = 1
  C_SECOND = 2
  C_THIRD = 3


  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  belongs_to :client

  scope :before, lambda {|end_time| {:conditions => ["indefinitely=false and conclusion_date+conclusion_till < ?", Mse.format_date(end_time)]}}
  scope :after, lambda {|start_time| {:conditions => ["indefinitely=false and conclusion_date+conclusion_till > ?", Mse.format_date(start_time)] }}

  scope :between, lambda {|s,e| where("send_date between ? and ?",s,e)}
  scope :group_increase,  where("reason in (#{REASON_RE_3_1},#{REASON_RE_3_2},#{REASON_RE_2_1} )") 
  scope :group_increase_2_1, lambda {where("reason = #{REASON_RE_2_1}")}
  scope :group_increase_3_2, where("reason = #{REASON_RE_3_2}")
  scope :iprs, where("ipr = true")
  scope :first, where("reason in (#{REASON_INIT_FIRST},#{REASON_INIT_SECOND},#{REASON_INIT_THIRD})")
  scope :re, where("reason in (#{REASON_RE_SECOND},#{REASON_RE_THIRD},#{REASON_RE_3_1},#{REASON_RE_2_1},#{REASON_RE_3_2})")
  scope :re_2, where("reason = #{REASON_RE_SECOND}")
  scope :re_3, where("reason = #{REASON_RE_THIRD}")
  scope :re_3_2, where("reason = #{REASON_RE_3_2}")

  validates :conclusion_date,:mkb_type_id,:send_date,:client_id,:user_id, :presence => true


 def next_conclusion_date
  conclusion_date+conclusion_till unless indefinitely 
 end

 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
   code = name[0,name.index(":")]
   self.mkb_type = Ref::MkbType.find_by_code(code)
 end


 def mkb_info
  "{mkb_type.name}" unless mkb_type.nil?
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
# == Schema Information
#
# Table name: mses
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  mkb_type_id      :integer
#  send_date        :date
#  ipr              :boolean
#  conclusion_group :integer
#  conclusion_till  :integer
#  conclusion_date  :date
#  indefinitely     :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  client_id        :integer
#  consultation     :boolean         default(FALSE)
#  reason           :integer
#

