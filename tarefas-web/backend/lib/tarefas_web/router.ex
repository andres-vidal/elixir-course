defmodule TarefasWeb.Router do
  use TarefasWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TarefasWeb do
    pipe_through(:api)

    get "/tarefas", ControladorTarefas, :listar

    post "/tarefas", ControladorTarefas, :inserir

    post  "/tarefas/:origem/mover-a/:destino", ControladorTarefas, :mover

    delete "/tarefas/:posicao", ControladorTarefas, :remover

    post "/tarefas/completadas/:posicao", ControladorTarefas, :completar

    delete "/tarefas/completadas/:posicao", ControladorTarefas, :reiniciar

  end
end
