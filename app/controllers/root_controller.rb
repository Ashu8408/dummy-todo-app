class RootController < ApplicationController
  def index
    p "----------index in server----------"


    # if i want to hit about page i can render it
    # render "about"
    @posts = Post.all
    render "index"
  end

  def about
    p "----------about in server----------"
    render "about"
  end

  def contact
    p "----------contact in server----------"
     # redirect_to("/about")
     render "contact"
  end

  def api
    @response = {
      status: 200,
      message: "Hello HealthGraph"
    }

    render json: @response

=begin
other methods to pass response:-
    render status: @response
    render html: @response
    render body: @response
    render html: @response
    render xml: @response
    render json: @response
    render plain: @response
    render text: @response
=end
  end

  def user
    render json: params
    # or     render json: params[:id]
    # or     render json: params[:name]
  end

  def add
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]
    @post.save

    @response = {
      status: 200,
      message: "saved successfully"
    }

    @posts = Post.all
    render "index"
  end


  def delete
    @post = Post.find(params[:id])
    @post.destroy

    @posts = Post.all
    render "index"
  end

  def search
    @query = params[:query]
    @posts = Post.where("posts.title LIKE ?", [ "%#{@query}%" ])
    render "index"
  end
end
