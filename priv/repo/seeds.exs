# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dashboard.Repo.insert!(%Dashboard.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Dashboard.User
alias Dashboard.Repo
alias Faker.Name

for _ <- 1..50 do
  Repo.insert! %User{
    first_name: Name.first_name(),
    last_name: Name.last_name(),
  }
end
