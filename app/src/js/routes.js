(function() {
    'use strict';

    angular
        .module('RDash')
        .config(config)
        .factory('auth', auth)
        .run(run);

    config.$inject = [
        '$stateProvider',
        '$urlRouterProvider'
    ];

    run.$inject = [
        '$transitions',
        '$state',
        'auth'
    ];

    function config(
        $stateProvider,
        $urlRouterProvider
    ) {
        // For unmatched routes
        $urlRouterProvider.otherwise('/');

        // Application routes
        $stateProvider


                .state('dashboard', {
                    url: '/',
                    templateUrl: 'templates/dashboard.html'
                 })
                .state('tables', {
                    url: '/tables',
                    templateUrl: 'templates/tables.html'
                })
            .state('login', {
                url: '/login',
                templateUrl: 'templates/login.html'
            });
    }

    function auth() {
        return {
            isAuthorized: isAuthorized
        };

        function isAuthorized() {
            return window.web3.eth.accounts.length > 0;
        }
    }

    function run(
        $transitions,
        $state,
        auth
    ) {
        $transitions.onStart( { to: '*' }, checkAuthorization);

        function checkAuthorization() {
            if (!auth.isAuthorized() && !$state.is('/login')) $state.go('login');
        }
    }

})();
