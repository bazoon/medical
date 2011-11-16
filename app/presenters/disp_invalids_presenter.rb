class DispInvalidsPresenter < BasePresenter
 
################## Строка №1: Состоит под наблюдением на начало


#Заполняет хэш год -> льгота = количество на начало
def fill_observed_on_begin(years,items)
 @observed_by_years_and_benefits_beg ||= Hash.new
 years.each do |y|
  items.each do |b|
   @observed_by_years_and_benefits_beg[y] ||= Hash.new
   @observed_by_years_and_benefits_beg[y][b] = get_observed_on_begin_abs(y,b) 
  end
 end
end


#Метод доступа к переменной внутри класса
def observed_on_begin_abs(year,benefit)
 @observed_by_years_and_benefits_beg[year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def observed_on_begin_total(year)
 sum = 0
 @observed_by_years_and_benefits_beg[year].each {|k,v| sum = sum +v}
 sum
end

############## Строка №2 Вновь взято на диспансерное наблюдение


#Заполняет хэш год -> льгота = количество взятых
def fill_taken(years,items)
 @taken_by_year_and_benefit ||= Hash.new
 years.each do |y|
  items.each do |b|
   @taken_by_year_and_benefit[y] ||= Hash.new
   @taken_by_year_and_benefit[y][b] = get_taken_abs(y,b) 
  end
 end
end


#Метод доступа к переменной внутри класса
def taken_abs(year,benefit)
 @taken_by_year_and_benefit[year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def taken_total(year)
 sum = 0
 @taken_by_year_and_benefit[year].each {|k,v| sum = sum +v}
 sum
end


############## Строка №3 Снято с диспансерного наблюдения

#Заполняет хэш год -> льгота = количество взятых
def fill_out(years,items)
 @out_by_year_and_benefit ||= Hash.new
 years.each do |y|
  items.each do |b|
   @out_by_year_and_benefit[y] ||= Hash.new
   @out_by_year_and_benefit[y][b] = get_out_abs(y,b) 
  end
 end
end


#Метод доступа к переменной внутри класса
def out_abs(year,benefit)
 @out_by_year_and_benefit[year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def out_total(year)
 sum = 0
 @out_by_year_and_benefit[year].each {|k,v| sum = sum +v}
 sum
end

############## Строка №4 Снято с диспансерного наблюдения в том числе выехало


#Заполняет хэш год -> льгота = количество взятых
def fill_out_moved(years,items)
 @out_moved_by_year_and_benefit ||= Hash.new
 years.each do |y|
  items.each do |b|
   @out_moved_by_year_and_benefit[y] ||= Hash.new
   @out_moved_by_year_and_benefit[y][b] = get_out_moved_abs(y,b) 
  end
 end
end


#Метод доступа к переменной внутри класса
def out_moved_abs(year,benefit)
 @out_moved_by_year_and_benefit[year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def out_moved_total(year)
 sum = 0
 @out_moved_by_year_and_benefit[year].each {|k,v| sum = sum +v}
 sum
end


############## Строка №5 Снято с диспансерного наблюдения умерло


#Заполняет хэш год -> льгота = количество взятых
def fill_out_died(years,items)
 @out_died_by_year_and_benefit ||= Hash.new
 years.each do |y|
  items.each do |b|
   @out_died_by_year_and_benefit[y] ||= Hash.new
   @out_died_by_year_and_benefit[y][b] = get_out_died_abs(y,b) 
  end
 end
end


#Метод доступа к переменной внутри класса
def out_died_abs(year,benefit)
 @out_died_by_year_and_benefit[year][benefit]
end

#Сумма стоящих на учете на начало периода по всем категориям льготников
def out_died_total(year)
 sum = 0
 @out_died_by_year_and_benefit[year].each {|k,v| sum = sum +v}
 sum
end


private

#Возвращает количество стоящих на учете на начало отчетного периода
def get_observed_on_begin_abs(year,benefit)
 sd = Date.new(year,1,1) 
 observed_on_begin_count = Hash.new
 
 #Те, у кого дата постановки до отчетной даты, тип постановка/визит, и категория уов/ивов/убд
 on_observation = Client.includes(:disps,:benefits).where("benefits.benefit_category_id = ? and disps.actual_date < ? and disps.disp_type in(2,3)",Ref::BenefitCategory.id_by_code(benefit),sd)

 on_observation.each do |client|

 by_mkb = client.disps.group_by {|d| d.mkb_type.code }
  observed_on_begin_count[client.id] = 0
  by_mkb.each_pair do |m,items|
   sorted_disps = items.sort {|a,b| a.actual_date <=> b.actual_date } 
   observed_on_begin_count[client.id] = observed_on_begin_count[client.id] + 1 if sorted_disps.last.disp_type != 3
  end  
 end

 #@total ||= get_observed_on_begin_total(year)

 #Если у человека более чем одна болезнь на дисп учете то можно посмотроеть в observed_on_begin_count[client.id] там их количество
 count = observed_on_begin_count.count
 count
end



#Возвращает количество взятых на учет за отчетный период
def get_taken_abs(year,benefit)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 
 observed = Hash.new
 
 #Те, у кого дата постановки в пределах отч. периода, тип постановка, и категория уов/ивов/убд
 taken = Client.includes(:disps,:benefits).where("benefits.benefit_category_id = ? and disps.actual_date between ? and ? and disps.disp_type=2",Ref::BenefitCategory.id_by_code(benefit),sd,ed)

 taken.each do |client|

 by_mkb = client.disps.group_by {|d| d.mkb_type.code }
  observed[client.id] = 0
  by_mkb.each_pair do |m,items|
   observed[client.id] = observed[client.id] + 1 
  end  
  
 end

 #Если у человека более чем одна болезнь на дисп учете то можно посмотроеть в observed_on_begin_count[client.id] там их количество
 count = observed.count
 count
end


#Возвращает количество снятых за отчетный период
def get_out_abs(year,benefit)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 
 observed = Hash.new
 
 #Те, у кого дата постановки в пределах отч. периода, тип постановка, и категория уов/ивов/убд
 out = Client.includes(:disps,:benefits).where("benefits.benefit_category_id = ? and disps.actual_date between ? and ? and disps.disp_type=3",Ref::BenefitCategory.id_by_code(benefit),sd,ed)

 out.each do |client|

 by_mkb = client.disps.group_by {|d| d.mkb_type.code }
  observed[client.id] = 0
  by_mkb.each_pair do |m,items|
   observed[client.id] = observed[client.id] + 1 
  end  
  
 end

 count = observed.count
 count
end


#Возвращает количество снятых за отчетный период и выехавших
def get_out_moved_abs(year,benefit)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 
 observed = Hash.new
 
 #Те, у кого дата постановки в пределах отч. периода, тип постановка, и категория уов/ивов/убд
 out = Client.includes(:disps,:benefits).where("benefits.benefit_category_id = ? and disps.actual_date between ? and ? and disps.disp_type=3 and detach_reason=1",Ref::BenefitCategory.id_by_code(benefit),sd,ed)

 out.each do |client|

 by_mkb = client.disps.group_by {|d| d.mkb_type.code }
  observed[client.id] = 0
  by_mkb.each_pair do |m,items|
   observed[client.id] = observed[client.id] + 1 
  end  
  
 end

 count = observed.count
 count
end


#Возвращает количество снятых за отчетный период и умерших
def get_out_died_abs(year,benefit)
 sd = Date.new(year,1,1) 
 ed = Date.new(year,12,31) 
 observed = Hash.new
 
 #Те, у кого дата постановки в пределах отч. периода, тип постановка, и категория уов/ивов/убд
 out = Client.includes(:disps,:benefits).where("benefits.benefit_category_id = ? and disps.actual_date between ? and ? and disps.disp_type=3 and detach_reason in (2,3)",Ref::BenefitCategory.id_by_code(benefit),sd,ed)

 out.each do |client|

 by_mkb = client.disps.group_by {|d| d.mkb_type.code }
  observed[client.id] = 0
  by_mkb.each_pair do |m,items|
   observed[client.id] = observed[client.id] + 1 
  end  
  
 end

 count = observed.count
 count
end




end
