<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\User;
use App\Models\Articles;
use App\Models\Opinions;
use App\Policies\OpinionsPolicy;
use App\Policies\ArticlesPolicy;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Illuminate\Database\Query\JoinClause;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
        Articles::class => ArticlesPolicy::class,
        Opinions::class => OpinionsPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //below script will authenticate incoming HTTP request
        Auth::viaRequest('api_token', function (Request $request) {
            return User::whereNotNull('api_token')->where('api_token', (string) $request->api_token)->first();//this set data for Auth::user()
        });
        Auth::viaRequest('admin_api', function (Request $request) {
            $user = DB::table('user')->whereNotNull('api_token')->where('user.api_token', $request->api_token)
            ->join('roles_users', function(JoinClause $join){
                $join->on('user.id', 'roles_users.user_id')->where('roles_users.role_id', config('constants.admin_id'));
            })
            ->first();
            return $user;
        });
        
    }
}
