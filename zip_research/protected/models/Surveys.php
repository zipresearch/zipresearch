<?php

/**
 * This is the model class for table "Surveys".
 *
 * The followings are the available columns in table 'Surveys':
 * @property integer $id
 * @property integer $users_id
 * @property integer $bonus
 * @property integer $time
 * @property integer $max_questions
 * @property string $title
 * @property string $description
 * @property string $status
 * @property string $creation_date
 */
class Surveys extends CActiveRecord
{
        private $status_values = array("ACTIVE"=>"Activo","INACTIVE"=>"Inactivo","DRAFT"=>"Borrador");
        
        public function getStatusValues()
        {
           return $this->status_values;
        }
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'surveys';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('time, max_questions, title, description, status', 'required'),
			array('bonus, time, max_questions', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>255),
			array('status', 'length', 'max'=>8),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, users_id, bonus, time, max_questions, title, description, status, creation_date', 'safe', 'on'=>'search'),
		);
	}
        
        public function behaviors()
        {
            return array( 'CAdvancedArBehavior' => array(
                'class' => 'application.extensions.CAdvancedArBehavior'));
        }

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
                        'clients'=>array(self::MANY_MANY, 'Clients', 'client_surveys(surveys_id, clients_id)'),
			'users' => array(self::BELONGS_TO, 'Users', 'users_id'),
		);
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'users_id' => 'Users',
			'bonus' => 'Bonus',
			'time' => 'Time',
			'max_questions' => 'Max Questions',
			'title' => 'Title',
			'description' => 'Description',
			'status' => 'Status',
			'creation_date' => 'Creation Date',
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
		$criteria->compare('users_id',$this->users_id);
		$criteria->compare('bonus',$this->bonus);
		$criteria->compare('time',$this->time);
		$criteria->compare('max_questions',$this->max_questions);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('creation_date',$this->creation_date,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
                        'sort'=>array('defaultOrder'=>'creation_date ASC'), // orden por defecto según el atributo nombre
                        'pagination'=>array('pageSize'=>10), // personalizamos la paginación
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Surveys the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
