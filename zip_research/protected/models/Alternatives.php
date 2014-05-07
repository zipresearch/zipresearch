<?php

/**
 * This is the model class for table "alternatives".
 *
 * The followings are the available columns in table 'alternatives':
 * @property integer $id
 * @property integer $questions_id
 * @property integer $conditions_id
 * @property integer $weight
 * @property string $description
 * @property integer $chosen
 * @property string $answer_description
 *
 * The followings are the available model relations:
 * @property Questions $questions
 * @property Conditions $conditions
 */
class Alternatives extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'alternatives';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('weight, description', 'required'),
			array('questions_id, conditions_id, weight, chosen', 'numerical', 'integerOnly'=>true),
			array('answer_description', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, questions_id, conditions_id, weight, description, chosen, answer_description', 'safe', 'on'=>'search'),
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
			'questions' => array(self::BELONGS_TO, 'Questions', 'questions_id'),
			'conditions' => array(self::BELONGS_TO, 'Conditions', 'conditions_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'questions_id' => 'Questions',
			'conditions_id' => 'Conditions',
			'weight' => 'Weight',
			'description' => 'Description',
			'chosen' => 'Chosen',
			'answer_description' => 'Answer Description',
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
		$criteria->compare('questions_id',$this->questions_id);
		$criteria->compare('conditions_id',$this->conditions_id);
		$criteria->compare('weight',$this->weight);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('chosen',$this->chosen);
		$criteria->compare('answer_description',$this->answer_description,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Alternatives the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
