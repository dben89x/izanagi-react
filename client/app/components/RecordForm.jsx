import React from 'react';
import RecordInput from './RecordInput';
import _ from 'underscore';
import $ from 'jquery';

export default class RecordForm extends React.Component {
	constructor(props) {
		super(props)

		var json = {}
		_.each(this.props.recordInputs, (input)=> { json[input] = '0' })

		this.state = {
			xhr: null,
			uploader: "",
			json: json,
		}
	}

	handleUploader =(event)=> {
		this.setState({uploader: event.target.value})
	}

	handleInput =(event, name)=> {
		var json = this.state.json
		json[name] = event.target.value
		this.setState({json: json})
	}

	handleSubmit =(event)=> {
		event.preventDefault()
		$.ajax({
			url: '/records',
			method: 'post',
			data: {
				'record': {'uploader': this.state.uploader},
				'json': this.state.json
			},
			dataType: 'json',
			success: window.location = '/records'
		})
	}

	render () {
		var count = 0
		const recordInputs = this.props.recordInputs.map( (recordInput) => {
			count += 1
			return <RecordInput key={count} handleInput={this.handleInput} name={recordInput}/>
		})


		return (
			<form className='record-form'>
				<label className='record-label'>
					Uploader
					<br/>
					<input onChange={this.handleUploader}/>
				</label>
				{ recordInputs }
				<input className="new-record-btn" type="submit" onClick={this.handleSubmit}/>
			</form>
		);
	}
}
