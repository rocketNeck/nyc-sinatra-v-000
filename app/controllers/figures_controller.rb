class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get'/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb:'fugures/new'
  end


end
