class Adventure < ActiveRecord::Base
  belongs_to :user
  validates :image_url, :city, :country, :date, presence: true
end