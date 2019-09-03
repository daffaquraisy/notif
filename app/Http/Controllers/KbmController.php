<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KbmController extends Controller
{

    public function store(Request $request)
    {
        $this->validate($request, [
            'jam1' => 'required',
            'jam2'  => 'required',
            'jam3'  => 'required',
            'jam4' => 'required'
        ]);

        $jam1 = $request->input('jam1');
        $jam2 = $request->input('jam2');
        $jam3 = $request->input('jam3');
        $jam4 = $request->input('jam4');

        $tambah = DB::table('tb_kbm')->insert([
            'jam1' => $jam1,
            'jam2' => $jam2,
            'jam3' => $jam3,
            'jam4' => $jam4,
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
