<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DeniedMatchs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('denied_matchs', function (Blueprint $table) {
        $table->id();
        $table->bigInteger('user1_id')->unsigned();//No negativos
        $table->foreign('user1_id')->references('id')->on('users');
        $table->bigInteger('user2_id')->unsigned();//No negativos
        $table->foreign('user2_id')->references('id')->on('users');
        $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('denied_matchs');
    }
}
