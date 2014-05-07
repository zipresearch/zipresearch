<?php
/* @var $this SurveysController */
/* @var $model Surveys */

$this->breadcrumbs=array(
	'Surveys'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Surveys', 'url'=>array('index')),
	array('label'=>'Create Surveys', 'url'=>array('create')),
	array('label'=>'Update Surveys', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Surveys', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Surveys', 'url'=>array('admin')),
);
?>

<h1>View Surveys #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'users_id',
		'bonus',
		'time',
		'max_questions',
		'title',
		'description',
		'status',
	),
)); ?>

<?php $this->renderPartial('_addquestions', array('model'=>$model)); ?>