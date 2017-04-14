<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "{{%lantern}}".
 *
 * @property string $id
 * @property string $title
 * @property string $img_url
 * @property string $link_url
 * @property string $remark
 * @property integer $level
 * @property integer $is_show
 */
class Lantern extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%lantern}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['level'], 'required'],
            [['level', 'is_show'], 'integer'],
            [['title'], 'string', 'max' => 20],
            [['img_url', 'link_url', 'remark'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'img_url' => 'Img Url',
            'link_url' => 'Link Url',
            'remark' => 'Remark',
            'level' => 'Level',
            'is_show' => 'Is Show',
        ];
    }
}
