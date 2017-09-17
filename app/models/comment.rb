class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  #has_many :notifications, dependent: :destroy
end
