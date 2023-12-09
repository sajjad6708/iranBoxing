<?php

namespace App\Http\Controllers\Blog\Post;

use App\Models\Content\Post;
use App\Models\Content\Comment;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Request;

class ShowPostController extends Controller
{
    public function show(Post $post)
    {
   
        $post->incrementReadCount();
        return view('blog.post.show-post',compact('post') );

       
        
    }

    public function addComment(Post $post, Request $request)
    {
        $request->validate([
            'body' => 'required|max:2000'
        ]);

     
$inputs = $request->all;
        $inputs['body'] = str_replace(PHP_EOL, '<br/>', $request->body);
        $inputs['author_id'] = Auth::user()->id;
        $inputs['commentable_id'] = $post->id;
        $inputs['commentable_type'] = Post::class;
        Comment::create($inputs);
        
        return back()->with('swal-success' , ' دیدگاه شما با موفقیت ارسال شد ');
    }




}
