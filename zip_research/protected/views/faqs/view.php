<?php
/* @var $this FaqsController */
/* @var $model Faqs */

$this->breadcrumbs=array(
	'Faqs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Faqs', 'url'=>array('index')),
	array('label'=>'Create Faqs', 'url'=>array('create')),
	array('label'=>'Update Faqs', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Faqs', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Faqs', 'url'=>array('admin')),
);
?>

<h1>View Faqs #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'question',
		'answer',
	),
)); ?>
