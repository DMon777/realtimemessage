<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Conversation;

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

    public function show(Conversation $conversation)
    {

        //$this->authorize('show', $conversation);

        if ($conversation->isReply()) {
            abort(404);
        }

        return fractal()
            ->item($conversation)
            ->parseIncludes(['user', 'users', 'replies', 'replies.user'])
            ->transformWith(new ConversationTransformer)
            ->toArray();
    }

}
