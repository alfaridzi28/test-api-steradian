<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

    protected $primaryKey = 'car_id';
    public $incrementing = true;
    protected $keyType = 'int';

    protected $fillable = [
        'car_name',
        'day_rate',
        'month_rate',
        'image'
    ];

    public function orders() {
        return $this->hasMany(Order::class, 'car_id');
    }
}
