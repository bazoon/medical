class Ref::BenefitCategory < ActiveRecord::Base
  has_many :users


def can_be_deleted
  true
end

def source_string
  case source 
    when 1 
      I18n.t(:federal)
    when 2 
      I18n.t(:regional)
  end
end


end
