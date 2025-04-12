<?php

namespace App\Http\Controllers;

use App\Models\Request;
use App\Http\Requests\StoreRequestRequest;
use App\Http\Requests\UpdateRequestRequest;

class RequestController extends Controller
{
    public function store(StoreRequestRequest $request)
    {
        $request = $request->validated();
        $newRequest = Request::create([
            'full_name' => $request['full_name'],
            'email' => $request['email'],
            'phone_number' => $request['phone_number']
        ]);
        if($newRequest){
            return response()->json([
                'success' => True,
                'newRequest' => $newRequest
            ]);
        }else{
            return response()->json([
                'success' => False,
                'message' => "Problem has occurred"
            ]);
        }
    }
}
