json.user current_user.email

json.todos(@todos) do |t|
  json.id t.id
  json.description t.description
  json.due_date t.due_date
end
