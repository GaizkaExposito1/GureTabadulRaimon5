<?php

use App\Http\Controllers\AngularController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CartLineController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\DeniedMatchController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\LikeUserController;
use App\Http\Controllers\MatchController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\SponsorController;
use App\Http\Controllers\WorkshopController;
use App\Http\Controllers\WorkshopUserController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ServiceController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\adminUserController;
use App\Http\Controllers\videoController;
use App\Http\Controllers\contactanosController;
use App\Http\Controllers\contactanosPController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//index
Route::get('/', [videoController::class,'index'])->name('inicio');
Route::get('/home', [HomeController::class,'index'])->name('home');
Route::get('/registerGustos', [LikeController::class,'index'])->name('registerGustos');
//servicios
Route::get('/servicios', [ServiceController::class,'index'])->name('servicios');
//Usuario
    //perfil
    Route::resource('user',UserController::class);
    //auth
    Auth::routes();
    //gustos
    Route::resource('like',LikeController::class);
    Route::resource('likeUser',LikeUserController::class);
    //match
    Route::resource('match',MatchController::class);
    Route::post('/matchFilter', [MatchController::class,'filtrar'])->name('filtrar');
    Route::post('/matchChangeEstado', [MatchController::class,'cambiarEstado'])->name('cambiarEstado');
    //admin
    Route::group(['prefix' => 'admin'], function () {
        Voyager::routes();
    });
//Talleres
Route::resource('talleres',WorkshopController::class);
Route::resource('workshopUser',WorkshopUserController::class);
//Chat
Route::resource('chat',ChatController::class);
Route::resource('mensaje',MessageController::class);
Route::get('/chatUser/{chat}', [ChatController::class,'buscarChat'])->name('chatUser');
//tienda
Route::resource('producto',ProductController::class);
Route::resource('purchase',PurchaseController::class);
    //carro
    Route::resource('cart',CartController::class);
    Route::resource('cartline',CartLineController::class);
//patrocinador
Route::resource('sponsor',SponsorController::class);
//userAdmin
Route::resource('adminUsers',adminUserController::class);

Route::get('lang/{lang}', ['as' => 'lang.switch', 'uses' => 'App\Http\Controllers\LanguageController@switchLang']);
Route::get('/languageDemo', 'App\Http\Controllers\HomeController@languageDemo');

//mail
Route::get('contactanos',[contactanosController::class,'index'])->name(('contactanos.index'));
Route::post('contactanos',[contactanosController::class,'store'])->name(('contactanos.store'));

Route::get('contactanosP',[contactanosPController::class,'index'])->name(('contactanosP.index'));
Route::post('contactanosP',[contactanosPController::class,'store'])->name(('contactanosP.store'));

