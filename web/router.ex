defmodule Scrapple.Router do
  use Phoenix.Router

  scope "/" do
    #Use the default browser stack.
    pipe_through :browser
    
    get "/", Scrapple.PageController, :index, as: :home
  end

  scope "/docs" do
    # May want our own custom stack here
    pipe_through :browser

    get "/:doc", Scrapple.DocumentController, :index, as: :docs
    get "/:doc/*path", Scrapple.DocumentController, :show, as: :page
  end
end
