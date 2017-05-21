class Post < ActiveRecord::Base
    #권한설정
    resourcify
    include Authority::Abilities
    
    belongs_to :user
    
    #validate
    validates :title,
            presence: true
    validates :content,
            presence: true
    
end
