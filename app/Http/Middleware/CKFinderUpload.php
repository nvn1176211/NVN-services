<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\FileUploads;

class CKFinderUpload
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
        $api_token = $request->api_token;
        $user =  User::whereNotNull('api_token')->where('api_token', $api_token)->first();
        if (!$user) return response(['message' => 'Unauthorized.'], 401);
        $nowUT = time();
        $lastMinuteUT = $nowUT - 60;
        $now = date(config('constants.standard_datetime_format'), $nowUT);
        $lastMinute = date(config('constants.standard_datetime_format'), $lastMinuteUT);
        $recentUploaded = FileUploads::where([
            ['created_by', $user->id],
            ['created_at', '>=', $lastMinute],
            ['created_at', '<=', $now],
        ])->count();
        if ($recentUploaded > 5) {
            return response([
                'message' => 'Forbidden.'
            ], 403);
        } else {
            return $next($request);
        }
    }
}
