class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, reject_if: :all_blank
  
  validates :title, presence: true
  validates :body, presence: true

  before_save :format_title

  private

  def format_title
    self.title = title.strip.titleize if title.present?
  end
end
