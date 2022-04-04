<?php

namespace Database\Seeders;
use App\Models\match;

use Illuminate\Database\Seeder;

class machSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Match::create([
            'user1_id'           => '1',
            'user2_id'          => '2',
        ]);
    }
}
