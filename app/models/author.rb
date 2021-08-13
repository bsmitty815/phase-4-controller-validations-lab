class Author < ApplicationRecord

    # is expected to validate that :name cannot be empty/falsy
    validates :name, presence: true
    # is expected to validate that :email is case-sensitively unique
    validates :email, uniqueness: true
    
end
