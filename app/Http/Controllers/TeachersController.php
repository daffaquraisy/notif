<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Teacher;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class TeachersController extends Controller
{
    public function index()
    {
        $data = DB::table('tb_guru')
            ->select('kode_guru', 'nama_guru', 'tlp_guru')
            ->get();
        return response()->json($data);
    }

    public function show($id)
    {
        $data = DB::table('tb_guru')
            ->select('kode_guru', 'nama_guru', 'tlp_guru')
            ->where('id_guru', $id)
            ->get();
        return response()->json($data);
    }

    public function store(Request $request)
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

        $tambah = DB::table('tb_guru')->insert([
            'nama_guru' => $nama_guru,
            'kode_guru' => $kode_guru,
            'tlp_guru' => $tlp_guru,
            'password_guru' => $password_guru
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
