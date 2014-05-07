<?php
/* @var $this SurveysController */
/* @var $model Surveys */

$this->breadcrumbs=array(
	'Surveys'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Surveys', 'url'=>array('index')),
	array('label'=>'Create Surveys', 'url'=>array('create')),
	array('label'=>'View Surveys', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Surveys', 'url'=>array('admin')),
);
?>

<h1>Update Surveys <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>