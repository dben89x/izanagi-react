import React from 'react';

export default class RecordForm extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			xhr: null,
		}
	}

	render () {

		const recordInputs = this.props.recordInputs.map( (recordInput) => <RecordInput name={recordInput.name}/>)

		return (
			<form className='record-form'>
				{ recordInputs }
			</form>
		);
	}
}
