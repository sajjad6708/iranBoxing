<?php



use App\Models\Content\PostCategory;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Blog\HomeController;
use App\Http\Controllers\admin\user\RoleController;
use App\Http\Controllers\admin\notify\SMSController;
use App\Http\Controllers\Blog\ShowContentController;
use App\Http\Controllers\Admin\Content\FAQController;
use App\Http\Controllers\Blog\ShowCategoryController;
use App\Http\Controllers\Admin\Content\MenuController;
use App\Http\Controllers\admin\content\PageController;
use App\Http\Controllers\Admin\Content\PostController;
use App\Http\Controllers\admin\notify\EmailController;
use App\Http\Controllers\Blog\Post\ShowPostController;
use App\Http\Controllers\Admin\AdminDashbordController;
use App\Http\Controllers\admin\ticket\TicketController;
use App\Http\Controllers\Admin\User\AdminUserController;
use App\Http\Controllers\Admin\Content\CommentController;
use App\Http\Controllers\admin\setting\SettingController;
use App\Http\Controllers\admin\user\PermissionController;
use App\Http\Controllers\Admin\Content\CategoryController;
use App\Http\Controllers\Admin\Notify\EmailFileController;
use App\Http\Controllers\Admin\Ticket\TicketAdminController;
use App\Http\Controllers\Auth\users\LoginRegisterController;
use App\Http\Controllers\Admin\Ticket\TicketCategoryController;
use App\Http\Controllers\Admin\Ticket\TicketPriorityController;
use App\Http\Controllers\Auth\Users\ProfileUsersController;

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

// Route::get('/', function () {
//     return view('blog.home');
   
// }); 

// Route::get('/' , [ShowContentController::class , 'show_content'])->name('show.content');

