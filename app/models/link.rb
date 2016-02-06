class Link < ActiveRecord::Base
  validates :target_url, presence: true

  belongs_to :user
  has_many :visits

  def visit_count
    visits.count
  end

end
