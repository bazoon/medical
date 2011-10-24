%ul
  %li
    %h2 Искать
    %div
      =render :partial => "clients/search_form"
  -unless @client.nil? or @client.id.nil?
    %li
      %h2 
        Что сделать ?
      %ul      
        %li= link_to "Профосмотры",client_prof_inspections_path(@client), :class => "#{"active" if request.path=~/prof_inspections/}"
        %li= link_to "Лаб. анализы",client_lab_tests_path(@client), :class => "#{"active" if request.path=~/lab_tests/}"
        %li= link_to "Диагностика",client_diagnostic_tests_path(@client) , :class => "#{"active" if request.path=~/\/diagnostic_tests/}"
        %li= link_to "Госпитализации",client_hospitalizations_path(@client) , :class => "#{"active" if request.path=~/hospitalizations/}"
        %li= link_to "ВТМП",client_htm_help_notes_path(@client) , :class => "#{"active" if request.path=~/htm_help_notes/}"
        %li= link_to "СКЛ",client_sanatorium_notes_path(@client) , :class => "#{"active" if request.path=~/sanatorium_notes/}"
        %li= link_to "Леч. диагн. работа",client_med_diagnostic_tests_path(@client), :class => "#{"active" if request.path=~/med_diagnostic_tests/}"
        %li= link_to "Льготы",client_benefits_path(@client), :class => "#{"active" if request.path=~/benefit/}"
        %li= link_to "МКБ 10",client_mkbs_path(@client), :class => "#{"active" if request.path=~/mkb/}"
  %li
    %h2 
      Разделы
    %ul      
      %li= link_to "Пациенты",clients_path
      %li= link_to "Врачи",users_path
    =render_navigation(:expand_all => true)
