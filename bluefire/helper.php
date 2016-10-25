<?php

/**
 * Get Bluefire third-party package directory：\Bluefire
 *
 * @return string
 **/
function dys_path() {
    $dir = dirname(dirname(__FILE__));
    return $dir;
}


/**
 * Get Dictionary config
 *
 * @return mixed
 */
function dict($dot_key = null, $default = null)
{
    $dict = app('Bluefire\Dict');
    return $dict->getDict($dot_key, $default);
}