Route::prefix('admin')->namespace('Admin')->group(function () {
        Route::get('/', [AdminDashbordController::class, 'index'])->name('admin.dashbord');

        Route::prefix('content')->namespace('Content')->group(function () {

            //PostCategory
                Route::prefix('category')->group(function () {
                    Route::get('/', [CategoryController::class, 'index'])->name('admin.content.category.index');
                    Route::get('/create', [CategoryController::class, 'create'])->name('admin.content.category.create');
                    Route::post('/store', [CategoryController::class, 'store'])->name('admin.content.category.store');
                    Route::get('/edit/{postCategory}', [CategoryController::class, 'edit'])->name('admin.content.category.edit');
                    Route::put('/update/{postCategory}', [CategoryController::class, 'update'])->name('admin.content.category.update');
                    Route::delete('/destroy/{postCategory}', [CategoryController::class, 'destroy'])->name('admin.content.category.destroy');
                    Route::get('/status/{postCategory}', [CategoryController::class, 'status'])->name('admin.content.category.status');
                    Route::get('/showMenu/{postCategory}', [CategoryController::class, 'showInMenu'])->name('admin.content.category.showInMenu');
                });

         
                //page
                Route::prefix('page')->group(function () {
                    Route::get('/', [PageController::class, 'index'])->name('admin.content.page.index');
                    Route::get('/create', [PageController::class, 'create'])->name('admin.content.page.create');
                    Route::post('/store', [PageController::class, 'store'])->name('admin.content.page.store');
                    Route::get('/edit/{page}', [PageController::class, 'edit'])->name('admin.content.page.edit');
                    Route::put('/update/{page}', [PageController::class, 'update'])->name('admin.content.page.update');
                    Route::delete('/destroy/{page}', [PageController::class, 'destroy'])->name('admin.content.page.destroy');
                    Route::get('/status/{page}', [PageController::class, 'status'])->name('admin.content.page.status');
                });

                //Post  
                Route::prefix('post')->group(function () {
                    Route::get('/', [PostController::class, 'index'])->name('admin.content.post.index');
                    Route::get('/create', [PostController::class, 'create'])->name('admin.content.post.create');
                    Route::post('/store', [PostController::class, 'store'])->name('admin.content.post.store');
                    Route::get('/edit/{post}', [PostController::class, 'edit'])->name('admin.content.post.edit');
                    Route::put('/update/{post}', [PostController::class, 'update'])->name('admin.content.post.update');
                    Route::delete('/destroy/{post}', [PostController::class, 'destroy'])->name('admin.content.post.destroy');
                    Route::get('/status/{post}', [PostController::class, 'status'])->name('admin.content.post.status');
                    Route::get('/commentable/{post}', [PostController::class, 'commentable'])->name('admin.content.post.commentable');
                });


                    // Comment----

                    Route::prefix('comment')->group(function () {
                        Route::get('/', [CommentController::class, 'index'])->name('admin.content.comment.index');
                        Route::get('/show/{comment}', [CommentController::class, 'show'])->name('admin.content.comment.show');
                        Route::delete('/destroy/{comment}', [CommentController::class, 'destroy'])->name('admin.content.comment.destroy');
                        Route::get('/approved/{comment}', [CommentController::class, 'approved'])->name('admin.content.comment.approved');
                        Route::get('/status/{comment}', [CommentController::class, 'status'])->name('admin.content.comment.status');
                        Route::post('/answer/{comment}', [CommentController::class, 'answer'])->name('admin.content.comment.answer');
                    });

                    //menu
                    Route::prefix('menu')->group(function () {
                        Route::get('/', [MenuController::class, 'index'])->name('admin.content.menu.index');
                        Route::get('/create', [MenuController::class, 'create'])->name('admin.content.menu.create');
                        Route::post('/store', [MenuController::class, 'store'])->name('admin.content.menu.store');
                        Route::get('/edit/{menu}', [MenuController::class, 'edit'])->name('admin.content.menu.edit');
                        Route::put('/update/{menu}', [MenuController::class, 'update'])->name('admin.content.menu.update');
                        Route::delete('/destroy/{menu}', [MenuController::class, 'destroy'])->name('admin.content.menu.destroy');
                        Route::get('/status/{menu}', [MenuController::class, 'status'])->name('admin.content.menu.status');
                    });


                    //faq
              Route::prefix('faq')->group(function () {
                    Route::get('/', [FAQController::class, 'index'])->name('admin.content.faq.index');
                    Route::get('/create', [FAQController::class, 'create'])->name('admin.content.faq.create');
                    Route::post('/store', [FAQController::class, 'store'])->name('admin.content.faq.store');
                    Route::get('/edit/{faq}', [FAQController::class, 'edit'])->name('admin.content.faq.edit');
                    Route::put('/update/{faq}', [FAQController::class, 'update'])->name('admin.content.faq.update');
                    Route::delete('/destroy/{faq}', [FAQController::class, 'destroy'])->name('admin.content.faq.destroy');
                    Route::get('/status/{faq}', [FAQController::class, 'status'])->name('admin.content.faq.status');
        });
    });

    Route::prefix('user')->namespace('User')->group(function () {

        //admin-user
        Route::prefix('admin-user')->group(function () {
            Route::get('/', [AdminUserController::class, 'index'])->name('admin.user.admin-user.index');
            Route::get('/create', [AdminUserController::class, 'create'])->name('admin.user.admin-user.create');
            Route::post('/store', [AdminUserController::class, 'store'])->name('admin.user.admin-user.store');
            Route::get('/edit/{admin}', [AdminUserController::class, 'edit'])->name('admin.user.admin-user.edit');
            Route::put('/update/{admin}', [AdminUserController::class, 'update'])->name('admin.user.admin-user.update');
            Route::delete('/destroy/{admin}', [AdminUserController::class, 'destroy'])->name('admin.user.admin-user.destroy');
            Route::get('/status/{user}', [AdminUserController::class, 'status'])->name('admin.user.admin-user.status');
            Route::get('/activation/{user}', [AdminUserController::class, 'activation'])->name('admin.user.admin-user.activation');
        });

      

        //role
        Route::prefix('role')->group(function () {
            Route::get('/', [RoleController::class, 'index'])->name('admin.user.role.index');
            Route::get('/create', [RoleController::class, 'create'])->name('admin.user.role.create');
            Route::post('/store', [RoleController::class, 'store'])->name('admin.user.role.store');
            Route::get('/edit/{role}', [RoleController::class, 'edit'])->name('admin.user.role.edit');
            Route::put('/update/{role}', [RoleController::class, 'update'])->name('admin.user.role.update');
            Route::delete('/destroy/{role}', [RoleController::class, 'destroy'])->name('admin.user.role.destroy');
            Route::get('/permission-form/{role}', [RoleController::class, 'permissionForm'])->name('admin.user.role.permission-form');
            Route::put('/permission-update/{role}', [RoleController::class, 'permissionUpdate'])->name('admin.user.role.permission-update');
        });

        //permission
        Route::prefix('permission')->group(function () {
            Route::get('/', [PermissionController::class, 'index'])->name('admin.user.permission.index');
            Route::get('/create', [PermissionController::class, 'create'])->name('admin.user.permission.create');
            Route::post('/store', [PermissionController::class, 'store'])->name('admin.user.permission.store');
            Route::get('/edit/{id}', [PermissionController::class, 'edit'])->name('admin.user.permission.edit');
            Route::put('/update/{id}', [PermissionController::class, 'update'])->name('admin.user.permission.update');
            Route::delete('/destroy/{id}', [PermissionController::class, 'destroy'])->name('admin.user.permission.destroy');
        });
    });


    Route::prefix('notify')->namespace('Notify')->group(function () {

        //email
        Route::prefix('email')->group(function () {
            Route::get('/', [EmailController::class, 'index'])->name('admin.notify.email.index');
            Route::get('/create', [EmailController::class, 'create'])->name('admin.notify.email.create');
            Route::post('/store', [EmailController::class, 'store'])->name('admin.notify.email.store');
            Route::get('/edit/{email}', [EmailController::class, 'edit'])->name('admin.notify.email.edit');
            Route::put('/update/{email}', [EmailController::class, 'update'])->name('admin.notify.email.update');
            Route::delete('/destroy/{email}', [EmailController::class, 'destroy'])->name('admin.notify.email.destroy');
            Route::get('/status/{email}', [EmailController::class, 'status'])->name('admin.notify.email.status');
        });


        //email file
        Route::prefix('email-file')->group(function () {
            Route::get('/{email}', [EmailFileController::class, 'index'])->name('admin.notify.email-file.index');
            Route::get('/{email}/create', [EmailFileController::class, 'create'])->name('admin.notify.email-file.create');
            Route::post('/{email}/store', [EmailFileController::class, 'store'])->name('admin.notify.email-file.store');
            Route::get('/edit/{file}', [EmailFileController::class, 'edit'])->name('admin.notify.email-file.edit');
            Route::put('/update/{file}', [EmailFileController::class, 'update'])->name('admin.notify.email-file.update');
            Route::delete('/destroy/{file}', [EmailFileController::class, 'destroy'])->name('admin.notify.email-file.destroy');
            Route::get('/status/{file}', [EmailFileController::class, 'status'])->name('admin.notify.email-file.status');
        });

        //sms
        Route::prefix('sms')->group(function () {
            Route::get('/', [SMSController::class, 'index'])->name('admin.notify.sms.index');
            Route::get('/create', [SMSController::class, 'create'])->name('admin.notify.sms.create');
            Route::post('/store', [SMSController::class, 'store'])->name('admin.notify.sms.store');
            Route::get('/edit/{sms}', [SMSController::class, 'edit'])->name('admin.notify.sms.edit');
            Route::put('/update/{sms}', [SMSController::class, 'update'])->name('admin.notify.sms.update');
            Route::delete('/destroy/{sms}', [SMSController::class, 'destroy'])->name('admin.notify.sms.destroy');
            Route::get('/status/{sms}', [SMSController::class, 'status'])->name('admin.notify.sms.status');
        });
    });

    Route::prefix('ticket')->namespace('Ticket')->group(function () {

        //category
        Route::prefix('category')->group(function () {
            Route::get('/', [TicketCategoryController::class, 'index'])->name('admin.ticket.category.index');
            Route::get('/create', [TicketCategoryController::class, 'create'])->name('admin.ticket.category.create');
            Route::post('/store', [TicketCategoryController::class, 'store'])->name('admin.ticket.category.store');
            Route::get('/edit/{ticketCategory}', [TicketCategoryController::class, 'edit'])->name('admin.ticket.category.edit');
            Route::put('/update/{ticketCategory}', [TicketCategoryController::class, 'update'])->name('admin.ticket.category.update');
            Route::delete('/destroy/{ticketCategory}', [TicketCategoryController::class, 'destroy'])->name('admin.ticket.category.destroy');
            Route::get('/status/{ticketCategory}', [TicketCategoryController::class, 'status'])->name('admin.ticket.category.status');
        });


        //priority
        Route::prefix('priority')->group(function () {
            Route::get('/', [TicketPriorityController::class, 'index'])->name('admin.ticket.priority.index');
            Route::get('/create', [TicketPriorityController::class, 'create'])->name('admin.ticket.priority.create');
            Route::post('/store', [TicketPriorityController::class, 'store'])->name('admin.ticket.priority.store');
            Route::get('/edit/{ticketPriority}', [TicketPriorityController::class, 'edit'])->name('admin.ticket.priority.edit');
            Route::put('/update/{ticketPriority}', [TicketPriorityController::class, 'update'])->name('admin.ticket.priority.update');
            Route::delete('/destroy/{ticketPriority}', [TicketPriorityController::class, 'destroy'])->name('admin.ticket.priority.destroy');
            Route::get('/status/{ticketPriority}', [TicketPriorityController::class, 'status'])->name('admin.ticket.priority.status');
        });


        //admin
        Route::prefix('admin')->group(function () {
            Route::get('/', [TicketAdminController::class, 'index'])->name('admin.ticket.admin.index');
            Route::get('/set/{admin}', [TicketAdminController::class, 'set'])->name('admin.ticket.admin.set');
        });

        //main
        Route::get('/', [TicketController::class, 'index'])->name('admin.ticket.index');
        Route::get('/new-tickets', [TicketController::class, 'newTickets'])->name('admin.ticket.newTickets');
        Route::get('/open-tickets', [TicketController::class, 'openTickets'])->name('admin.ticket.openTickets');
        Route::get('/close-tickets', [TicketController::class, 'closeTickets'])->name('admin.ticket.closeTickets');
        Route::get('/show/{ticket}', [TicketController::class, 'show'])->name('admin.ticket.show');
        Route::post('/answer/{ticket}', [TicketController::class, 'answer'])->name('admin.ticket.answer');
        Route::get('/change/{ticket}', [TicketController::class, 'change'])->name('admin.ticket.change');
    });

    Route::prefix('user')->namespace('User')->group(function () {

        //admin-user
        Route::prefix('admin-user')->group(function () {
            Route::get('/', [AdminUserController::class, 'index'])->name('admin.user.admin-user.index');
            Route::get('/create', [AdminUserController::class, 'create'])->name('admin.user.admin-user.create');
            Route::post('/store', [AdminUserController::class, 'store'])->name('admin.user.admin-user.store');
            Route::get('/edit/{admin}', [AdminUserController::class, 'edit'])->name('admin.user.admin-user.edit');
            Route::put('/update/{admin}', [AdminUserController::class, 'update'])->name('admin.user.admin-user.update');
            Route::delete('/destroy/{admin}', [AdminUserController::class, 'destroy'])->name('admin.user.admin-user.destroy');
            Route::get('/status/{user}', [AdminUserController::class, 'status'])->name('admin.user.admin-user.status');
            Route::get('/activation/{user}', [AdminUserController::class, 'activation'])->name('admin.user.admin-user.activation');
        });

      

        //role
        Route::prefix('role')->group(function () {
            Route::get('/', [RoleController::class, 'index'])->name('admin.user.role.index');
            Route::get('/create', [RoleController::class, 'create'])->name('admin.user.role.create');
            Route::post('/store', [RoleController::class, 'store'])->name('admin.user.role.store');
            Route::get('/edit/{role}', [RoleController::class, 'edit'])->name('admin.user.role.edit');
            Route::put('/update/{role}', [RoleController::class, 'update'])->name('admin.user.role.update');
            Route::delete('/destroy/{role}', [RoleController::class, 'destroy'])->name('admin.user.role.destroy');
            Route::get('/permission-form/{role}', [RoleController::class, 'permissionForm'])->name('admin.user.role.permission-form');
            Route::put('/permission-update/{role}', [RoleController::class, 'permissionUpdate'])->name('admin.user.role.permission-update');
        });

        //permission
        Route::prefix('permission')->group(function () {
            Route::get('/', [PermissionController::class, 'index'])->name('admin.user.permission.index');
            Route::get('/create', [PermissionController::class, 'create'])->name('admin.user.permission.create');
            Route::post('/store', [PermissionController::class, 'store'])->name('admin.user.permission.store');
            Route::get('/edit/{id}', [PermissionController::class, 'edit'])->name('admin.user.permission.edit');
            Route::put('/update/{id}', [PermissionController::class, 'update'])->name('admin.user.permission.update');
            Route::delete('/destroy/{id}', [PermissionController::class, 'destroy'])->name('admin.user.permission.destroy');
        });
    });


    Route::prefix('setting')->namespace('Setting')->group(function () {

        Route::get('/', [SettingController::class, 'index'])->name('admin.setting.index');
        Route::get('/edit/{setting}', [SettingController::class, 'edit'])->name('admin.setting.edit');
        Route::put('/update/{setting}', [SettingController::class, 'update'])->name('admin.setting.update');
        Route::delete('/destroy/{setting}', [SettingController::class, 'destroy'])->name('admin.setting.destroy');
    });

    Route::post('/notification/read-all', [NotificationController::class, 'readAll'])->name('admin.notification.readAll');
});



    Route::get('/' , [HomeController::class ,'home'])->name('blog.home');
   
    Route::get('/viewCategories/{category}' , [HomeController::class ,'post_index'])->name('show-category');

    Route::namespace('Post')->group(function(){
        Route::get('/show-post/{post:slug}' , [ShowPostController::class ,'show'])->name('show-post');
        Route::post('/add-comment/{post:slug}', [ShowPostController::class ,'addComment'])->name('post.add-comment');
    });


    
      
