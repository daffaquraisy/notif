<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post('/register', 'AuthController@register');
$router->post('/register_orangtua', 'AuthController@registerOrangTua');
$router->post('/login', 'AuthController@login');
$router->post('/login_orangtua', 'AuthController@loginOrangTua');

$router->get('/guru', 'TeachersController@index');
$router->get('/guru/{id}', 'TeachersController@show');
$router->post('/guru', 'TeachersController@store');

$router->get('/absen', 'PresensiController@index');
$router->get('/absen/kelas1', 'PresensiController@kelas1');
$router->get('/absen/kelas2', 'PresensiController@kelas2');
$router->get('/absen/kelas3', 'PresensiController@kelas3');
$router->get('/absen/kelas4', 'PresensiController@kelas4');
$router->get('/absen/{id}', 'PresensiController@show');
$router->post('/absen', 'PresensiController@store');

$router->get('/kelas', 'KelasController@index');
$router->get('/kelas/jam1', 'KelasController@kbmJam1');
$router->get('/kelas/jam2', 'KelasController@kbmJam2');
$router->get('/kelas/jam3', 'KelasController@kbmJam3');
$router->get('/kelas/jam4', 'KelasController@kbmJam4');
// $router->get('/kelas/{id}', 'KelasController@show');
$router->post('/kelas', 'KelasController@store');

$router->get('/key', function () {
    return str_random(32);
});
