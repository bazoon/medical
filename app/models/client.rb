class Client < ActiveRecord::Base
  DETACH_REASON_NONE = 0
  DETACH_REASON_OTHER_CLINIC = 1
  DETACH_REASON_DIED_AT_HOME =2
  DETACH_REASON_DIED_AT_CLINIC = 3

  belongs_to :client_sex
  belongs_to :ins_company, :class_name => 'Ref::InsCompany'
  belongs_to :death_reason, :class_name => 'Ref::DeathReason'
    
  has_many :lab_tests, :dependent => :delete_all,:order =>"test_date DESC"
  has_many :diagnostic_tests,:dependent => :delete_all,:order =>"test_date DESC"
  has_many :hospitalizations,:dependent => :delete_all,:order =>"period_start DESC"
  has_many :htm_help_notes,:dependent => :delete_all,:order =>"actual_date DESC"
  has_many :sanatorium_notes,:dependent => :delete_all,:order =>"neediness_ref_date DESC"
  has_many :med_diagnostic_tests,:dependent => :delete_all,:order =>"test_date DESC"
  has_many :prof_inspections,:dependent => :delete_all,:order =>"actual_date DESC"
  
  has_many :benefits,:dependent => :delete_all,:order => "prim DESC"
  has_many :benefit_categories, :through => :benefits

  has_many :mkbs,:dependent => :delete_all,:order => "actual_date DESC"
  has_many :mses,:dependent => :delete_all,:order => "id DESC"
  has_many :disps,:dependent => :delete_all,:order => "id DESC"

  validates :name,:surname,:birth_date,:ins_company_id,:client_sex_id, :presence => true
    
  scope :present, lambda {|e| where("attach_date <= ? and (detach_date is null or detach_date > ?) ",e,e)}

 # validates :birth_date, :format => {:with => /\d{2}\.\d{2}\.\d{4}/, :message => I18n.t(:invalid_date_format)}

  #Инвалиды войны
  #scope :war_invalids,includes(:benefits).where("benefits.benefit_category_id=?",Ref::BenefitCategory.war_invalid_id)
 # scope :war_participants,includes(:benefits).where("benefits.benefit_category_id IN (?)",Ref::BenefitCategory.war_participants_ids)
  
 # scope :war_invalids,lambda { joins(:benefits).merge(Benefit.war_invalids )  }
 
  #Возможна ошибка, если ищется id несуществующей льготы
  scope :benefit_category, lambda { |code| includes(:benefits).where("benefits.benefit_category_id = ?",Ref::BenefitCategory.id_by_code(code) ) }
 

  scope :war_invalids,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.war_invalids)
  scope :war_participants,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.war_participants)
  scope :conflict_participants,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.conflict_participants)
  scope :widows,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.widows)
  scope :blokadniks,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.blokadniks)
  scope :prisoners,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.prisoners)
  scope :front_workers,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.front_workers)
  scope :repressed,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.repressed)
  scope :chernobil,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.chernobil)
  scope :veterans,joins(:benefits,:benefit_categories).merge(Ref::BenefitCategory.veterans)


  scope :pensioners,where("pensioner = true")


  
  scope :disables, where("disabled = true") 
 

  #Disp scopes 
  scope :disp_out, joins(:disps).merge(Disp.out)
  scope :disp_initial, joins(:disps).merge(Disp.initial)
  scope :disp_non_out, joins(:disps).merge(Disp.non_out)

  scope :disp_before, lambda {|d| joins(:disps).merge(Disp.before(d) )}
  scope :disp_between, lambda {|s,e| joins(:disps).merge(Disp.between(s,e) )}

  scope :died, where("detach_reason in (2,3)")
  scope :moved, where("detach_reason = 1")

  scope :full_inspected,lambda { where("prof_inspections_count >= 12") } #Период не выбран ! Использовать только для выборки за определенный год
  scope :rested,lambda { where("sanatorium_notes_count > 0") } #Период не выбран ! Использовать только для выборки за определенный год

  #Mse scoupes
  scope :mse_group_increased, lambda {joins(:mses).merge(Mse.group_increase )}
  scope :mse_group_increased_2_1, lambda {joins(:mses).merge(Mse.group_increase_2_1 )}
  scope :mse_group_increased_3_2, lambda {joins(:mses).merge(Mse.group_increase_3_2 )}
  scope :mse_iprs, lambda {joins(:mses).merge(Mse.iprs )}
  scope :mse_first, lambda {joins(:mses).merge(Mse.first )}
  scope :mse_between, lambda {|s,e| joins(:mses).merge(Mse.between(s,e) )}
  scope :mse_re, lambda {joins(:mses).merge(Mse.re )}
  scope :mse_re_2, lambda {joins(:mses).merge(Mse.re_2 )}
  scope :mse_re_3, lambda {joins(:mses).merge(Mse.re_3 )}
  scope :mse_re_3_2, lambda {joins(:mses).merge(Mse.re_3_2 )}

