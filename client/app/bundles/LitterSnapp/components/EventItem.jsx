import PropTypes from 'prop-types';
import React, { Component } from 'react';

export default class EventItem extends Component {
  constructor(props) {
    super(props)

  }


  whatTheF() {
    console.log(this.props);
  }

  render() {
    return (
      <li
        key={this.props.event.id}
        className='event-list-item'
        onClick={(e) => this.whatTheF()}
      >
        <p>{this.props.event.planned_date}</p>
        <p>{this.props.event.planned_time}</p>
        <p>Joined: {this.props.event.joined}</p>
        <a href={this.props.event.url}>Details</a>
        <hr/>
      </li>
    )
  }
}

EventItem.propTypes = {
  event: PropTypes.object.isRequired,
  google_map: PropTypes.object
};
