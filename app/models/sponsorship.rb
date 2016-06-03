class Sponsorship < ActiveRecord::Base

  # validates :sponsorship_type, presence: true

  belongs_to :signup

end
