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
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan1', 'tb_absen.keterangan2', 'tb_absen.keterangan3', 'tb_absen.keterangan4', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getKelas1($id)
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan1', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam1')
            ->where('nis', $id)
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getKelas2($id)
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan2', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam2')
            ->where('nis', $id)
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getKelas3($id)
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan3', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam3')
            ->where('nis', $id)
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getKelas4($id)
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan4', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam4')
            ->where('nis', $id)
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas2()
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan2', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam2')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas3()
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan3', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam3')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function kelas4()
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan4', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas', 'tb_catetan.nama_materi', 'tb_catetan.nama_pr')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('tb_kbm.jam', 'jam4')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function show($id)
    {
        $data = DB::table('tb_absen')
            ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan1', 'tb_absen.keterangan2', 'tb_absen.keterangan3', 'tb_absen.keterangan4', 'tb_catetan.nama_pr', 'tb_catetan.nama_materi', 'tb_kelas.nama_kelas')
            ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
            ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
            ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
            ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
            ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
            ->leftJoin('tb_catetan', 'tb_catetan.id_catetan', '=', 'tb_absen.id_catatan')
            ->where('nis', $id)
            ->groupBy('tb_absen.tanggal')
            ->get();
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'tanggal' => 'required',
            'keterangan1' => 'required',
            'keterangan2' => 'required',
            'keterangan3' => 'required',
            'keterangan4' => 'required',
            'id_siswa' => 'required',
            'id_pelajaran' => 'required',
            'id_kbm' => 'required',
            'id_guru' => 'required',
            'id_kelas' => 'required',
            'id_catetan' => 'required'
        ]);

        $tanggal = $request->input('tanggal');
        $keterangan1 = $request->input('keterangan1');
        $keterangan2 = $request->input('keterangan2');
        $keterangan3 = $request->input('keterangan3');
        $keterangan4 = $request->input('keterangan4');
        $id_siswa = $request->input('id_siswa');
        $id_pelajaran = $request->input('id_pelajaran');
        $id_kbm = $request->input('id_kbm');
        $id_guru = $request->input('id_guru');
        $id_kelas = $request->input('id_kelas');
        $id_catetan = $request->input('id_catetan');

        $tambah = DB::table('tb_absen')->insert([
            'tanggal' => $tanggal,
            'keterangan1' => $keterangan1,
            'keterangan2' => $keterangan2,
            'keterangan3' => $keterangan3,
            'keterangan4' => $keterangan4,
            'id_kbm' => $id_kbm,
            'id_kelas' => $id_kelas,
            'id_guru' => $id_guru,
            'id_catetan' => $id_catetan,
            'id_siswa' => $id_siswa,
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

    public function apiSearch(Request $request)
    {
        if ($request->has('q')) {
            $cari = $request->q;
            $data = DB::table('tb_absen')
                ->select('tb_siswa.nis', 'tb_siswa.nama_siswa', 'tb_absen.tanggal', 'tb_absen.keterangan1', 'tb_absen.keterangan2', 'tb_absen.keterangan3', 'tb_absen.keterangan4', 'tb_pelajaran.nama_pelajaran', 'tb_guru.nama_guru', 'tb_kelas.nama_kelas')
                ->leftJoin('tb_siswa', 'tb_siswa.id_siswa', '=', 'tb_absen.id_siswa')
                ->leftJoin('tb_kelas', 'tb_kelas.id_kelas', '=', 'tb_absen.id_kelas')
                ->leftJoin('tb_guru', 'tb_guru.id_guru', '=', 'tb_absen.id_guru')
                ->leftJoin('tb_kbm', 'tb_kbm.id_kbm', '=', 'tb_absen.id_kbm')
                ->leftJoin('tb_pelajaran', 'tb_pelajaran.id_pelajaran', '=', 'tb_absen.id_pelajaran')
                ->where('tb_absen.tanggal', 'LIKE', '%' . $cari . '%')
                ->simplePaginate(20);
            return response()->json(['data' => $data]);
        }
    }
}
