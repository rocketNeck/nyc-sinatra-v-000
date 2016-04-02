class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get'/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_slug(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(params[:figure][:landmark_ids])# unless params[:landmark][:name].empty?
    @figure.title << Titles.find_or_create_by(params[:figure][:title_ids])# unless params[:title][:name].empty?
    @figure.save
    redirect :'/figures/#{@figure.id}'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figure/edit'
  end

  # patch '/figure/:id' do
  #   @figure = Figure.find(params[:id])
  #   @figure.update(params[:figure])
  #   @figure.titles.update(params[:titles])
  #   @figure.landmarks.update(params[:landmarks])
  # end
end
