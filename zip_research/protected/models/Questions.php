<?php

/**
 * This is the model class for table "questions".
 *
 * The followings are the available columns in table 'questions':
 * @property integer $id
 * @property integer $headers_id
 * @property integer $input_types_id
 * @property integer $surveys_id
 * @property string $type
 * @property integer $weight
 * @property integer $alternatives_number
 * @property string $description
 *
 * The followings are the available model relations:
 * @property Alternatives[] $alternatives
 */
class Questions extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'questions';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('input_types_id, type, weight, alternatives_number, description', 'required'),
			array('headers_id, input_types_id, surveys_id, weight, alternatives_number', 'numerical', 'integerOnly'=>true),
			array('type', 'length', 'max'=>8),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, headers_id, input_types_id, surveys_id, type, weight, alternatives_number, description', 'safe', 'on'=>'search'),
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
			'alternatives' => array(self::HAS_MANY, 'Alternatives', 'questions_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'headers_id' => 'Headers',
			'input_types_id' => 'Input Types',
			'surveys_id' => 'Surveys',
			'type' => 'Type',
			'weight' => 'Weight',
			'alternatives_number' => 'Alternatives Number',
			'description' => 'Description',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('headers_id',$this->headers_id);
		$criteria->compare('input_types_id',$this->input_types_id);
		$criteria->compare('surveys_id',$this->surveys_id);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('weight',$this->weight);
		$criteria->compare('alternatives_number',$this->alternatives_number);
		$criteria->compare('description',$this->description,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Questions the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
