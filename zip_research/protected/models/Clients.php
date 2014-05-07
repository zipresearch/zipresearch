<?php

/**
 * This is the model class for table "clients".
 *
 * The followings are the available columns in table 'clients':
 * @property integer $id
 * @property integer $cities_id
 * @property integer $countries_id
 * @property string $name
 * @property string $lastname
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $status
 * @property string $registration_date
 * @property string $image
 * @property string $gender
 * @property string $changed_password
 * @property string $birthday
 *
 * The followings are the available model relations:
 * @property ClientSurveys[] $clientSurveys
 * @property Cities $cities
 * @property Countries $countries
 */
class Clients extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'clients';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, username, password, email, status, registration_date, gender, changed_password, birthday', 'required'),
			array('cities_id, countries_id', 'numerical', 'integerOnly'=>true),
			array('name, lastname, username, password, email, image', 'length', 'max'=>255),
			array('status', 'length', 'max'=>8),
			array('gender, changed_password', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, cities_id, countries_id, name, lastname, username, password, email, status, registration_date, image, gender, changed_password, birthday', 'safe', 'on'=>'search'),
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
                        'surveys'=>array(self::MANY_MANY, 'Surveys', 'client_surveys(clients_id, surveys_id)'),
			'clientSurveys' => array(self::HAS_MANY, 'ClientSurveys', 'clients_id'),
			'cities' => array(self::BELONGS_TO, 'Cities', 'cities_id'),
			'countries' => array(self::BELONGS_TO, 'Countries', 'countries_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cities_id' => 'Cities',
			'countries_id' => 'Countries',
			'name' => 'Name',
			'lastname' => 'Lastname',
			'username' => 'Username',
			'password' => 'Password',
			'email' => 'Email',
			'status' => 'Status',
			'registration_date' => 'Registration Date',
			'image' => 'Image',
			'gender' => 'Gender',
			'changed_password' => 'Changed Password',
			'birthday' => 'Birthday',
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
		$criteria->compare('cities_id',$this->cities_id);
		$criteria->compare('countries_id',$this->countries_id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('lastname',$this->lastname,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('status',$this->status,true);
		$criteria->compare('registration_date',$this->registration_date,true);
		$criteria->compare('image',$this->image,true);
		$criteria->compare('gender',$this->gender,true);
		$criteria->compare('changed_password',$this->changed_password,true);
		$criteria->compare('birthday',$this->birthday,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Clients the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
