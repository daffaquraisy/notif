<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KelasController extends Controller
{

    public function getTugas()
    {
        $getS = ['pr' => 'pr1'];

        $data = DB::table('tb_kelas')
            ->select('tb_kelas.nama_kelas', 'tb_absen.tanggal', 'tb_catetan.nama_pr')
            ->leftJoin('tb_absen', 'tb_absen.id_presensi', '=', 'tb_kelas.id_absen')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_kelas.id_catetan')
            ->where($getS)
            ->get();
        return response()->json(['data' => $data]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nama_kelas' => 'required'
        ]);

        $nama_kelas = $request->input('nama_kelas');

        $tambah = DB::table('tb_kelas')->insert([
            'nama_kelas' => $nama_kelas,
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
