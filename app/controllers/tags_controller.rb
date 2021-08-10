class TagsController < ApplicationController
  
  def show    
    @tags = Tag.find_by(name: params[:id])
    @posts = @tags.posts 
  end
      
end


