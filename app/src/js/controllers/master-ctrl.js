/**
 * Master Controller
 */

angular.module('RDash')
    .controller('MasterCtrl', MasterCtrl);

MasterCtrl.$inject = [
    '$scope',
    '$cookieStore',
    '$state',
    '$rootScope'
];

function MasterCtrl(
    $scope,
    $cookieStore,
    $state,
    $rootScope
) {
    /**
     * Sidebar Toggle & Cookie Control
     */
    var mobileView = 992;

    $scope.getWidth = function() {
        return window.innerWidth;
    };

    $scope.$watch($scope.getWidth, function(newValue, oldValue) {
        if (newValue >= mobileView) {
            if (angular.isDefined($cookieStore.get('toggle'))) {
                $scope.toggle = ! $cookieStore.get('toggle') ? false : true;
            } else {
                $scope.toggle = true;
            }
        } else {
            $scope.toggle = false;
        }

    });

    $scope.toggleSidebar = function() {
        $scope.toggle = !$scope.toggle;
        $cookieStore.put('toggle', $scope.toggle);
    };

    window.onresize = function() {
        $scope.$apply();
    };

    $rootScope.$broadcast('app.MasterCtrl.init');
}