defmodule Dashboard.UserView do
  use Dashboard.Web, :view
  alias Dashboard.{Endpoint, User}

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Dashboard.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Dashboard.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      full_name: User.full_name(user),
      url: user_url(Endpoint, :show, user.id)}
  end
end
