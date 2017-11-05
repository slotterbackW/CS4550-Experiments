defmodule ReduxSocketWeb.APIChannel do
  use ReduxSocketWeb, :channel
  alias ReduxSocket.API
  alias ReduxSocketWeb.TaskView

  def join("tasks", payload, socket) do
    if authorized?(payload) do
      tasks = API.list_tasks()
      {:ok, %{tasks: TaskView.render("index.json", tasks: tasks)}, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("new:task", payload, socket) do
    {:ok, created} = API.create_task(payload)
    created_json = TaskView.render("task.json", task: created)
    broadcast! socket, "new:task", created_json
    {:reply, {:ok, created_json}, socket}
  end

  def handle_in("delete:task", payload, socket) do
    task = API.get_task!(payload["id"])
    API.delete_task(task)
    broadcast! socket, "delete:task", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
