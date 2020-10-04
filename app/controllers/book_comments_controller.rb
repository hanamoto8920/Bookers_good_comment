class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @new = Book.new
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @user = current_user
    
    if @book_comment.save
    redirect_to book_path(@book.id), notice: "Nice Comment!!."
    else
      render "books/show"
    end
  end


  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referrer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
