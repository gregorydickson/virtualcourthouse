var app = angular.module('app', ['ux'])
    .service('myService', ['$cookies', '$http', function($cookies, $http) {
            myData = {};

            return {
                getData:function(dataID) {
                    if(myData.name) {return myData);
                    else if (dataID && dataID !== '') {
                        $http.get('http://lorempixel.com/800/1000/sports/' + dataID + '/')
                            .success(function(data) {
                                myData = data.object;
                                deferred.resolve(myData);
                                // update angular's scopes
                                $rootScope.$$phase || $rootScope.$apply();
                            }
                    }
                    else { return false; }
                }
            }
    }]);
    .controller('sample', function ($http,$scope,$q) {
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
