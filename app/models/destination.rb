class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def my_posts
        self.posts
    end

    def last_five_posts
        my_posts.map{|post|post}.pop(5)
    end

    def featured_post
        my_posts.max_by do |post|
            post.likes
        end
    end

    def average_age_bloggers
        self.bloggers.map{|blogger|blogger.age}.uniq.inject{|sum, n| sum + n}/self.bloggers.count
    end



end
