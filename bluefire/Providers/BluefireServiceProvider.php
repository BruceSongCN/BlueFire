<?php

namespace Bluefire\Providers;

use Illuminate\Support\ServiceProvider;
use Bluefire\Extensions\BluefireValidator;
use Bluefire\Extensions\BluefireBlade;

//use Validator;

/**
 * BluefireServiceProvider 扩展自定义验证类 服务提供者
 *
 * @author bruce
 */
class BluefireServiceProvider extends ServiceProvider
{

    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
        /*注册自定义Blade标签*/
        BluefireBlade::register();
        /*注册自定义验证类*/
        /*
        Validator::resolver(function($translator, $data, $rules, $messages)
        {
            return new BluefireValidator($translator, $data, $rules, $messages);
        });
        */
        $this->app['validator']->resolver(function ($translator, $data, $rules, $messages) {
            return new BluefireValidator($translator, $data, $rules, $messages);
        });
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
