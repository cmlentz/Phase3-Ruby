class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

  # fish routes
    # index
    if req.path == ('/single_fish') && req.get?
      return [200, {'Content-Type' => 'application/json'}, [SingleFish.all.to_json]]
    end
    # create
    if req.path == ('/single_fish') && req.post?
      body = JSON.parse(req.body.read)
      single_fish = SingleFish.create(body)
      return [201, {'Content-Type' => 'application/json'}, [single_fish.to_json]] 
    end
    # show
    if req.path.match('/single_fish/') && req.get?
      id = req.path.split('/')[2]
      begin
        single_fish = SingleFish.find(id)
        return [200, {'Content-Type' => 'application/json'}, [single_fish.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Could not find requested fish"}.to_json]]
      end
    end
    # update
    if req.path.match('/single_fish/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        single_fish = SingleFish.find(id)
        single_fish.update(body)
        return [202, {'Content-Type' => 'application/json'}, [single_fish.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Fish not found."}.to_json]]
      end
    end
    # delete
    if req.path.match('/single_fish/') && req.delete?
      id = req.path.split('/')[2]
      begin
        single_fish = SingleFish.find(id)
        single_fish.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Fish deleted!"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Fish not found."}.to_json]]
      end
    end

  # river routes
    # index
    if req.path == ('/rivers') && req.get?
      return [200, {'Content-Type' => 'application/json'}, [River.all.to_json]]
    end
    # create
    if req.path == ('/rivers') && req.post?
      body = JSON.parse(req.body.read)
      river = River.create(body)
      return [201, {'Content-Type' => 'application/json'}, [river.to_json]] 
    end
    # show
    if req.path.match('/rivers/') && req.get?
      id = req.path.split('/')[2]
      begin
        river = River.find(id)
        return [200, {'Content-Type' => 'application/json'}, [river.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "River not found."}.to_json]]
      end
    end
    # update
    if req.path.match('/rivers/') && req.patch?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        river = River.find(id)
        river.update(body)
        return [202, {'Content-Type' => 'application/json'}, [river.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "River not found."}.to_json]]
      end
    end
    # delete
    if req.path.match('/rivers/') && req.delete?
      id = req.path.split('/')[2]
      begin
        river = River.find(id)
        river.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "River deleted!"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "River not found."}.to_json]]
      end
    end

  # default test route
    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
