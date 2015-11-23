json.todos do
  json.id @todo.id
  json.user_id @todo.user_id
  json.description @todo.description
  json.due_date @todo.due_date
end
