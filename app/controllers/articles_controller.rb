class ArticlesController < ProtectedController

  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    if current_user.admin
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  else
    render json: "Access Denied", status: 401
  end
end

  # PATCH/PUT /articles/1
  def update
    if current_user.admin
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    else
      render json: "Access Denied", status: 401
    end
  end

  # DELETE /articles/1
  def destroy
    if current_user.admin
      @article.destroy
    else
      render json: "Access Denied", status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
