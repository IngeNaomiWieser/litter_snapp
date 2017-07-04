// import PropTypes from 'prop-types';
import React from 'react';
import ReactOnRails from 'react-on-rails';

const EventForm = () => (
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

// MapSideBar.propTypes = {
//   tab: PropTypes.string.isRequired,
//   updateTab: PropTypes.func.isRequired,
// };

export default EventForm;
