<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KelasController extends Controller
{
    public function index()
    {
        $data = DB::table('tb_kelas')
            ->select('tb_kelas.kelas', 'tb_kelas.tanggal', 'tb_guru.nama_guru', 'tb_kbm.tanggal', 'tb_kbm.jam1', 'tb_kelas.judul_materi1', 'tb_kelas.pr1', 'tb_kbm.jam2', 'tb_kelas.judul_materi2', 'tb_kelas.pr2', 'tb_kbm.jam3', 'tb_kelas.judul_materi3', 'tb_kelas.pr3', 'tb_kbm.jam4', 'tb_kelas.judul_materi4', 'tb_kelas.pr4')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_kelas.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_kelas.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kbmJam1()
    {
        $data = DB::table('tb_kelas')
            ->select('tb_kelas.kelas1', 'tb_kelas.tanggal', 'tb_kbm.jam1', 'tb_guru.nama_guru', 'tb_kbm.tanggal', 'tb_kelas.judul_materi1', 'tb_kelas.pr1')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_kelas.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_kelas.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kbmJam2()
    {
        $data = DB::table('tb_kelas')
            ->select('tb_kelas.kelas2', 'tb_kelas.tanggal', 'tb_kbm.jam2', 'tb_guru.nama_guru', 'tb_kbm.tanggal', 'tb_kelas.judul_materi2', 'tb_kelas.pr2')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_kelas.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_kelas.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kbmJam3()
    {
        $data = DB::table('tb_kelas')
            ->select('tb_kelas.kelas3', 'tb_kelas.tanggal', 'tb_kbm.jam3', 'tb_guru.nama_guru', 'tb_kbm.tanggal', 'tb_kelas.judul_materi3', 'tb_kelas.pr3')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_kelas.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_kelas.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kbmJam4()
    {
        $data = DB::table('tb_kelas')
            ->select('tb_kelas.kelas4', 'tb_kelas.tanggal', 'tb_kbm.jam4', 'tb_guru.nama_guru', 'tb_kbm.tanggal', 'tb_kelas.judul_materi4', 'tb_kelas.pr4')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_kelas.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_kelas.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'kelas1' => 'required',
            'kelas2' => 'required',
            'kelas3' => 'required',
            'kelas4' => 'required',
            'id_kbm' => 'required',
            'tanggal' => 'required',
            'id_guru' => 'required',
            'judul_materi1' => 'required',
            'judul_materi2' => 'required',
            'judul_materi3' => 'required',
            'judul_materi4' => 'required',
            'pr1' => 'required',
            'pr2' => 'required',
            'pr3' => 'required',
            'pr4' => 'required'
        ]);

        $kelas1 = $request->input('kelas1');
        $kelas2 = $request->input('kelas2');
        $kelas3 = $request->input('kelas3');
        $kelas4 = $request->input('kelas4');
        $id_kbm = $request->input('id_kbm');
        $tanggal = $request->input('tanggal');
        $id_guru = $request->input('id_guru');
        $judul_materi1 = $request->input('judul_materi1');
        $judul_materi2 = $request->input('judul_materi2');
        $judul_materi3 = $request->input('judul_materi3');
        $judul_materi4 = $request->input('judul_materi4');
        $pr1 = $request->input('pr1');
        $pr2 = $request->input('pr2');
        $pr3 = $request->input('pr3');
        $pr4 = $request->input('pr4');

        $tambah = DB::table('tb_kelas')->insert([
            'kelas1' => $kelas1,
            'kelas2' => $kelas2,
            'kelas3' => $kelas3,
            'kelas4' => $kelas4,
            'id_kbm' => $id_kbm,
            'id_guru' => $id_guru,
            'tanggal' => $tanggal,
            'judul_materi1' => $judul_materi1,
            'judul_materi2' => $judul_materi2,
            'judul_materi3' => $judul_materi3,
            'judul_materi4' => $judul_materi4,
            'pr1' => $pr1,
            'pr2' => $pr2,
            'pr3' => $pr3,
            'pr4' => $pr4,
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
