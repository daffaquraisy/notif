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
        $nama_guru = $request->input('nama_guru');
        $password_guru = $request->input('password_guru');

        $user = DB::table('tb_guru')->where('nama_guru', $nama_guru)->first();
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
}
