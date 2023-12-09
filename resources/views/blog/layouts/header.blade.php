<!-- start header -->
<head>
      @include('blog.layouts.head-tag')
</head>

<header class="header mb-4">


    <!-- start top-header logo, searchbox and cart -->
    <section class="top-header">
        <section class="container-xxl ">
            <section class="d-md-flex justify-content-md-between align-items-md-center py-3">

                <section class="d-flex justify-content-between align-items-center d-md-block">
                    <a class="text-decoration-none" href="index.html"><img src="{{asset('blog-assets/images/logo/8.png')}}"
                            alt="logo"></a>
                    <button class="btn btn-link text-dark d-md-none" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                        <i class="fa fa-bars me-1"></i>
                    </button>
                </section>

                <section class="mt-3 mt-md-auto search-wrapper">
                    <section class="search-box">
                        <section class="search-textbox">
                            <span><i class="fa fa-search"></i></span>
                            <input id="search" type="text" class="" placeholder="جستجو ..."
                                autocomplete="off">
                        </section>

                    </section>
                </section>

                <section class="mt-3 mt-md-auto text-end">
                    <section class="d-inline px-md-3">
                        @auth
                            <button class="btn btn-link text-decoration-none text-dark dropdown-toggle profile-button"
                                type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-user"></i>
                            </button>
                            <section class="dropdown-menu dropdown-menu-end custom-drop-down"
                                aria-labelledby="dropdownMenuButton1">
                                <section><a class="dropdown-item" href="{{ route('my-profile') }}"><i
                                            class="fa fa-user-circle"></i>پروفایل کاربری</a></section>

                                <section>
                                    <hr class="dropdown-divider">
                                </section>
                                <section><a class="dropdown-item" href="#"><i class="fa fa-sign-out-alt"></i>خروج</a>
                                </section>

                                <section>
                                    <hr class="dropdown-divider">
                                </section>
                                <section><a class="dropdown-item" href="{{ route('admin.dashbord') }}"><i
                                    class="fa fa-user-circle"></i> ورود به پنل ادمین</a></section>

                            </section>
                        @endauth


                        @guest
                            <a href="{{ route('blog.auth.login-register-form') }}" class="btn btn-link text-decoration-none text-dark profile-button">
                                <i class="fa fa-user-lock">ورود ثبت نام</i>
                            </a>
                        @endguest
                    </section>



                </section>
            </section>
        </section>
    </section>
    <!-- end top-header logo, searchbox and cart -->
 

    <!-- start menu -->
<section>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="{{route('blog.home')}}">خانه</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                @foreach ($menus as $menu)
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="{{$menu->url}}"> {{$menu->name}}</a>
                  </li>
                @endforeach
             @foreach ($categories as $category)
             <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="{{route('show-category' , $category->id)}}"> {{$category->name}} </a>
              </li>
             @endforeach
             
            
            
            </ul>
           
          </div>
        </div>
      </nav>
</section>

    <!-- end menu -->


</header>
<!-- end header -->
