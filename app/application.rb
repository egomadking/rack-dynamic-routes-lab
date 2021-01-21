class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end



# def call(env)
#   resp = Rack::Response.new
#   num_1 = Kernel.rand(1..20)
#   resp.write "#{num_1}\n"
#   if num_1 == 20
#     resp.write "You Win"
#   else
#     resp.write "You Lose"
#   end
#   resp.finish
# end