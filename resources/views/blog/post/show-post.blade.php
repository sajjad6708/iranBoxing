@extends('blog.layouts.master-one-col')

@section('content')
<article class="mb-4">
       <div class="container px-4 px-lg-5">
        
           <div class="row gx-4 gx-lg-5 justify-content-center">
               <div class="col-md-10 col-lg-8 col-xl-7">
                    <div> <img src="{{asset($post->image)}}" alt="aaa" srcset="" width="100%" >  </div> 
                   <p><h3>{!! $post->title !!}</h3></p>
                   <hr>
                   <p> {!!$post->body !!}</p>
                  
               </div>
           </div>
       </div>



       
   </article>


  
 {{-- ==============start comment and add comment========  --}}


 <section>
    <div class="container">
    <div class="be-comment-block">
        <h1 class="comments-title">تعداد کامنت های این پست ({{$post->activeComments()->count()}})</h1>
    
        @foreach ($post->activeComments() as $activecomment)
        <div class="be-comment">
            <div class="be-img-comment">	
                
                    <img src="#" alt="" class="be-ava-comment">
            
            </div>
            <div class="be-comment-content">
                @php
                $author =$activecomment->user;
                    
                @endphp
                    <span class="be-comment-name">
                        @if (empty($author->first_name) && empty($author->last_name))
                        ناشناس
                        @else
                        {{$author->first_name . ' ' . $author->last_name}}
                        @endif
                        </span>
                    <span class="be-comment-time">
                        <i class="fa fa-clock-o"></i>
                        {{jalaliDate($activecomment->created_at)}}
                    </span>
    
                <p class="be-comment-text">
                    {{$activecomment->body}}
                </p>
            </div>
    
            @foreach ($activecomment->answers()->get() as $commentAnswer)
            <div class="be-comment">
                <div class="be-img-comment">	
                    
                        <img src="#" alt="" class="be-ava-comment">
                
                </div>
                <div class="be-comment-content">
                    @php
                    $author =$commentAnswer->user;
                        
                    @endphp
                        <span class="be-comment-name">
                            @if (empty($author->first_name) && empty($author->last_name))
                            ناشناس
                            @else
                            {{$author->first_name . ' ' . $author->last_name}}
                            @endif
                            </span>
                        <span class="be-comment-time">
                            <i class="fa fa-clock-o"></i>
                            {{jalaliDate($commentAnswer->created_at)}}
                        </span>
        
                    <p class="be-comment-text">
                        {{$commentAnswer->body}}    
                    </p>
                  
                </div>
              
    
                
            @endforeach
            <hr><hr>
            
    
           
    
    
        </div>
        @endforeach
        
        
    
            <div class="row">
              
                <div> <strong>افزودن دیدگاه:</strong></div>
    
    
                <div class="col-xs-12">		
                @guest
                    
                
                    <div class="alert alert-warning d-flex align-items-center" role="alert">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
                          <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        <div>
                         کاربر گرامی برای ثبت دیدگاه ابتدا باید در سایت لاگین باشید افرین
                        </div>
                       <a href="{{ route('blog.auth.login-register-form') }}"> <button type="button" class="btn btn-success mr-2">ورود/ثبت نام</button></a>
                      </div>
                      @endguest
                    
                
                 @auth
                     
                <form action="{{route('post.add-comment', $post)}}" method="post" class="form-block">
                    @csrf
                    <div class="form-group">
                        <textarea class="form-input" required=""  name="body" placeholder="دیدگاه شما"></textarea>
                    </div>
                    <button type="submit" class="btn btn-sm btn-primary">ثبت دیدگاه</button>
                </div>
               
            </form>
                @endauth
                
                       
                                   
                    
            </div>
        
    </div>
    </div>
      </section>

  @endsection
    

