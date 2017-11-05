defmodule ReduxSocket.APITest do
  use ReduxSocket.DataCase

  alias ReduxSocket.API

  describe "tasks" do
    alias ReduxSocket.API.Task

    @valid_attrs %{label: "some label"}
    @update_attrs %{label: "some updated label"}
    @invalid_attrs %{label: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert API.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert API.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = API.create_task(@valid_attrs)
      assert task.label == "some label"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = API.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.label == "some updated label"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_task(task, @invalid_attrs)
      assert task == API.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = API.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> API.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = API.change_task(task)
    end
  end
end
