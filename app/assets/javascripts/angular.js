var app = angular.module('TodoApp', []);

app.controller('todoController', ['$http', function ($http) {
  var authenticity_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  var controller = this;

  this.getTodos = function () {
    $http.get('/todos').success(function(data) {
      controller.todos = data.todos;
    })};

    this.getTodos();


  this.createTodo = function () {

    $http.post('/todos', {
      authenticity_token: authenticity_token,
      todo: {
        description: this.todos.newDescription,
        due_date: this.todos.newDate
      }
    }).success(function(response){
      controller.getTodos();
    }).error(function(err){
      console.log(err);
    })};


  this.deleteTodo = function(todo) {

    $http.delete('/todos/' + todo.id, {
      authenticity_token: authenticity_token,
    }).success(function (data) {
      console.log(todo);
      controller.getTodos();
    }).error(function(data, status) {
      console.log(status);
    });


  }

  this.updateTodo = function(todo) {
    $http.patch('/todos/' + todo.id, {
      authenticity_token: authenticity_token,
      todo: {
        description: todo.description,
        due_date: todo.due_date
      }

    }).success(function (data) {
      console.log(data);
    }).error(function(err) {
      console.log(err)
    })

  }

}]);


app.controller('SessionController', ['$http', '$window',
function($http, $window) {
  var controller = this;

  this.deleteSession = function () {
    $http.delete('/session', {
    }).success(function(data){
      $window.location.href = "/";
    })
  }
}])
