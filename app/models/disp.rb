class Disp < ActiveRecord::Base
  belongs_to :client
  belongs_to :mkb_type, :class_name => 'Ref::MkbType'
  belongs_to :user 


  STABLE = 1
  PROGRESS = 2
  REGRESS = 3

  PLANNED = 1
  INITIAL = 2
  OUT = 3

  scope :initial, where("disp_type = ?",INITIAL)
  scope :non_initial, where("disp_type <> ?",INITIAL)
  scope :out, where("disp_type = ?",OUT)
  scope :planned, where("disp_type = ?",PLANNED)
  scope :non_out, where("disp_type in (?,?)",INITIAL,PLANNED)
  
  scope :stable, where("result = ?",STABLE)
  scope :progress, where("result = ?",PROGRESS)
  scope :regress, where("result = ?",REGRESS)

  scope :before, lambda {|d| where("disps.actual_date < ?",d)}
  scope :between, lambda {|s,e| where("disps.actual_date between ? and ?",s,e)}

 def mkb
  "#{mkb_type.try(:code)}: #{mkb_type.try(:name)}" unless mkb_type.nil?
 end

 def mkb=(name)
   code = name[0,name.index(":")]
   self.mkb_type = Ref::MkbType.find_by_code(code)
 end


#  def mkb_info
#    "#{mkb_type.code} #{mkb_type.name}" unless mkb_type.nil?
#  end

  def disp_type_info
   result=case disp_type
           when PLANNED then I18n.t(:disp_plan)
           when INITIAL then I18n.t(:disp_initial)
           when OUT then I18n.t(:disp_out)
          end 
   result
  end



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

