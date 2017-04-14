<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'wechat' => [
            'class' => 'maxwen\easywechat\Wechat',
            //'userOptions' => []  # user identity class params
            //'sessionParam' => '' # wechat user info will be stored in session under this key
            //'returnUrlParam' => '' # returnUrl param stored in session
        ],
            'authManager' => [
    			'class' =>'yii\rbac\DbManager',
    	],
    ],
];
