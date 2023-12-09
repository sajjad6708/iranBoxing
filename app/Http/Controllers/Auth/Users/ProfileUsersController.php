<?php

namespace App\Http\Controllers\Auth\Users;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ProfileUsersController extends Controller
{   
    public function showProfile(){
        $user = Auth::user();
        return view('showprofileuser.my-profile', compact('user')) ;

        

    }
 
}