class TodosController < ApplicationController

helper_method :current_user

skip_before_action :verify_authenticity_token, only: :destroy

  def index

    @todos = current_user.todos

  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save

    else
      render json:{
        error: {
          message: @todo.errors.full_messages.to_sentence
        }
      }
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    render json:{
      GuessWhat: {
        message: 'it was destroyed'
      }
    }

  end

  private

  def todo_params
    params.require(:todo).permit(:id, :description, :due_date)
  end

end
