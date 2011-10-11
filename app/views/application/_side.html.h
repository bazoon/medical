#accordion_menu
  -unless @client.nil? or @client.id.nil?
    %h3
      %a{:href => "#"} 
        Что сделать ?
    %div 
      %ul      
        %li Профосмотры
        %li= link_to "Лаб. анализы",client_lab_tests_path(@client)
        %li= link_to "Диагностика",client_diagnostic_tests_path(@client) 
        %li= link_to "Госпитализации",client_hospitalizations_path(@client) 
        %li= link_to "ВТМП",client_htm_help_notes_path(@client) 
        %li= link_to "СКЛ",client_sanatorium_notes_path(@client) 
        %li= link_to "Леч. диагн. работа",client_med_diagnostic_tests_path(@client)
  %h3
    %a{:href => "#"} 
      Разделы
  %div 
    %ul      
      %li= link_to "Пациенты",clients_path
      %li= link_to "Страховые компании",ins_companies_path

  %h3
    %a{:href => "#"} 
      Справочники
  %div 
    %ul      
      %li= link_to "Типы анализов",lab_test_types_path
      %li= link_to "Типы диагностики",diagnostic_test_types_path
      %li= link_to "Типы Л. диагностики",med_diagnostic_test_types_path
      %li= link_to "Типы госпитализации",hospitalization_types_path
      %li= link_to "Типы ВТМП",htm_help_types_path
