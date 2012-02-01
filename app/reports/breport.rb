class Breport 
  attr_accessor :num_rows, :num_columns
  attr_accessor :sd,:ed
  attr_accessor :years
  attr_accessor :table

 def prepare(sd,ed,num_rows,num_columns) 
  @sd = sd
  @ed = ed
  @num_rows = num_rows
  @num_rows ||= get_rows_count
  @num_columns = num_columns

  @table = Hash.new

  num_columns.downto(1) do |current_column|
    num_rows.downto(1) do |current_row|
      @table[[current_column,current_row]] = get_table_value(current_column,current_row)
    end
  end

 end

 def column_total(column)
   sum = 0
   num_rows.downto(1) do |row|
     sum += @table[[column,row]]
   end
  sum
 end


 def get_rows_count
  10
 end

 def get_table_value(column,row)
  rand(column*row)
 end  


 def initialize(template)
  @template = template  
 end

 def h
  @template
 end

 def method_missing(*args,&block)
   @template.send(*args,&block)
 end

private
 
 def years_array(sd,ed)
    @start_year = Date.parse(sd).year
    @end_year = Date.parse(ed).year

    @years = []
    @start_year.upto(@end_year) {|y| @years << y }

    @years
  end
 

end
