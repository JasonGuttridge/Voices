class Message < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :follows, dependent: :destroy
    has_many :users, through: :follows
    validates :content, presence: true
end
