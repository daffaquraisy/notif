<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PelajaranController extends Controller
{

    public function store(Request $request)
    {
        $this->validate($request, [
            'nama_pelajaran' => 'required'
        ]);

        $nama_pelajaran = $request->input('nama_pelajaran');
        $id_pelajaran = $request->input('id_pelajaran');

        $tambah = DB::table('tb_pelajaran')->insert([
            'nama_pelajaran' => $nama_pelajaran,
            'id_pelajaran' => $id_pelajaran
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
