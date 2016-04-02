class Landmark <ActiveRecord::Base
  belongs_to :figure
  def slug
    name.downcase.gsub(" ", "-")
  end
  def self.find_by_slug(slug)
    Landmark.find_each {|figure| figure.slug == slug}
  end
end
