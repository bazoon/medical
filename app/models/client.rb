class Client < ActiveRecord::Base
  belongs_to :client_sex
  belongs_to :ins_company, :class_name => 'Ref::InsCompany'
  has_many :lab_tests, :dependent => :delete_all,:order =>"test_date DESC"
  has_many :diagnostic_tests,:dependent => :delete_all,:order =>"test_date DESC"
  has_many :hospitalizations,:dependent => :delete_all,:order =>"actual_date DESC"
  has_many :htm_help_notes,:dependent => :delete_all,:order =>"actual_date DESC"
  has_many :sanatorium_notes,:dependent => :delete_all,:order =>"actual_date DESC"
  has_many :med_diagnostic_tests,:dependent => :delete_all,:order =>"test_date DESC"
  has_many :prof_inspections,:dependent => :delete_all,:order =>"actual_date DESC"

  validates :name,:surname,:birth_date,:ins_company_id,:client_sex_id, :presence=>true


 def self.search(surname)  
  if surname
    where('surname LIKE ?', "%#{surname}%")  
  else
    scoped
  end 
 end 


def has_some_records?(record_class)
 self.send(record_class).count>0 unless self.send(record_class).nil?
end

def fio
  "#{surname} #{name} #{father_name}"
end
 
def short_fio
 res=name 
 unless (surname.nil? or name.nil? or father_name.nil?)
  res="#{surname} #{name[0]}. #{father_name[0]}."
 end
end

  def convert_d(b)
   res=b[0,2]+'.'+b[2,2]+'.'+b[4,4] unless (b.nil? or b.length < 8)
   res=' ' if res.nil?
   res
  end

  def sex(s)
   


    res=2
    if (s==I18n.t(:sex_m))
     res=1    
    end


    res
  end

  def import_csv

   s="hello" 

  @clients=[]
  CSV.foreach("/home/bazoon/form2_fios.csv")  do |row|
  
   unless (row.nil? or row[1].nil? or row[2].nil? or row[3].nil? or row[11].nil? or row[5].nil?) 

     @client=Client.new
     @client.num_card=row[0]
     @client.father_name=row[3].mb_chars.capitalize unless row[1].nil?
     @client.name=row[2].mb_chars.capitalize unless row[2].nil?
     @client.surname=row[1].mb_chars.capitalize unless row[3].nil?
     sex=row[11]
     @client.client_sex_id=sex
     @client.birth_date=convert_d(row[5])
     @client.pasp_seria=row[6]
     @client.pasp_num=row[7]
     @client.address=row[9]
     @client.snils=row[10]

     @client.ins_company_id=1
     @client.save! unless (@client.name.nil? or @client.birth_date.nil? or @client.client_sex_id.nil?)
   end
   
    end

#  render :text => @client.num_card
    @clients
  end

end
