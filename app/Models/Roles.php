<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    use HasFactory;
    protected $table = 'roles';
    protected $primaryKey = 'role_id';
    public $timestamps = false;
    protected $fillable = ['role_name', 'role_id'];

    //one Role has many Users
    public function users() {
        return $this->hasMany(Users::class);
    }
}