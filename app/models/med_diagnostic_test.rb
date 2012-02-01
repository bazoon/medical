class MedDiagnosticTest < ActiveRecord::Base
  belongs_to :hospitalization_type, :class_name => 'Ref::HospitalizationType'
  validates :test_date,:hospitalization_type_id,:result, :presence => true
  belongs_to :client, :counter_cache => true
  has_many :med_diagnostic_test_doctors
  has_many :doctor_types,:through => :med_diagnostic_test_doctors, :class_name => 'Ref::DoctorType'


  scope :before, lambda {|d| where("test_date < ?",d)}
  scope :between, lambda {|s,e| where("test_date between ? and ?",s,e)}
  
  scope :client_present,lambda {|e| joins(:client).merge(Client.present(e))}
  scope :client_sector,lambda {|n| joins(:client).merge(Client.sector(n))}


  AIM_CONSULT = 1
  AIM_THERAPY_CORRECTION = 2
  AIM_DIAGNOSIS_CLARIFICATION = 3
  AIM_EXAMINATION = 4
  AIM_OPERATION = 5
  AIM_CONTROL_INSPECTION = 6


  attr_reader :doctor_tokens
  attr_accessible :doctor_tokens,:test_date,:hospitalization_type_id,:result

  def hospitalization_type_name
    hospitalization_type.name unless hospitalization_type.nil?
  end

  def doctor_tokens=(ids)
    self.doctor_type_ids = ids.split(",")
  end

  def hospitalization_type_info
    hospitalization_type.name unless hospitalization_type.nil?
  end


end
# == Schema Information
#
# Table name: med_diagnostic_tests
#
#  id                      :integer         not null, primary key
#  test_date               :date
#  client_id               :integer
#  result                  :text
#  created_at              :datetime
#  updated_at              :datetime
#  hospitalization_type_id :integer
#  aim                     :integer
#

