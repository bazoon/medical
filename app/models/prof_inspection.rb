class ProfInspection < ActiveRecord::Base
  belongs_to :client, :counter_cache => true
  belongs_to :user
  has_many :diagnoses
  validates :actual_date,:user_id,:client_id, :presence =>true

  def stat_card_given
    if stat_card
     h.content_tag(:span,"",class: "ui-icon ui-icon-check")     
    else

    end

  end

end
