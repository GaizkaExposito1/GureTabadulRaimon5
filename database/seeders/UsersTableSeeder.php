<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (User::count() == 0) {

            $admin = Role::where('name', 'admin')->firstOrFail();
            $guretabadul = Role::where('name', 'Owner')->firstOrFail();

            User::create([
                'name'           => 'Admin',
                'email'          => 'admin@admin.com',
                'password'       => bcrypt('z'),
                'remember_token' => Str::random(60),
                'role_id'        => $admin->id,
                'banned'         => 0,
                'phone'          => 623526137,
                'country'        => 'España',
                'village'        => 'Bilbao',
                'address'        => 'Indautxu',
            ]);
            User::create([
                'name'           => 'Ibone',
                'email'          => 'admin@guretabadul.com',
                'password'       => bcrypt('Ibone Guretabadul'),
                'remember_token' => Str::random(60),
                'role_id'        =>  $guretabadul->id,
                'banned'         =>  0,
                'phone'          => 762362123,
                'country'        => 'España',
                'village'        => 'Bilbao',
                'address'        => 'Indautxu',
            ]);
        }
    }
}
