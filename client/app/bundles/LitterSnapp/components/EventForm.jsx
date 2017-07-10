import PropTypes from 'prop-types';
import React, { Component } from 'react';
import ReactOnRails from 'react-on-rails';

export default class EventForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      latLng: ''
    }
  }

  componentWillReceiveProps(nextProps) {

    if(nextProps.clickLatLng.hasOwnProperty('lat')) {
      // Remove existing marker if there is one
      if(this.marker){
        this.marker.setMap(null);
      }
      // Update state and create marker for new lat lng from props
      this.setState({latLng: `${nextProps.clickLatLng.lat()}, ${nextProps.clickLatLng.lng()}`});
      this.marker = new google.maps.Marker({
        position: {lat: nextProps.clickLatLng.lat(), lng: nextProps.clickLatLng.lng()},
        map: nextProps.google_map,
      });
    }
  }

  render() {
    return (
      <div className='event-form'>
        <p>Feel like cleaning up some litter, but there are no clean up events near you?</p>
        <p>Then why not organize an event yourself?</p>
        <p>It's <b>easy!</b> Just follow the steps below:</p>
        <br/>
        <form
          className='new_event'
          id='new_event'
          action='/events'
          method='post'
          acceptCharset='UTF-8'
        >
          <input
            type='hidden'
            name='authenticity_token'
            value={ReactOnRails.authenticityToken()}
          />
          <div className='form-group'>
            <label htmlFor="event_planned_date">When?</label>
            <input
              className='form-control'
              type='date'
              name='event[planned_date]'
              id='event_planned_date'
            />
          </div>
          <div className='form-group'>
            <label htmlFor="event_planned_time">At what time?</label>
            <input
              className='form-control'
              type='time'
              name='event[planned_time]'
              id='event_planned_date'
            />
          </div>
          <div className='form-group'>
            <label htmlFor="event_planned_time">Where?</label>
            <input
              className='form-control'
              type='text'
              placeholder='Click somewhere on the map!'
              value={this.state.latLng}
              name='event[location]'
              id='event_location'
            />
          </div>
          <input
            type='submit'
            name='commit'
            value='Submit'
            className='btn btn-primary'
            data-disable-with='Submit'
          />
        </form>
      </div>
    );
  }
}

EventForm.propTypes = {
   google_map: PropTypes.object,
   clickLatLng: PropTypes.object
};
