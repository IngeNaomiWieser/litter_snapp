import PropTypes from 'prop-types';
import React, { Component } from 'react';
import EventItem from './EventItem';
import PastEventItem from './PastEventItem';

export default class EventList extends Component {
  renderList() {
    if(this.props.tab == 'past_index'){
      return this.props.events.map((event) => {
        return <PastEventItem key={event.id} event={event} />;
      });
    } else {
      return this.props.events.map((event) => {
        return <EventItem key={event.id} event={event} />;
      });
    }
  }

  render() {
    return (
      <div className='event-list'>
        <ul className='event-list'>
          {this.renderList()}
        </ul>
      </div>
    )
  }
}


EventList.propTypes = {
  events: PropTypes.array,
  past_events: PropTypes.array,
  tab: PropTypes.string.isRequired
};

// export default EventList;
