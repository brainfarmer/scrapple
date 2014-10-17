defmodule Scrapple.Router do
  use Phoenix.Router

  get "/", Scrapple.PageController, :index, as: :home
  get "/docs/:doc", Scrapple.DocumentController, :index, as: :docs
  get "/docs/:doc/*path", Scrapple.DocumentController, :show, as: :page

end
