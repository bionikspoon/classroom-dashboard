defmodule Dashboard.UserView do
  use Dashboard.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Dashboard.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Dashboard.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name}
  end
end
