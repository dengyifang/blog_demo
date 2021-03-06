<?php

namespace backend\models;

use Yii;
use backend\models\PostCatg;
use common\models\Adminuser;

/**
 * This is the model class for table "{{%post}}".
 *
 * @property integer $id
 * @property integer $catg_id
 * @property string $title
 * @property string $cover_url
 * @property string $content
 * @property string $tags
 * @property integer $status
 * @property integer $create_time
 * @property integer $update_time
 * @property integer $author_id
 * @property integer $read_count
 */
class Post extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%post}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['catg_id', 'title', 'content', 'author_id', 'read_count'], 'required'],
            [['catg_id', 'status', 'create_time', 'update_time', 'author_id', 'read_count'], 'integer'],
            [['content', 'tags'], 'string'],
            [['title', 'cover_url'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'catg_id' => 'Catg ID',
            'title' => 'Title',
            'cover_url' => 'Cover Url',
            'content' => 'Content',
            'tags' => 'Tags',
            'status' => 'Status',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'author_id' => 'Author ID',
            'read_count' => 'Read Count',
        ];
    }

    public function getCatg(){
        $postCatg =  PostCatg::find()
                    ->where(['id' => $this->catg_id])
                    ->one();
        return $postCatg->catg_name;
    }

    public function getAuthName(){
        $admin =    Adminuser::find()
                     ->select(['username'])
                     ->where(['id' => $this->author_id])
                     ->one();
        return $admin->username;
    }


}
