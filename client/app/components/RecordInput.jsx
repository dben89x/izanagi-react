import React from 'react';

export default class RecordInput extends React.Component {
	constructor(props) {
		super(props)
		this.state = {
			xhr: null,
		}
	}

	handleInput =()=> {

	}

	render () {

		return (
			<input className='record-input'>
				<label>
					{this.props.name}
					<input className="record-input" onChange={(e)=> {this.handleInput(e)}}/>
				</label>
			</form>
		);
	}
}
