 class ArticlesController < ApplicationController
   before_filter :authorize, only: [:new]
      def index
        @articles = Article.order(updated_at: :desc).limit(25)
      end

      def show
        @article = Article.find(params[:id])
      end

      def new
        @article = Article.new
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          redirect_to @article
        else
          render "new"
        end
      end
   
      def edit
         @article = Article.find(params[:id])
      end
   
   def update
     @article = Article.find(params[:id])
     if @article.update(article_params)
       redirect_to @article
     else
       render "edit"
     end
   end
   
   def destroy
     @article = Article.find(params[:id])
     Article.destroy(@article)
     redirect_to :action=> "index"
   end
   
     private
    def article_params
      params.require(:article).permit(:title, :content, :category_ids => [])
    end
end