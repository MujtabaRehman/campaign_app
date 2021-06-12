class Novice < User
    has_many :discussion_topics, as: :topics   
end
