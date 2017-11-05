defmodule ReduxSocket.API.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias ReduxSocket.API.Task


  schema "tasks" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
