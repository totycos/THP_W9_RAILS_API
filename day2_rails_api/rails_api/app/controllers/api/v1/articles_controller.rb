# app/controllers/api/v1/articles_controller.rb
class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /api/v1/articles
  def index
    @articles = Article.all
    render json: @articles
  end

  # GET /api/v1/articles/1
  def show
    render json: @article
  end

  # POST /api/v1/articles
  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      render json: @article, status: :created, location: api_v1_article_url(@article)
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/articles/1
  def update
    if current_user == @article.user
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    else
      render json: { message: "Tu n'as pas l'autorisation de modifier cet article." }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    if current_user == @article.user
      @article.destroy!
    else
      render json: { message: "Tu n'as pas l'autorisation de supprimer cet article." }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
