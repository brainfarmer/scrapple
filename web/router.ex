defmodule Scrapple.Router do
  use Phoenix.Router

  get "/", Scrapple.PageController, :index, as: :pages
  get "/markdown/:page", Scrapple.MarkdownController, :show

end
