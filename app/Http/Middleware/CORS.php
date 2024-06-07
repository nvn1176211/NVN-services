<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CORS
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $acceptedReferer = env('LOCAL_FE_HOST');
        if(url('/') != env('LOCAL_API_HOST')) $acceptedReferer = env('DEPLOY_FE_HOST');
        if($request->header('Referer') == $acceptedReferer){
            return $next($request);
        }else{
            return response([
                'message' => 'Forbidden.'
            ], 403);
        }
    }
}
