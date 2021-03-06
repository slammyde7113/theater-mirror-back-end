class CommentsController < ProtectedController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all
    puts Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id

      if @comment.save
        render json: @comment, status: :created, location: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /comments/1
  def update
    if current_user.admin
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    elsif (current_user.member) && (current_user.id == @comment.user_id)
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    else
      render json: "Access Denied", status: 401
    end
  end

  # DELETE /comments/1
  def destroy
    if (current_user.admin || current_user.member) && (current_user.id == @comment.user_id)
      @comment.destroy
    else
      render json: "Access Denied", status: 401
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:date_created, :user_id, :article_id, :title, :body)
    end
end
