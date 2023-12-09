<?php

namespace App\Http\Controllers\Blog;

use App\Models\Content\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Content\PostCategory;
use Illuminate\Support\Facades\Auth;
class HomeController extends Controller
{
    public function home()
    {

      
        $posts = Post::where('status', 1)->take(10)->get();
        $mostVisiteds = Post::orderBy('views', 'DESC')->take(20)->get();       
        Auth::loginUsingId(1);
        return view('blog.home', compact('posts' , 'mostVisiteds'));
    }

    public function post_index(PostCategory $category)
    {
      
        $posts = Post::where('category_id' , $category->id )->get();

        return view('blog.post.categories.show-category', compact('posts'));

    }
}
