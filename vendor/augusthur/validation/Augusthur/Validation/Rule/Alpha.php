<?php namespace Augusthur\Validation\Rule;

/**
 * Ensure all characters are in a-z
 *
 * @package Validation
 * @author Luke Lanchester <luke@lukelanchester.com>
 **/
class Alpha implements \Augusthur\Validation\Rule {

    protected $message = '%s debe estar compuesto únicamente de letras.';
    protected $extrachars;

    public function __construct($extrachars = array()) {
		$this->extrachars = $extrachars;
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
        return preg_match("/[^[:alpha:]]/ui", str_replace($this->extrachars, '', $value)) == 0;
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
