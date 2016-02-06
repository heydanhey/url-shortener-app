class Link < ActiveRecord::Base
  validates :target_url, presence: true

  belongs_to :user
  has_many :visits

  def visit_count
    visits.count
  end

  def get_slug
    [*('a'..'z'), *('0'..'9')].shuffle[0,6].join
  end

end
