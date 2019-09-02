<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $table = 'tb_absen';
    protected $guarded = [];
    protected $fillable = ['nis', 'nama_siswa', 'tanggal', 'keterangan'];
}
