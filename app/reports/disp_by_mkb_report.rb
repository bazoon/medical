class DispByMkbReport < BaseReport
  attr_accessor :rows
  

def fill
  mkbs = Mkb.before(@ed).client_present(@ed).client_sector(@sector_num)
  diseases = mkbs.map {|mkb| mkb.mkb_type.name}.uniq

  @rows = Hash.new

  diseases.each do |d|  
   @rows[d] ||= Array.new
   @rows[d][0] = is_here_on(d,@sd)
   @rows[d][1] = taken(d,@sd,@ed)
   @rows[d][2] = gone(d,@sd,@ed)
   @rows[d][3] = is_here_on(d,@ed)
   @rows[d][4] = better(d,@sd,@ed)
   @rows[d][5] = worse(d,@sd,@ed)
   @rows[d][6] = stable(d,@sd,@ed)
  end

end

private

def better(disease_name,sd,ed)
 disps = Disp.disease(disease_name).between(sd,ed).progress.count
end

def worse(disease_name,sd,ed)
 disps = Disp.disease(disease_name).between(sd,ed).regress.count
end

def stable(disease_name,sd,ed)
 disps = Disp.disease(disease_name).between(sd,ed).stable.count
end


def is_here_on(disease_name,view_date)
  Mkb.before(view_date).present(view_date).disease(disease_name).count
end

def taken(disease_name,sd,ed)
  Mkb.between(sd,ed).present(ed).disease(disease_name).count
end

def gone(disease_name,sd,ed)
  Mkb.gone(sd,ed).disease(disease_name).count
end



end
