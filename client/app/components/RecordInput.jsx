import React from 'react';

export default class RecordInput extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			xhr: null,
		}
	}

	render () {

		return (
			<label className='record-label'>
				{this.props.name}
				<br/>
				<input type='number' pattern="[0-9]{3}" min="0" max="1000" onChange={(e)=> {this.props.handleInput(e, this.props.name)}}/>
			</label>
		);
	}
}
