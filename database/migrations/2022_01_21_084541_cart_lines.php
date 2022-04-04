<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CartLines extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_lines', function (Blueprint $table) {
        $table->id();
        $table->bigInteger('cart_id')->unsigned();//No negativos
        $table->foreign('cart_id')->references('id')->on('carts');
        $table->bigInteger('product_id')->unsigned();//No negativos
        $table->foreign('product_id')->references('id')->on('products');
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
        Schema::dropIfExists('cart_lines');
    }
}
