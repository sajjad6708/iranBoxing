<!DOCTYPE html>
<html lang="fa">
<head>
    @include('blog.layouts.head-tag')
    @yield('head-tag')
</head>
<body>

    @include('blog.layouts.header')

    <main id="main-body-one-col" class="main-body">

    @yield('content')

    </main>


    @include('blog.layouts.footer')



    @include('blog.layouts.script')
    @yield('script')
</body>
</html>
