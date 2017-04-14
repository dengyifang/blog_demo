<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'defaultRoute'=>'site/basic',
    'bootstrap' => ['log'],
    'language'=>'zh-CN',
    'timeZone' => 'Asia/Chongqing',
    'modules' => [],
    'components' => [
        'assetManager' => [
             'basePath' => '@webroot/backend/web/assets',
             'baseUrl' => '@web/backend/web/assets'
        ],
        'user' => [
            'identityClass' => 'common\models\Adminuser',
            'enableAutoLogin' => true,
        ],
        'session'=>[
                'name'=>'PHPBACKSESSION',
                'savePath'=>sys_get_temp_dir(),
        ],
        'request'=>[
                'cookieValidationKey'=>'sdfjjksloeedf78789judf',
                'csrfParam'=>'_adminCSRF',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'view' => [
              'theme' =>[
                   'pathMap' => [
                        '@backend/views' => ['@backend/themes',
                                        ],
                   ],
              ],
        ],
        /*
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
        */
    ],
    'params' => $params,
];