def prof_inspection_years
  years=prof_inspections.group_by {|p| p.actual_date.year}
end

def blood
 g={1 => "O(I) Rh+",2 => "O(I) Rh-",3 => "A(II) Rh+",4 => "A(II) Rh-",5 => "B(III) Rh+",6 => "B(III) Rh-",7 => "AB(VI) Rh+",8 => "AB(VI) Rh-"}
 g[blood_group]
end

def detach_reason_info
 result=case detach_reason
         when 0 then I18n.t(:detach_reason_none)
         when 1 then I18n.t(:detach_reason_other_clinic)
         when 2 then I18n.t(:detach_reason_died_at_home)
         when 3 then I18n.t(:detach_reason_died_at_clinic)
        end 
 result
end


def have_full_prof_inspection_this_year?
 count = prof_inspections.current_year.count * client_sex_id
 result = count

 if client_sex_id == 1
   result = case count
      when 12 then :prof_all
      when 1..11 then :prof_partial    
   end
 else
   result = case count
      when 24 then :prof_all
      when 2..22 then :prof_partial    
   end
 end
            
 if count == 0 
  result = I18n.t(:prof_zero)
 end

 result
end


def have_full_prof_inspection_in_year(sd,ed)
 count = prof_inspections.in_year(sd,ed).count * client_sex_id
 result = count

 if client_sex_id == 1
   result = case count
      when 12 then :prof_all
      when 1..11 then :prof_partial    
   end
 else
   result = case count
      when 24 then :prof_all
      when 2..22 then :prof_partial    
   end
 end
            
 if count == 0 
  result = :prof_zero
 end

 result
end



def primary_benefit
 benefits.each do |b|
 end

end

def boolean_to_yes_no(field)
  if send(field)
    I18n.t(:y) 
  else
    I18n.t(:n)
  end
end


def local_date(field)
 I18n.l(self.send(field)) unless self.send(field).nil?
end

def passport
 "#{pasp_seria} #{pasp_num}"
end

def work_info
 "#{work_place} / #{work_position}"
end

def client_name=(name)
  client = Client.find_by_surname(name)
  if client
    self.user_id = client.id
  else
    errors[:user_name] << "Invalid name entered"
  end
end

def client_name
  Client.find(client_id).name if client_id
end


 def self.search(search)
  if search
    s=search.scan(/\S+/)
    case s.size
    when 1  
      if s[0]
        where('surname LIKE ?', "%#{s[0]}%")  
      else
        scoped
      end 
    when 3
      where('surname LIKE ? and name LIKE ? and father_name LIKE ?',"#{s[0]}","#{s[1]}","#{s[2]}")  
#      find_by_surname_and_name_and_father_name(s[0],s[1],s[2])
    else
      scoped
    end  
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
     @client.ins_seria=row[6]
     @client.ins_num=row[7]
     @client.reg_address=row[9]
     @client.snils=row[10]

     @client.ins_company_id=1
     @client.save! unless (@client.name.nil? or @client.birth_date.nil? or @client.client_sex_id.nil?)
   end
   
    end

#  render :text => @client.num_card
    @clients
  end

end
