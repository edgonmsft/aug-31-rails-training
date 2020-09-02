class Movie < ApplicationRecord
  # validates :title, presence: true
  validates_presence_of :title

  def self.by_title
    pluck(:title)
  end

  def self.most_to_least_fb_likes
    order(facebook_likes:  :desc)
  end

  def self.year_by_title(title)
    find_by_title(title)&.year 
  end

  def self.more_fb_likes_than(amount)
    where("facebook_likes > ?", amount)
  end
end
