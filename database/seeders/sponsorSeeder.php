<?php

namespace Database\Seeders;
use App\Models\sponsor;
use Illuminate\Database\Seeder;

class sponsorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        sponsor::factory()->count(6)->create();
    }
}
