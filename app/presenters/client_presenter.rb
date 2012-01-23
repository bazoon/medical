class ClientPresenter < BasePresenter


def prepare(client)
  @client = client
end


def prof_inspections_info
 doctors = ""
 @client.prof_inspections_info.each {|name| doctors += @template.content_tag(:span,name,:class => "label") }
 doctors
end

end
