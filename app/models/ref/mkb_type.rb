class Ref::MkbType < ActiveRecord::Base

belongs_to :doctor_type,:class_name => "Ref::DoctorType"

validates :code,:name, :presence => true
validates :code, :uniqueness => true

require 'csv'

  def import_csv

  CSV.foreach("/home/bazoon/mkb10.csv")  do |row|

   unless (row.nil? or row[0].nil? or row[1].nil?) 
     @mkbt=Ref::MkbType.new
     @mkbt.code=row[4]
     @mkbt.name=row[5] 
     @mkbt.class_number=row[0]
     @mkbt.doctor_type_id=row[6]
     @mkbt.save! unless (@mkbt.name.nil? or @mkbt.code.nil?)
   end

    end

  end

def code_with_name
 "#{code} #{name}"
end

def can_be_deleted
  true
end


end
