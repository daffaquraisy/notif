<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $this->validate($request, [
            'nama_guru' => 'required',
            'kode_guru'  => 'required|string',
            'tlp_guru'  => 'required',
            'password_guru' => 'required'
        ]);

        $nama_guru = $request->input('nama_guru');
        $kode_guru = $request->input('kode_guru');
        $tlp_guru = $request->input('tlp_guru');
        $password_guru = Hash::make($request->input('password_guru'));

        $register = DB::table('tb_guru')->insert([
            'nama_guru' => $nama_guru,
            'kode_guru' => $kode_guru,
            'tlp_guru' => $tlp_guru,
            'password_guru' => $password_guru
        ]);

        if ($register) {
            return response()->json([
                'success' => true,
                'message' => 'Register success',
                'data' => $register
            ], 201);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Fail',
                'data' => ''
            ], 400);
        }
    }

    public function login(Request $request)
    {
        $kode_guru = $request->input('kode_guru');
        $password_guru = $request->input('password_guru');

        $user = DB::table('tb_guru')->where('kode_guru', $kode_guru)->first();
        if (Hash::check($password_guru, $user->password_guru)) {

            return response()->json([
                'success' => true,
                'message' => 'Login success',
                // 'data' => $user
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Fail',
            ], 400);
        }
    }

    public function loginOrangTua(Request $request)
    {
        $nis = $request->input('nis');
        $password_siswa = $request->input('password_siswa');

        $user = DB::table('tb_siswa')->where('nis', $nis)->first();
        if (Hash::check($password_siswa, $user->password_siswa)) {

            return response()->json([
                'success' => true,
                'message' => 'Login success',
                // 'data' => $user
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Login Fail',
            ], 400);
        }
    }

    public function registerOrangTua(Request $request)
    {
        $this->validate($request, [
            'nis' => 'required',
            'nama_siswa'  => 'required|string',
            'password_siswa'  => 'required',
            'kelas' => 'required',
            'alamat' => 'required',
            'telp_siswa' => 'required'
        ]);

        $nis = $request->input('nis');
        $nama_siswa = $request->input('nama_siswa');
        $kelas = $request->input('kelas');
        $alamat = $request->input('alamat');
        $telp_siswa = $request->input('telp_siswa');
        $password_siswa = Hash::make($request->input('password_siswa'));

        $register = DB::table('tb_siswa')->insert([
            'nis' => $nis,
            'nama_siswa' => $nama_siswa,
            'kelas' => $kelas,
            'alamat' => $alamat,
            'telp_siswa' => $telp_siswa,
            'password_siswa' => $password_siswa
        ]);

        if ($register) {
            return response()->json([
                'success' => true,
                'message' => 'Register success',
                'data' => $register
            ], 201);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Fail',
                'data' => ''
            ], 400);
        }
    }
}
