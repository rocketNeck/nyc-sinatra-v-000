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

  get '/figures/:slug' do
    @figure = Figure.find_by_slug(params[:slug])
    erb :'figures/show'
  end

  # post "/figures" do
  #   @figure = Figure.create(name: params["Name"]).landmarks << Landmark.find_or_create_by(name: "The coolest")
  #   @figure.titles << Titles.find_or_create_by(name: params[:titles])
  #   erb :'figures/show', locals: {message: "Created new Figure."}
  # end

end
