<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class LikeUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('like_users', function (Blueprint $table) {
        $table->id();
        // habiaun boolean,ni puta idea
        $table->bigInteger('user_id')->unsigned();//No negativos
        $table->foreign('user_id')->references('id')->on('users');
        $table->bigInteger('like_id')->unsigned();//No negativos
        $table->foreign('like_id')->references('id')->on('likes');
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
        Schema::dropIfExists('like_users');
    }
}
