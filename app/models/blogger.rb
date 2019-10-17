class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def my_posts
        self.posts
    end

    def my_posts_likes
        self.my_posts.map{|post| post.likes}
    end

    def total_likes
        my_posts_likes.inject{|sum, n| sum + n}
    end

    def featured_post
        my_posts.max_by do |post|
            post.likes
        end
    end


end
