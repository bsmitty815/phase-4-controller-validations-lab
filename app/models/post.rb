class Post < ApplicationRecord

    # is expected to validate that :title cannot be empty/falsy
    validates :title, presence: true

    # is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"›
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    # is expected to validate that the length of :content is at least 100
    validates :content, length: { minimum: 100 }
    
end
