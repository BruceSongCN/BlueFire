<?php

namespace App\Models;

/**
 * 系统配置模型
 *
 * @author bruce
 */
class SystemOption extends BaseModel
{

    protected $table = 'system_options';

    public $timestamps = false;  //关闭自动更新时间戳
}
