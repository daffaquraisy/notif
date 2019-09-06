<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class SiswaController extends Controller
{
    public function index()
    {
        $data = DB::table('tb_siswa')
            ->select('nis', 'nama_siswa', 'kelas', 'alamat', 'telp_siswa')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nis' => 'required',
            'nama_siswa'  => 'required|string',
            'alamat'  => 'required',
            'password_siswa' => 'required',
            'telp_siswa' => 'required'
        ]);

        $nis = $request->input('nis');
        $nama_siswa = $request->input('nama_siswa');
        $alamat = $request->input('alamat');
        $telp_siswa = $request->input('telp_siswa');
        $password_siswa = Hash::make($request->input('password_siswa'));

        $tambah = DB::table('tb_siswa')->insert([
            'nis' => $nis,
            'nama_siswa' => $nama_siswa,
            'alamat' => $alamat,
            'password_siswa' => $password_siswa,
            'telp_siswa' => $telp_siswa
        ]);

        if ($tambah) {
            return response()->json([
                'success' => true,
                'message' => 'Berhasil tambah data'
            ], 201);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal tambah data',
            ], 400);
        }
    }
}
