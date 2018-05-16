<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Transformers\ConversationTransformer;

class ConversationController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function index(Request $request)
    {

       $conversations = $request->user()->conversations()->get();


        $result =  fractal()
            ->collection($conversations)
            ->parseIncludes(['user', 'users',])
            ->transformWith(new ConversationTransformer)
            ->toArray();

        return $result;

   }

}
