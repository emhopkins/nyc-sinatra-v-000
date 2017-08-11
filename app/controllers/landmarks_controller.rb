class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index' 
  end

  get '/landmarks/new' do 
    @landmarks = Landmark.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    # if !params["landmark"]["name"].empty?
    #   @landmark.landmarks << Landmark.find_or_create_by(name: params["landmark"]["name"])
    # end
    # if !params["title"]["name"].empty?
    #   @landmark.titles << Title.find_or_create_by(name: params["title"]["name"])
    # end
    @landmark.save
    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    # if !params["landmark"]["name"].empty?
    #   @landmark.landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
    # end
    redirect to "landmarks/#{@landmark.id}"
  end
end