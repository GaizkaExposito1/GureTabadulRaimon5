<?php

namespace Database\Seeders;
use App\Models\likeUser;
use Illuminate\Database\Seeder;

class likeUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        likeUser::create([
            'user_id'           => '1',
            'like_id'           => '1',
        ]);
        likeUser::create([
            'user_id'           => '1',
            'like_id'           => '2',
        ]);
        likeUser::create([
            'user_id'           => '2',
            'like_id'           => '4',
        ]);
        likeUser::create([
            'user_id'           => '1',
            'like_id'           => '3',
        ]);

    }
}
