module PostsHelper

  def post_link(position)
    link_to("#{position.to_s.capitalize} Post", post_url(@post.post(position).id)) if @post.post(position)
  end


end
