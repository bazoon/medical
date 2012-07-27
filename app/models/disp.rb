class Disp < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :mkb
  has_one :mkb_type,:through => :mkb


  STABLE = 1
  PROGRESS = 2
  REGRESS = 3



  scope :stable, where("result = ?",STABLE)
  scope :progress, where("result = ?",PROGRESS)
  scope :regress, where("result = ?",REGRESS)

  scope :before, lambda {|d| where("disps.actual_date < ?",d)}
  scope :between, lambda {|s,e| where("disps.actual_date between ? and ?",s,e)}

  scope :client_present,lambda {|e| joins(:client).merge(Client.present(e))}
  scope :client_sector,lambda {|n| joins(:client).merge(Client.sector(n))}


  scope :disease, lambda {|d| joins(:mkb).merge(Mkb.disease(d))}


# def mkb_info
#   mkb.mkb
#  "#{mkb.mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
# end
#
# def mkb_info=(name)
#   code = name[0,name.index(":")]
#   self.mkb_type = Ref::MkbType.find_by_code(code)
# end


#  def mkb_info
#    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
#  end




  def result_info
   res=case result
           when STABLE then I18n.t(:disp_unchanged)
           when PROGRESS then I18n.t(:disp_improvement)
           when REGRESS then I18n.t(:disp_degradation)
          end
   res
  end



end
# == Schema Information
#
# Table name: disps
#
#  id             :integer         not null, primary key
#  actual_date    :date
#  disp_type      :integer
#  mkb_type_id    :integer
#  doctor_type_id :integer
#  result         :integer
#  disp_group     :integer
#  created_at     :datetime
#  updated_at     :datetime
#  client_id      :integer
#  user_id        :integer
#

