<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<?php $form = ActiveForm::begin(); ?>
<?=Html::checkboxList('newPri',$AuthAssignmentArray,$allPrivilegesArray);?>
    <div class="form-group">
        <?= Html::submitButton('设置') ?>
    </div>

    <?php ActiveForm::end(); ?>