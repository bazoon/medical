class MseCalendarController < ApplicationController


def show
  

end


def events

  


  ev1={:id=>1,:title=>"Event1",:start =>"2011-11-20",:end => "2011-11-21",:url => "ya.ru"}
  ev2={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev22={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev21={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev22={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev23={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev24={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev25={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev26={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev27={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev28={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev29={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev30={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev31={:id=>2,:title=>"Event2",:start =>"2011-11-24",:end => "2011-11-24",:url => "ya.ru"}
  ev3={:id=>3,:title=>"Event3",:start =>"2011-11-26",:end => "2011-11-28",:url => "ya.ru"}

  events=[ev1,ev2,ev3,ev21,ev22,ev23,ev24,ev25,ev26,ev27,ev28,ev29,ev30,ev31]

  render json: events
end  

end
