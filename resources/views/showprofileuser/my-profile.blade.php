<!doctype html>
<html lang="fa" dir="rtl">

@extends('blog.layouts.head-tag')
<body>



    <!-- start body -->
    <section class="">
        <section id="main-body-two-col" class="container-xxl body-container">
            <section class="row">
                <main id="main-body" class="main-body col-md-9">
                    <section class="content-wrapper bg-white p-3 rounded-2 mb-2">
                        <!-- start vontent header -->
                        <section class="content-header mb-4">
                            <section class="d-flex justify-content-between align-items-center">
                                <h2 class="content-header-title">
                                    <span>اطلاعات حساب</span>
                                </h2>
                                <section class="content-header-link">
                                
                                </section>
                            </section>
                        </section>
                        <!-- end vontent header -->

                        <section class="d-flex justify-content-end my-4">
                            <a class="btn btn-link btn-sm text-info text-decoration-none mx-1" href="{{ route('blog.home') }}"><i class="fa fa-edit px-1"></i> بازگشت</a>
                        </section>


                        <section class="row">
                            <section class="col-6 border-bottom mb-2 py-2">
                                <section class="field-title">نام</section>
                                <section class="field-value overflow-auto">{{ $user->first_name }}</section>
                            </section>

                            <section class="col-6 border-bottom my-2 py-2">
                                <section class="field-title">نام خانوادگی</section>
                                <section class="field-value overflow-auto">{{ $user->last_name }}</section>
                            </section>

                            <section class="col-6 border-bottom my-2 py-2">
                                <section class="field-title">شماره تلفن همراه</section>
                                <section class="field-value overflow-auto">{{ $user->mobile }}</section>
                            </section>

                            <section class="col-6 border-bottom my-2 py-2">
                                <section class="field-title">ایمیل</section>
                                <section class="field-value overflow-auto">{{ $user->email }}</section>
                            </section>

                            <section class="col-6 my-2 py-2">
                                <section class="field-title">کد ملی</section>
                                <section class="field-value overflow-auto">{{ $user->national_code }}</section>
                            </section>

                            <section class="col-6 my-2 py-2">
                                <section class="field-title">رمز عبور</section>
                                <section class="field-value overflow-auto"> --- </section>
                            </section>

                        </section>




                    </section>
                </main>
            </section>
        </section>
    </section>
    <!-- end body -->




    <!-- start footer -->
    {{-- <footer class="footer">
        <section class="container-xxl my-4">
            <section class="row">
                <section class="col">
                    <section class="footer-shop-features d-md-flex justify-content-md-around align-items-md-center">

                        <section class="footer-shop-features-item">
                            <img src="assets/images/footer/1.png" alt="">
                            <section class="text-center">امکان تحویل اکسپرس</section>
                        </section>

                        <section class="footer-shop-features-item">
                            <img src="assets/images/footer/2.png" alt="">
                            <section class="text-center">امکان پرداخت در محل</section>
                        </section>

                        <section class="footer-shop-features-item">
                            <img src="assets/images/footer/3.png" alt="">
                            <section class="text-center">7 روز هفته، 24 ساعته</section>
                        </section>

                        <section class="footer-shop-features-item">
                            <img src="assets/images/footer/4.png" alt="">
                            <section class="text-center">7 روز ضمانت بازگشت کالا</section>
                        </section>

                        <section class="footer-shop-features-item">
                            <img src="assets/images/footer/5.png" alt="">
                            <section class="text-center">ضمانت اصل بودن کالا</section>
                        </section>

                    </section>
                </section>
            </section>
            <section class="row">
                <section class="col-md">
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">شرایط و قوانین</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">درباره ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">تماس با ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">فرصت های شغلی</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">سوالات متداول</a></section>
                </section>

                <section class="col-md">
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">شرایط و قوانین</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">درباره ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">تماس با ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">فرصت های شغلی</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">سوالات متداول</a></section>
                </section>

                <section class="col-md">
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">شرایط و قوانین</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">درباره ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">تماس با ما</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">فرصت های شغلی</a></section>
                    <section><a class="text-decoration-none text-muted d-inline-block my-2" href="#">سوالات متداول</a></section>
                </section>

                <section class="col-md-5">
                    <section>
                        <section class="text-dark fw-bold">با ما همراه باشید</section>
                        <section class="my-3">
                            <a href="#" class="text-muted text-decoration-none me-5"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="text-muted text-decoration-none me-5"><i class="fab fa-telegram"></i></a>
                            <a href="#" class="text-muted text-decoration-none me-5"><i class="fab fa-whatsapp"></i></a>
                            <a href="#" class="text-muted text-decoration-none me-5"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-muted text-decoration-none me-5"><i class="fab fa-linkedin"></i></a>
                        </section>
                    </section>
                </section>
            </section>
            <section class="row my-5">
                <section class="col">
                    <section class="fw-bold">شرکت آمازون</section>
                    <section class="text-muted footer-intro">ما همواره تلاش می کنیم بهترین خدمات را به مشتریان آمازون ارائه کنیم. به شما کمک می کنیم بهترین انتخاب را داشته باشید و با اطمینان خاطر خرید را انجام بدهید و در کوتاه ترین زمان ممکن کالای خود را دریافت کنید. همچنین ما 24 ساعته در هفت روز هفته به مشتریان مان خدمات ارائه می دهیم. و 7 روز ضمانت برگشت برای تمامی کالاها داریم.</section>
                </section>
            </section>

            <section class="row border-top pt-4">
                <section class="col">
                    <section class="text-muted footer-intro text-center">کلیه حقوق این وبسایت متعلق به شرکت آمازون می باشد.</section>
                </section>
            </section>
        </section>
    </footer> --}}
    <!-- end footer -->



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    {{-- <script src="assets/js/jQuery-3.5.1.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap/bootstrap.min.js" ></script>
    <script src="assets/js/bootstrap/bootstrap.bundle.min.js" ></script>
    <script src="assets/plugins/owlcarousel/owl.carousel.min.js"></script>
    <script src="assets/js/main.js" ></script> --}}

    @extends('blog.layouts.script')
</body>
</html>