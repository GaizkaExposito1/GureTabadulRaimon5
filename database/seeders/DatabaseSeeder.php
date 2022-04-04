<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            VoyagerDatabaseSeeder::class,
            workshopSeeder::class,
            sponsorSeeder::class,
            machSeeder::class,
            likeSeeder::class,
            likeUserSeeder::class,
        ]);
    }
}
