defmodule Scrapple.Router do
  use Phoenix.Router

  get "/", Scrapple.PageController, :index, as: :pages
  get "/markdown/:md", Scrapple.MarkdownController, :show

end
