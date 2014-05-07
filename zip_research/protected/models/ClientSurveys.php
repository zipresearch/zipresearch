<?php

/**
 * This is the model class for table "client_surveys".
 *
 * The followings are the available columns in table 'client_surveys':
 * @property integer $surveys_id
 * @property integer $clients_id
 * @property string $completion
 *
 * The followings are the available model relations:
 * @property Clients $clients
 */
class ClientSurveys extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'client_surveys';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('surveys_id, clients_id, completion', 'required'),
			array('surveys_id, clients_id', 'numerical', 'integerOnly'=>true),
			array('completion', 'length', 'max'=>12),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('surveys_id, clients_id, completion', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'clients' => array(self::BELONGS_TO, 'Clients', 'clients_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'surveys_id' => 'Surveys',
			'clients_id' => 'Clients',
			'completion' => 'Completion',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('surveys_id',$this->surveys_id);
		$criteria->compare('clients_id',$this->clients_id);
		$criteria->compare('completion',$this->completion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ClientSurveys the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
