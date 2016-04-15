class TodosController < ApplicationController
    before_action :authenticate_user!
  
  def new
    @todo = Todo.new
  end

  def index
    @todos = current_user.todos.sorted
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save
      redirect_to todos_path, notice: 'Success! You have just written a new todo!'
    else
      render :new
    end
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      flash.notice = "Your todo has just been updated!"
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    flash.notice = "Your todo has just been trashed!"
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:body, :complete)
    end
    
end
