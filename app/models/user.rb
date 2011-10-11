class User < ActiveRecord::Base
  belongs_to :doctor_type, :class_name => 'Ref::DoctorType'
  has_many :prof_inspections,:dependent => :delete_all,:order =>"actual_date DESC"
  validates :name,:surname,:doctor_type_id, :presence => true


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname,:father_name, :doctor_type_id

def to_s
  short_fio_with_doctor_type
end

def short_fio
 res=name 
 unless (surname.nil? or name.nil? or father_name.nil?)
  res="#{surname} #{name[0]}. #{father_name[0]}."
 end
end

def short_fio_with_doctor_type
 res='Hello'
 unless (surname.nil? or name.nil? or father_name.nil? or doctor_type.nil?)
  res="#{surname} #{name[0]}. #{father_name[0]}. | #{doctor_type.name}"
 end
end


end
