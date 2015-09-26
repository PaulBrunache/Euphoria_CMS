class Post < ActiveRecord::Base
    validates_presence_of :name, presence: true
    belongs_to :user
    has_one :category
end
