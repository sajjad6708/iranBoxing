<!DOCTYPE html>
<html lang="en">
<head>
    @include('blog.layouts.head-tag')
    @yield('head-tag')
</head>
<body>


    <main id="main-body-one-col" class="main-body">

    @yield('content')

    </main>





    @include('blog.layouts.script')
    @yield('script')
    
</body>
</html>
