class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait

  def is_clickbait
    clickbait_stuff = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    clickbaity = clickbait_stuff.any? { |phrase| phrase.match title }
    if !clickbaity
      errors.add(:title, "Not clickbaity")
    end
  end

end
