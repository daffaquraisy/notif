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
            ->select('nis', 'nama_siswa', 'keterangan', 'tanggal')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function show($id)
    {
        $data = DB::table('tb_absen')
            ->select('nis', 'nama_siswa', 'tanggal', 'keterangan')
            ->where('presensi_id', $id)
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
