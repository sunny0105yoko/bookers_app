class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
    @books = Book.all  
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    @books = Book.all  
    render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    if book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'# 一覧画面へリダイレクト  
    end
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
