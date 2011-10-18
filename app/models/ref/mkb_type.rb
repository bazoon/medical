class Ref::MkbType < ActiveRecord::Base

require 'csv'

  def import_csv

  CSV.foreach("/home/bazoon/mkb10.csv")  do |row|
  
   unless (row.nil? or row[0].nil? or row[1].nil?) 

     @mkbt=Ref::MkbType.new
     @mkbt.code=row[1]
     @mkbt.name=row[0] 
     @mkbt.save! unless (@mkbt.name.nil? or @mkbt.code.nil?)
   end
   
    end

  end


def can_be_deleted
  true
end


end
