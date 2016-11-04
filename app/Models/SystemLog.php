<?php

namespace App\Models;

/**
 * 系统日志模型
 *
 * @author bruce
 */
class SystemLog extends BaseModel
{

    protected $table = 'system_logs';
    
    protected $fillable = ['user_id', 'type', 'url', 'content', 'operator_ip'];

     /**
     * 操作用户
     * 模型对象关系：系统日志对应的操作用户
     *
     * @return Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }
}
