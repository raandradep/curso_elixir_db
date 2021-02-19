defmodule Tarea.Mensaje do
import CursoElixirDb.HelperAccounts
  def send() do
    create_accounts(%{type_document: "CC", num_document: "14456542", email: "pepito@email.com", name_company: "Company sas", name: " Pepito", last_name: "Perez"})
    #IO.puts("#{msg} #{time}")
  end



end
