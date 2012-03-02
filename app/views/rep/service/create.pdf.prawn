pdf = Prawn::Document.new :size => "A5", :page_layout => :portrait


pdf.font_families.update(
      "Verdana" => {
        :bold => "other/prawn_fonts/verdanab.ttf",
        :italic => "other/prawn_fonts/verdanai.ttf",
        :normal  => "other/prawn_fonts/verdana.ttf" })

pdf.font "Verdana", :size => 14

        pdf.text "Лист учета оказанных медицинских услуг"
        pdf.move_down 10

        pdf.font_size 11    

        pdf.text "Наименование организации здравоохранения: <b> ГЛПУ ТО Госпиталь ветеранов войн </b>", :inline_format => true, :leading => 5
        pdf.text "Отчетный период: с ____________ по ________________", :leading => 5
        pdf.text  "ФИО пациента: <b> #{@client.fio} </b>", :inline_format => true, :leading => 5
        pdf.text "Дата рождения: <b> #{ldate @client.birth_date} </b>  Стоимость лечения (тариф): <b> #{@summa} </b> ", :inline_format => true, :leading => 5  
        pdf.text "Наименование страховой медицинской организации: <b> #{@client.ins_company.name} </b>", :inline_format => true, :leading => 5
        pdf.text "Страховой полис: серия <b> #{@client.ins_seria} </b> № <b> #{@client.ins_num} </b>", :inline_format => true, :leading => 5
        pdf.text "Оказанные медицинские услуги:", :leading => 5
 
        pdf.table [ [ "Специальность врача (полностью)", "Код специальности", "Даты посещений, УЕТ (для поликлиники)",
                      "Период нахождения в стационаре", "Качеством оказанной мед. услуги удовлетворен (да / нет)", "Подпись пациента"],
                     ["                ", "                ","                ","                 ","                ","               "] ]
        
        pdf.move_down 10

        pdf.text "Особое мнение пациента: ________________________________________ ", :leading => 5
        pdf.text "_________________________________________________________________"
        pdf.text "СНИЛС: <b> #{@client.snils} </b>", :inline_format => true
        pdf.text "код врача _____ диагноз _________ код льготы <b> #{@client.primary_benefit_code} </b>", :inline_format => true
        pdf.text "номер карты: <b> #{@client.num_card} </b>", :inline_format => true

