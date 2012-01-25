class RefPresenter < BasePresenter

def prepare(items,title,notice,paginate = true)
 @items = items
 @title = title
 @notice = notice
 @paginate = paginate
end

def header
 content = index_header + flash_message 
 content += paginate_items if @paginate
 content
end

def table_or_empty(&block)
 if not @items.nil? and @items.count > 0 
   content=""
   yield
 else
   content = content_tag(:span,I18n.t(:no_records),:class => "label success") 
 end
 content
end  

private

def flash_message
 unless flash.empty?
  content = link_to('x','',:class => "close") + @notice
  content_tag(:div,content,:class => "alert-message info",'data-alert' => "alert") 
 end
end

def index_header
 content = content_tag(:br) 
 content = content + content_tag(:h2,@title) + content_tag(:br)
end


def paginate_items
 paginate @items if not @items.nil? and @items.respond_to?(:current_page)
end

end
