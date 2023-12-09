<?php

namespace App\Providers;

use App\Models\Content\Menu;
use App\Models\Notification;
use App\Models\Content\Comment;
use App\Models\Market\CartItem;
use App\Models\Content\PostCategory;
use Illuminate\pagination\paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        paginator::useBootstrap();
        // view()->composer('admin.layouts.header', function ($view) {
        //     $view->with('unseenComments', Comment::where('seen', 0)->get());
        //     $view->with('notifications', Notification::where('read_at', null)->get());
        // });


      

        view()->composer('blog.layouts.header' , function($view){
            $menus = Menu::where('status' , 1 )->get();
            $view->with('menus', $menus);
            $categories = PostCategory::where('show_in_menu' , 1  )->where('parent_id' , null  )->get();
            $view->with('categories',$categories);
        });
    }
}
