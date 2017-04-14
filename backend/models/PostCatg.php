<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%post_catg}}".
 *
 * @property integer $id
 * @property string $catg_name
 * @property string $catg_url
 * @property integer $is_show
 */
class PostCatg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%post_catg}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['catg_name'], 'required'],
            [['is_show'], 'integer'],
            [['catg_name', 'catg_url'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'catg_name' => 'Catg Name',
            'catg_url' => 'Catg Url',
            'is_show' => 'Is Show',
        ];
    }
}
