<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KbmController extends Controller
{

    public function store(Request $request)
    {
        $this->validate($request, [
            'jam' => 'required',
            'id_pelajaran' => 'required'
        ]);

        $jam = $request->input('jam');
        $id_pelajaran = $request->input('id_pelajaran');

        $tambah = DB::table('tb_kbm')->insert([
            'jam' => $jam,
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
