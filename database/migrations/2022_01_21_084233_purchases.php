<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Purchases extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
        $table->id();
        $table->bigInteger('user_id')->unsigned();//No negativos
        $table->foreign('user_id')->references('id')->on('users');
        $table->bigInteger('cart_id')->unsigned();//No negativos
        $table->foreign('cart_id')->references('id')->on('carts');
        $table->date('purchase_date');
        $table->string('accepted_payment_token')->unique();
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
        Schema::dropIfExists('purchases');
    }
}
