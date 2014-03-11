var app = angular.module('app', ['ux']);

app.controller('sample', function ($http,$scope,$q) {
    var i = 0, records = 3;
    $scope.items = [];
   


    while (i < records) {
        app.getData($routeParams.dataID).then(function(data) {
        // request was successful
        $scope.data = data;        
    }, function() {
        // request failed (same as your 'return false')
        $scope.data = undefined;
    });
        $scope.items.push({id: i});
        i += 1;
    }
});
getData:function(dataID) {
    var deferred = $q.defer();
    if(myData.name) {
       deferred.resolve(myData);
    } else if (dataID && dataID !== '') {
        $http.get('http://lorempixel.com/800/1000/sports/' + dataID + '/')
            .success(function(data) {
                 myData = data.object;
                 $cookies.dataID = data.object.id;
                 deferred.resolve(myData);
                 // update angular's scopes
                 $rootScope.$$phase || $rootScope.$apply();
             });
    } else { 
       deferred.reject();
    }

    return deferred.promise;
}