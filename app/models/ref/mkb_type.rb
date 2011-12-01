class Ref::MkbType < ActiveRecord::Base

belongs_to :doctor_type,:class_name => "Ref::DoctorType"

validates :code,:name, :presence => true
validates :code, :uniqueness => true

acts_as_taggable  #Теги для отнесения к тому или иному классу заболеваний

scope :tisis, lambda { where("code_i between ? and ? ",cti("A15"),cti("A19"))}
scope :neoplasm, lambda { where("code_i between ? and ? ",cti("C0"),cti("D48"))}
scope :glaukoma, lambda { where("code_i between ? and ? ",cti("H40"),cti("H42"))}
scope :diabet, lambda { where("code_i between ? and ? ",cti("E10"),cti("E14"))}

#scope :tisis, lambda { where("code = ? or code = ?","C","C1")}


before_save :create_code_i


def create_code_i
  self.code_i = Ref::MkbType.cti(code)
end

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

def self.import_codes
 all.each do |m|
  m.code_i = Ref::MkbType.cti(m.code)
  m.save!
 end
end


def code_with_name
 "#{code} #{name}"
end

def can_be_deleted
  true
end


def self.cti(code)
 code.strip! 
 l = code[0]
 a = code[1,code.length].split(".") 
  
 
 if ('A' .. 'Z').include?(l)
  letter = l.ord
 else
  letter = 0  
 end

 unless a[0].nil?
   big_num = a[0].to_i
 else
   big_num = 0 
 end


 unless [1].nil?
   small_num = a[1].to_i
 else
   small_num = 0
 end

 letter << 16 | big_num << 8 | small_num
end

end
