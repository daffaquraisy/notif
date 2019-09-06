<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JadwalController extends Controller
{
    public function getXMM()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'X MM')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXTKJ()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'X TKJ')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXRPL()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'X RPL')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXIRPL()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XI RPL')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXITKJ()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XI TKJ')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXIMM()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XI MM')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXIIRPL()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XII RPL')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXIITKJ()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XII TKJ')
            ->get();
        return response()->json(['data' => $data]);
    }

    public function getXIIMM()
    {
        $data = DB::table('tb_jadwal_mapel')
            ->select('hari', 'jam1', 'jam2', 'jam3', 'jam4', 'kelas')
            ->where('kelas', 'XII MM')
            ->get();
        return response()->json(['data' => $data]);
    }
}
