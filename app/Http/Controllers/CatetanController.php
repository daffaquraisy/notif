<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CatetanController extends Controller
{

    public function store(Request $request)
    {
        $this->validate($request, [
            'pr' => 'required',
            'judul_materi' => 'required',
            'nama_materi' => 'required'
        ]);

        $pr = $request->input('pr');
        $nama_pr = $request->input('nama_pr');
        $judul_materi = $request->input('judul_materi');
        $nama_materi = $request->input('nama_materi');

        $tambah = DB::table('tb_catetan')->insert([
            'pr' => $pr,
            'nama_pr' => $nama_pr,
            'judul_materi' => $judul_materi,
            'nama_materi' => $nama_materi,
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
