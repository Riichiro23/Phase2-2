class FavoritesController < ApplicationController
  def create
    # books#indexページ(books/_index.html.erb)のいいねリンクから送信されたルーティングのURL(/books/:book_id/favorites)
    # の値を受け取ってBookモデルによって、いいねされた投稿のidを取得
    # いいねリンクのfavorite#createアクションへのパス（book_favorites_path(book)）の中で、引数を「book」とすることで「book.id」がルーティングの「book_id」に渡されparams で受け取ることができる
    book = Book.find(params[:book_id]) 
    favorite = current_user.favorites.new(book_id: book.id)  # favoritesテーブルの,book_id(外部キー)カラムの中で、いいねされたbook.idを参照してfavoriteに代入
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id) # favoritesテーブルの,一つのレコード(book_id(外部キー)カラムの、いいねされたbook.idに対応するレコード)を削除
    favorite.destroy
    redirect_to request.referer
  end
end




  