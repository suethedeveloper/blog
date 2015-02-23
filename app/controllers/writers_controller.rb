class WritersController < ApplicationController
  def index
    @writers = Writer.all
  end

  def new
    @writer = Writer.new
  end

  # def upload
  #   uploaded_io = params[:name][:picture]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  def create
      # file = params[:photo]
      # binding.pry
      # File.open(Rails.root.join('app','assets', 'images', file.original_filename), 'wb') do |f|
      #   f.write(file.read)
      # end    
    @writer = Writer.new writer_params
    # uploaded_io = params[:photo]
    # binding.pry
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end    

    if @writer.save
      flash[:notice] = 'New Writer Has Created!'
      redirect_to writers_path
    else 
      render action: 'new'
    end     
  end

  # def create
  #   @writer = Writer.new writer_params
  #   if @writer.save
  #     redirect_to writers_path
  #   else 
  #     render :new
  #   end     
  # end

  def show
    @writer = Writer.find params[:id]
  end

  def edit
    @writer = Writer.find params[:id]
  end

  def update
    @writer = Writer.find params[:id]
    if @writer.update_attributes writer_params
      redirect_to writer_path(@writer)
    else 
      render :edit_writer_path
    end     
  end

  def destroy
    @writer = Writer.find params[:id]
    @writer.destroy
    redirect_to writers_path    
  end

  private 
  def writer_params
    params.require(:writer).permit(:first_name, :last_name, :age)
    # , posts_attributes: [:photo]
  end

end
