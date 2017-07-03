import PropTypes from 'prop-types';
import React from 'react';

const EventItem = ({ event }) => (
  <li key={event.id} className='event-list-item'>
    <p>{event.planned_date}</p>
    <p>{event.planned_time}</p>
    <p>Joined: {event.joined}</p>
    <a href={event.url}>Details</a>
    <hr/>
  </li>
);

EventItem.propTypes = {
  event: PropTypes.object.isRequired,
};

export default EventItem;
