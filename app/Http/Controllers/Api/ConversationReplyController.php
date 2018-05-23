<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Conversation;
use App\Transformers\ConversationTransformer;
use App\Http\Requests\StoreConversationReplyRequest;

class ConversationReplyController extends Controller
{

    public function __construct()
    {
        $this->middleware(['auth']);
    }


    public function store(StoreConversationReplyRequest $request,Conversation $conversation)
    {

        $this->authorize('reply', $conversation);


        $reply = new Conversation();
        $reply->body = $request->body;
        //записываем внешний ключ
        $reply->user()->associate($request->user());

        $conversation->replies()->save($reply);
        $conversation->touchLastReply();

        return fractal()
            ->item($reply)
            ->parseIncludes(['user', 'parent', 'parent.user', 'parent.users'])
            ->transformWith(new ConversationTransformer)
            ->toArray();
    }

}