Route::namespace('Auth')->group(function(){
    Route::get('login-register-form' , [LoginRegisterController::class  ,'loginRegisterForm'])->name('blog.auth.login-register-form');
    Route::middleware('throttle:blog-login-register-limiter')->post('/login-register' , [LoginRegisterController::class  ,'loginRegister'])->name('blog.auth.login-register');
    Route::get('login-confirm-form/{token}' , [LoginRegisterController::class  ,'loginConfirmForm'])->name('blog.auth.login-confirm-form');
    Route::middleware('throttle:blog-login-confirm-limiter')->post('login-confirm/{token}' , [LoginRegisterController::class  ,'loginConfirm'])->name('blog.auth.login-confirm');
    Route::middleware('throttle:blog-login-resend-otp-limiter')->get('/login-resend-otp/{token}', [LoginRegisterController::class, 'loginResendOtp'])->name('auth.blog.login-resend-otp');
    Route::get('/logout', [LoginRegisterController::class, 'logout'])->name('auth.blog.logout');
});


Route::get('my-profile',[ProfileUsersController::class , 'showProfile'])->name('my-profile');





// Route::namespace('Auth')->group(function () {
//     Route::get('login-register', [LoginRegisterController::class, 'loginRegisterForm'])->name('auth.customer.login-register-form');
//     Route::middleware('throttle:customer-login-register-limiter')->post('/login-register', [LoginRegisterController::class, 'loginRegister'])->name('auth.customer.login-register');
//     Route::get('login-confirm/{token}', [LoginRegisterController::class, 'loginConfirmForm'])->name('auth.customer.login-confirm-form');
//     Route::middleware('throttle:customer-login-confirm-limiter')->post('/login-confirm/{token}', [LoginRegisterController::class, 'loginConfirm'])->name('auth.customer.login-confirm');
//     Route::middleware('throttle:customer-login-resend-otp-limiter')->get('/login-resend-otp/{token}', [LoginRegisterController::class, 'loginResendOtp'])->name('auth.customer.login-resend-otp');
//     Route::get('/logout', [LoginRegisterController::class, 'logout'])->name('auth.customer.logout');
//  });


  


Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');}
    
    )->name('dashboard');



// =================================================================================
