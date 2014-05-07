<?php
/* @var $this SurveysController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Surveys',
);

$this->menu=array(
	array('label'=>'Create Surveys', 'url'=>array('create')),
	array('label'=>'Manage Surveys', 'url'=>array('admin')),
);
?>

<h1>Surveys <?php echo Yii::app()->user->id; ?></h1>

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'dataProvider'=>$model->search(),
        'filter'=>$model,
        'columns'=>array(
            'id',
            'title', // muestra el atributo "titulo"
            //'users.name', // muestra el atributo 'nombre' de la relación 'categoria' declararada en el modelo
            array
            (
                'header'=>'Fecha de creación',
                'name'=>'creation_date',
                'htmlOptions'=>array('style'=>'text-align: center'),
                'value'=>'$data->creation_date',
            ),
            array
            (
                'header'=>'Usuario creador',
                'name'=>'users.name',
                'htmlOptions'=>array('style'=>'text-align: center'),
                'value'=>'$data->users->name',
            ),
//            array( // muestra el atributo 'fecha_creacion' usando una expresión para procesar el valor de éste
//                'name'=>'Fecha de creación',
//                'value'=>'$data->creation_date',
//            ),
            array(  // muestra una columna con los botones "view", "update" y "delete"
                'class'=>'CButtonColumn',
                'template'=>'{view}{delete}{update}{accion_nueva}', // botones a mostrar
                'buttons'=>array(
                    'accion_nueva' => array( //botón para la acción nueva
                        'label'=>'Agregar preguntas', // titulo del enlace del botón nuevo
                        'imageUrl'=>Yii::app()->request->baseUrl.'/images/add_question.png', //ruta icono para el botón
                        'url'=>'Yii::app()->createUrl("/surveys/addquestions?id=$data->id" )', //url de la acción nueva
                    ),
                ),
            ),
        ),
//	'itemView'=>'_view',
)); ?>
