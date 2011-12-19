class User < ActiveRecord::Base
  belongs_to :doctor_type, :class_name => 'Ref::DoctorType'
  has_many :prof_inspections,:dependent => :delete_all,:order =>"actual_date DESC"
  validates :name,:surname,:doctor_type_id, :presence => true
  has_many :mkbs

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname,:father_name, :doctor_type_id
  #has_secure_password

  scope :surname_like,lambda {|name| where("users.surname like")}


def self.surname_like(n)
 like= "%".concat(n.to_s.concat("%"))
 where("users.surname like ?",like)
end

def to_s
  short_fio_with_doctor_type
end

def short_fio
 res = name 
 unless (surname.nil? or name.nil? or father_name.nil?)
  res = "#{surname} #{name[0]}. #{father_name[0]}."
 end
end

def short_fio_with_doctor_type
 res = name 
 unless (surname.nil? or name.nil? or father_name.nil? or doctor_type.nil?)
  res = "#{surname} #{name[0]}. #{father_name[0]}. | #{doctor_type.name}"
 end
end


end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  surname                :string(255)
#  doctor_type_id         :integer
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  email                  :string(255)
#  father_name            :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  pass                   :string(255)
#  password_digest        :string(255)
#

