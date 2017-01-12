class Normal::BlogsController < NormalController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.index_all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to normal_blog_url(@blog), notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to normal_blog_url(@blog), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to normal_blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :image, :image_cache)
  end
end
