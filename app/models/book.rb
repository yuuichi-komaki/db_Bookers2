class Book < ApplicationRecord

	 belongs_to :user
	 has_many :favorites, dependent: :destroy
	 has_many :book_comments, dependent: :destroy

	 validates :title, presence: true
	 validates :body, presence: true, length: {maximum: 200}

 def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
 end
 
 def self.looks(searche, word)
   if searche == "forward_match"
     @books = Book.where("title LIKE?", "#{word}%")
   elsif searche == "backward_match"
     @books = Book.where("title LIKE?", "%#{word}")
   elsif searche == "perfect_match"
     @books = Book.where("title LIKE?", "#{word}")
   elsif searche == "partial_match"
     @books = Book.where("title LIKE?", "%#{word}%")
   end
 end
 
end
