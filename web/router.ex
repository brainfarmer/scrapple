defmodule Scrapple.Router do
  use Phoenix.Router

  get "/", Scrapple.PageController, :index, as: :pages

end
