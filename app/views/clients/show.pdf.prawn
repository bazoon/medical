

prawn_document do |pdf|





  pdf.text @ti 
  pdf.text "Look! I'm a PDF"

   pdf.font_families.update(
      "Verdana" => {
        :bold => "prawn_fonts/verdanab.ttf",
        :italic => "prawn_fonts/verdanai.ttf",
        :normal  => "prawn_fonts/verdana.ttf" })
    pdf.font "Verdana", :size => 10

   

    @clients=Client.find(:all,:limit => 25)

    data = []
    items = @clients.each do |item|
      data << row(item.fio,item.birth_date,item.snils)
    end

    head = make_table([Headers], :column_widths => Widths)    
    table([[head], *(data.map{|d| [d]})], :header => true, :row_colors => %w[cccccc ffffff]) do
      row(0).style :background_color => '000000', :text_color => 'ffffff'
      cells.style :borders => []
    end


end
