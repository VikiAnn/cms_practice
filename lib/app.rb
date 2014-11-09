require 'sinatra'
require './lib/app/models/page'

class CMS < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/' do
    redirect '/pages/'
  end

  get '/pages/:slug' do |slug|
    page = Page.find_by_slug(slug)
    erb :page, :locals => {:page => page}
  end

  get '/pages/:slug/edit' do |slug|
    page = Page.find_by_slug(slug)
    erb :edit, :locals => {:page => page}
  end

  put '/pages/:slug' do
    slug = params[:slug]
    Page.update(slug, params[:page])
    redirect '/pages'
  end

  get '/pages' do
    pages = Page.all
    erb :pages, :locals => {:pages => pages}
  end
end
