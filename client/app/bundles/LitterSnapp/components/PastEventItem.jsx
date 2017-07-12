import PropTypes from 'prop-types';
import React from 'react';

const PastEventItem = ({ event }) => (
  <li key={event.id} className='event-list-item'>
    <a href={event.url}>
      <div>
        <p>{event.title}</p>
        <p>{event.planned_date} @ {event.planned_time}</p>
        <p>Joined: {event.joined}</p>
      </div>
    </a>
    <hr/>
  </li>
);

PastEventItem.propTypes = {
  event: PropTypes.object.isRequired,
  google_map: PropTypes.object,
  tab: PropTypes.string
};

export default PastEventItem;
