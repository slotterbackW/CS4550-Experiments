defmodule ReduxSocket.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :label, :string

      timestamps()
    end

  end
end
