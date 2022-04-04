<?php

namespace Database\Seeders;
use App\Models\workshop;
use Illuminate\Database\Seeder;

class workshopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        workshop::factory()->count(6)->create();
    }
}
