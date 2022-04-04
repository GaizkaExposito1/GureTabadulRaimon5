<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class WorkshopUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workshop_users', function (Blueprint $table) {
        $table->id();
        $table->bigInteger('user_id')->unsigned();//No negativos
        $table->foreign('user_id')->references('id')->on('users');
        $table->bigInteger('workshop_id')->unsigned();//No negativos
        $table->foreign('workshop_id')->references('id')->on('workshops');
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
        Schema::dropIfExists('workshop_users');
    }
}
