class Ref::MkbType < ActiveRecord::Base

belongs_to :doctor_type,:class_name => "Ref::DoctorType"

validates :code,:name, :presence => true
validates :code, :uniqueness => true
validates :code, :format => {:with => /^([A-Z])(\d+\.*)*/}


acts_as_taggable  #Теги для отнесения к тому или иному классу заболеваний

scope :tisis, lambda { where("code_i between ? and ? ",cti("A15"),cti("A19"))}
scope :neoplasm, lambda { where("code_i between ? and ? ",cti("C0"),cti("D48"))}
scope :glaukoma, lambda { where("code_i between ? and ? ",cti("H40"),cti("H42"))}
scope :diabet, lambda { where("code_i between ? and ? ",cti("E10"),cti("E14"))}

scope :infections_parasits, lambda { where("code_i between ? and ? ",    cti("A0"), cti("B99"))}
scope :neoplasms, lambda { where("code_i between ? and ? ",              cti("C0"), cti("D48"))}
scope :endocryne_diseases, lambda { where("code_i between ? and ? ",     cti("E0"), cti("E90"))}
scope :blood_diseases, lambda { where("code_i between ? and ? ",         cti("D50"),cti("D89"))}
scope :nervous_diseases, lambda { where("code_i between ? and ? ",       cti("G0"), cti("G99"))}
scope :ear_diseases, lambda { where("code_i between ? and ? ",           cti("H60"),cti("H95"))}
scope :eye_diseases, lambda { where("code_i between ? and ? ",           cti("H0"), cti("H59"))}
scope :circulatory_diseases, lambda { where("code_i between ? and ? ",   cti("I0"), cti("I99"))}
scope :respiratory_diseases, lambda { where("code_i between ? and ? ",   cti("J0"), cti("J99"))}
scope :digestive_diseases, lambda { where("code_i between ? and ? ",     cti("K0"), cti("K93"))}
scope :genitourinary_diseases, lambda { where("code_i between ? and ? ", cti("N0"), cti("N99"))}
scope :skin_diseases, lambda { where("code_i between ? and ? ",          cti("L0"), cti("L99"))}
scope :musculskeletal_diseases, lambda { where("code_i between ? and ? ",cti("M0"), cti("M99"))}
scope :injury_poisons, lambda { where("code_i between ? and ? ",         cti("S0"), cti("E14"))}


#scope :tisis, lambda { where("code = ? or code = ?","C","C1")}


before_save :create_code_i

def create_code_i
 code_i = Ref::MkbType.cti(code)
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
 
 unless code.nil? or code.blank? or code.length < 1 or not code =~/^([A-Z])(\d+\.*)*/

  result = (code[0].ord-'A'.ord) << 24
  
  numbers = code[1,code.length].split(".") 

  numbers.each_with_index do |num,index|

    result |= num.to_i << (16-8*index)

  end


 end

 result
end

end
