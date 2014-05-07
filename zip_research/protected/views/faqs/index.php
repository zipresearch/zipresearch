<?php
/* @var $this FaqsController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Faqs',
);

$this->menu=array(
	array('label'=>'Create Faqs', 'url'=>array('create')),
	array('label'=>'Manage Faqs', 'url'=>array('admin')),
);
?>

<h1>Faqs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
