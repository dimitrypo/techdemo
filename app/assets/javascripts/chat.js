//= require angular/angular.min

var app = angular.module('simple-chat', [])

// to show newest messages first
app.filter('reverse', function() {
  return function(items) {
    return items.slice().reverse();
  };
});

app.controller('ChatCtrl', ['$scope', '$http',
  function($scope, $http){
  $scope.messages = []

  $scope.refresh_messages = function(){
    $http.get('/chats.json').then(function(response){
      $scope.messages = response.data 
    })
  }
  
  setInterval(function(){$scope.refresh_messages()},3000)

  $scope.refresh_messages()
  
  $scope.AddMessage = function(){

    if(!$scope.messagetext || $scope.messagetext === '' || !$scope.user_name || $scope.user_name === '') { return; }

    $scope.messages.push({user_name: $scope.user_name, message: $scope.messagetext});

    $http.post("/chats.json", {'user_name' : $scope.user_name, 'message' : $scope.messagetext}).then(function(data){})

    $scope.messagetext = ''
  };

}]);