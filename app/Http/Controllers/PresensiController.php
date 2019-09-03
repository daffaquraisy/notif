<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PresensiController extends Controller
{
    public function index()
    {
        $data = DB::table('tb_absen')
            ->select('nis', 'nama_siswa', 'tanggal', 'keterangan1', 'keterangan2', 'keterangan3', 'keterangan4')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas1()
    {
        $data = DB::table('tb_absen')
            ->select('tb_absen.nis', 'tb_absen.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan1', 'tb_kelas.kelas1', 'tb_kbm.jam1')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas2()
    {
        $data = DB::table('tb_absen')
            ->select('tb_absen.nis', 'tb_absen.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan2', 'tb_kelas.kelas2', 'tb_kbm.jam2')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas3()
    {
        $data = DB::table('tb_absen')
            ->select('tb_absen.nis', 'tb_absen.nama_siswa', 'tb_absen.tanggal',  'tb_absen.keterangan3', 'tb_kelas.kelas3', 'tb_kbm.jam3')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas4()
    {
        $data = DB::table('tb_absen')
            ->select('tb_absen.nis', 'tb_absen.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan4', 'tb_kelas.kelas4', 'tb_kbm.jam4')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nis' => 'required',
            'nama_siswa' => 'required',
            'keterangan' => 'required',
            'tanggal' => 'required',
        ]);

        $nis = $request->input('nis');
        $nama_siswa = $request->input('nama_siswa');
        $tanggal = $request->input('tanggal');
        $keterangan = $request->input('keterangan');
        // $tanggal = Carbon\Carbon::now($request->input('tanggal'));

        $tambah = DB::table('tb_absen')->insert([
            'nis' => $nis,
            'nama_siswa' => $nama_siswa,
            'keterangan' => $keterangan,
            'tanggal' => $tanggal
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
