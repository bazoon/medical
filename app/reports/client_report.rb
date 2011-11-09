# encoding: utf-8
class ClientReport < Prawn::Document

  Widths = [200,200,120]
  Headers = ['ФИО', 'Дата рождения', 'Снилс']

  def row(fio, birth_date, snils,pdf)
    row = [fio, birth_date, snils]
    pdf.make_table([row]) do |t|
      t.column_widths = Widths
      t.cells.style :borders => [:left, :right], :padding => 2
    end
  end
  
 
 def foo

  words = "Hello There"
  Prawn::Document.generate "example.pdf" do |pdf|
   pdf.text words
   @s=pdf.render
  end

 
  @s
 end

  def to_pdf


   Prawn::Document.generate "example.pdf" do |pdf|

     a=@ti

     pdf.font_families.update(
        "Verdana" => {
          :bold => "prawn_fonts/verdanab.ttf",
          :italic => "prawn_fonts/verdanai.ttf",
          :normal  => "prawn_fonts/verdana.ttf" })
      pdf.font "Verdana", :size => 10

      pdf.text a

      @clients=Client.find(:all,:limit => 25)

      data = []
      items = @clients.each do |item|
        data << row(item.fio,item.birth_date,item.snils,pdf)
      end

      head = pdf.make_table([Headers], :column_widths => Widths)    
      pdf.table([[head], *(data.map{|d| [d]})], :header => true, :row_colors => %w[cccccc ffffff]) do
        row(0).style :background_color => '000000', :text_color => 'ffffff'
        cells.style :borders => []
      end

    @a=pdf.render
   end
    
   @a
  end
end
