<?php namespace Augusthur\Validation\Rule;

/**
 * Ensure one string exactly matches another
 *
 * @package Validation
 * @author Luke Lanchester <luke@lukelanchester.com>
 **/
class Matches implements \Augusthur\Validation\Rule {

	protected $compare_against;
    protected $message = '%s no coincide con su campo de verificación.';


	/**
	 * Constructor
	 *
	 * @param string Field to compare against
	 * @return void
	 **/
	public function __construct($compare_against) {
		$this->compare_against = $compare_against;
	}

	/**
	 * Validate this Rule
	 *
	 * @param string Field name
	 * @param string Field value
	 * @param Validator Validator object
	 * @return bool True if rule passes
	 **/
	public function validate($field, $value, $validator) {
		$value2 = $validator->getData($this->compare_against);
		return $value === $value2;
	}

	/**
	 * Return error message for this Rule
	 *
	 * @param string Field name
	 * @param string Field value
	 * @param Validator Validator object
	 * @return string Error message
	 **/
	public function getError($field, $value, $validator) {
		return sprintf($this->message, $validator->getLabel($field));
	}

}
