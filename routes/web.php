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

$router->get('/siswa', 'SiswaController@index');
$router->post('/siswa', 'SiswaController@store');

$router->get('/absen', 'PresensiController@index');
$router->get('/absen/kelas1', 'PresensiController@kelas1');
$router->get('/absen/kelas1/{id}', 'PresensiController@getKelas1');
$router->get('/absen/kelas2', 'PresensiController@kelas2');
$router->get('/absen/kelas2/{id}', 'PresensiController@getKelas2');
$router->get('/absen/kelas3', 'PresensiController@kelas3');
$router->get('/absen/kelas3/{id}', 'PresensiController@getKelas3');
$router->get('/absen/kelas4', 'PresensiController@kelas4');
$router->get('/absen/kelas4/{id}', 'PresensiController@getKelas4');
$router->get('/absen/{id}', 'PresensiController@show');
$router->post('/absen', 'PresensiController@store');
$router->get('search/absen', 'PresensiController@apiSearch');

$router->post('/kbm', 'KbmController@store');
$router->post('/kelas', 'KelasController@store');
$router->get('/kelas/tugas', 'KelasController@getTugas');
$router->post('/pelajaran', 'PelajaranController@store');
$router->post('/tugas', 'CatetanController@store');

$router->get('/jadwal/sepuluh_mm', 'JadwalController@getXMM');
$router->get('/jadwal/sepuluh_tkj', 'JadwalController@getXTKJ');
$router->get('/jadwal/sepuluh_rpl', 'JadwalController@getXRPL');

$router->get('/jadwal/sebelas_mm', 'JadwalController@getXIMM');
$router->get('/jadwal/sebelas_tkj', 'JadwalController@getXITKJ');
$router->get('/jadwal/sebelas_rpl', 'JadwalController@getXIRPL');

$router->get('/jadwal/duabelas_mm', 'JadwalController@getXIIMM');
$router->get('/jadwal/duabelas_tkj', 'JadwalController@getXIITKJ');
$router->get('/jadwal/duabelas_rpl', 'JadwalController@getXIIRPL');

$router->get('/key', function () {
    return str_random(32);
});
