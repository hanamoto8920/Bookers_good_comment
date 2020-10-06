class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @new = Book.new
    @book_comment = BookComment.new
    @book_comment_new = current_user.book_comments.new(book_comment_params)
    @book_comment_new.book_id = @book.id
    @user = current_user

   @book_comment_new.save

  end


  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_to request.referrer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
