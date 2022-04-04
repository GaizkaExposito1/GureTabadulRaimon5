<?php

namespace Database\Seeders;
use App\Models\like;

use Illuminate\Database\Seeder;

class likeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        like::create([
            'name'           => 'cocinar',
        ]);
        like::create([
            'name'           => 'bailar',
        ]);
        like::create([
            'name'           => 'leer',
        ]);
        like::create([
            'name'           => 'escribir',
        ]);
    }
}
