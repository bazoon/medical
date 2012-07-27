class Mkb < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user
  validates :client_id,:mkb_type_id,:actual_date,:user_id,:presence => true


  scope :before, lambda {|d| where("actual_date < ?",d)}
  scope :between, lambda {|s,e| where("actual_date between ? and ?",s,e)}
  scope :present, lambda {|e| where("out_date is null or out_date > ?",e)}
  scope :gone, lambda {|s,e| where("out_date between ? and ?",s,e) }

  scope :client_present,lambda {|e| joins(:client).merge(Client.present(e))}
  scope :client_sector,lambda {|n| joins(:client).merge(Client.sector(n))}
  scope :client_disables,lambda {joins(:client).merge(Client.disables)}
  scope :disease, lambda {|d| joins(:mkb_type).merge(Ref::MkbType.disease(d))}


  scope :disp_group, lambda {|d| where("disp_group = ?",d)}


 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
   code = name[0,name.index(":")]
   self.mkb_type = Ref::MkbType.find_by_code(code)
 end



end
# == Schema Information
#
# Table name: mkbs
#
#  id          :integer         not null, primary key
#  client_id   :integer
#  mkb_type_id :integer
#  actual_date :date
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

