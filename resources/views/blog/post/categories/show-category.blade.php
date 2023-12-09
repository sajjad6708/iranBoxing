@extends('blog.layouts.master-one-col')


@section('content')

<main>

       <div class="album py-5 bg-light bg-block">
              <div class="p-4 p-md-5 mb-4 rounded text-bg-dark">
                     <div class="col-md-6 px-0" id="rounded">
                       <h1 class="display-4 fst-italic"> آکادمی بوکس ایران</h1>
                       <p class="lead my-3">وبسایت تخصصی آموزش  بوکس  از آماتور تا حرفه ایی</p>
                       
                     </div>
              </div>
         <div class="container">
  
           <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            @foreach ($posts as $post)
            
         <div class="col">
          
              <div class="card shadow-sm">
                <img class="bd-placeholder-img card-img-top" width="100%" height="225" src="{{asset($post->image) }}"/>
                <div class="card-body">
                  <strong> {{$post->title}}</strong>
                  <p class="card-text"> {!! Str::limit($post->summary , 80)!!} </p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <a href="{{ route('show-post' , $post) }}"><button type="button" class="btn btn-sm btn-outline-secondary">مشاهده</button></a>
                      
                    </div>
                    <small class="text-muted">تاریخ انتشار : {{jalaliDate($post->created_at)}}</small>
                  </div>
                </div>
              </div>
           
            </div>
         
            @endforeach
          
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     
     </main>


@endsection




