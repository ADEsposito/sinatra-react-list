class ItemController < ApplicationController

  options "*" do
    # allow these types of http requests to happen on the server
    response.headers["Allow"] = "HEAD,GET,POST,PUT,PATCH,DELETE,OPTIONS"

    # Needed for AngularJS
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    response['Access-Control-Allow-Origin'] = '*'

    "cool"
  end

  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    # sets header saying that the content type is JSON; better than parsing the string
    content_type :json

    @items = Item.all
    @items.to_json
  end

  get '/:id' do
    # sets header saying that the content type is JSON; better than parsing the string
    content_type :json

    id = params[:id]
    @item = Item.find(id)
    @item.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    # sets header saying that the content type is JSON; better than parsing the string
    content_type :json

    @item = Item.new
    @item.title = params[:title]
    @item.save

    @items = Item.all
    @items.to_json
  end

  patch'/:id' do
    # sets header saying that the content type is JSON; better than parsing the string
    content_type :json

    id = params[:id]
    @item = Item.find(id)

    @item.title = params[:title]

    @item.save

    @items = Item.all
    @items.to_json
  end

  delete '/:id' do
    # sets header saying that the content type is JSON; better than parsing the string
    content_type :json

    id = params[:id]

    @item = Item.find(id)
    @item.destroy

    @items = Item.all
    @items.to_json
  end
end
