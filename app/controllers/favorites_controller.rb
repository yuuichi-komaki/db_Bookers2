class FavoritesController < ApplicationController
 
 before_action :book_params
 
 def create
  # どちらでも作動する
  # favorite = @book.favorites.new(user_id: current_user.id)
  favorite = current_user.favorites.new(book_id: @book.id)
  favorite.save
 end

 def destroy
  # どちらでも作動する
  # favorite = @book.favorites.find_by(user_id: current_user.id)
  favorite = current_user.favorites.find_by(book_id: @book)
  favorite.destroy
 end


  def book_params
   @book = Book.find(params[:book_id])
  end



end
