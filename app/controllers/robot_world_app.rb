class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    @average_age = RobotWorld.average_age
    erb :dashboard
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots/new' do
    RobotWorld.create(params[:robot])
    redirect '/robots'
  end

  get '/robots' do
    @robots = RobotWorld.all
    erb :index
  end

  get '/robots/:id' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    RobotWorld.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotWorld.destroy(id.to_i)
    redirect '/robots'
  end

end
