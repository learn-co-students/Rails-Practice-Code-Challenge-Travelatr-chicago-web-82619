class BloggersController < ApplicationController
  before_action :find_blogger, only: [:show, :edit, :update, :destroy]
  def index
    @bloggers = Blogger.all
  end

  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    @blogger.save
    redirect_to @blogger
  end

  def edit
  end

  def update
    @blogger.update_attributes(blogger_params)
    p @blogger.errors.full_messages
    puts "***********************************"

    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to edit_blogger_path(@blogger)
    end
  end

  def destroy
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end

  def find_blogger
    @blogger = Blogger.find_by(id: params[:id])
  end

end
