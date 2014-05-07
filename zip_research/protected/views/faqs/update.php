<?php
/* @var $this FaqsController */
/* @var $model Faqs */

$this->breadcrumbs=array(
	'Faqs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Faqs', 'url'=>array('index')),
	array('label'=>'Create Faqs', 'url'=>array('create')),
	array('label'=>'View Faqs', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Faqs', 'url'=>array('admin')),
);
?>

<h1>Update Faqs <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>