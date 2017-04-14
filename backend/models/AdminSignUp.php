<?php
namespace backend\models;
use yii\base\Model;
use common\models\Adminuser;
class AdminSignUp extends Model{

     public $username;
     public $password;
     public $mobile;
     public $email;

     public function rules(){
        return [
           ['username','filter','filter' => 'trim'],
           ['username','required'],
           ['username','unique','targetClass' => '\common\models\Adminuser','message' => "用户名已存在"],
           ['username','string','min' => 4,'max' => 255],

           ['password','filter','filter' => 'trim'],
           ['password','required'],
           ['password','string','min' => 6,],

           ['mobile','required'],

           ['email', 'filter', 'filter' => 'trim'],
           ['email', 'required'],
           ['email', 'email'],
           ['email', 'string', 'max' => 255],
           ['email', 'unique', 'targetClass' => '\common\models\Adminuser', 'message' => '邮箱地址已经被占用.'],



        ];
     }

    public function attributeLabels(){
         return [
           'id' => "ID",
           'username' => '用户名',
           'password' => '密码',
           'email' => '邮箱',
           'mobile' => '手机号',
         ];
    }


    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $adminuser = new Adminuser();
        $adminuser->username = $this->username;
        $adminuser->mobile = $this->mobile;
        $adminuser->email = $this->email;
        $adminuser->setPassword($this->password);
        $adminuser->generateAuthKey();
        
        return $adminuser->save() ? $adminuser : null;
    }














}