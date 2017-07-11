import PropTypes from 'prop-types';
import React, { Component } from 'react';
import EventItem from './EventItem';
import PastEventItem from './PastEventItem';

export default class EventList extends Component {
  constructor(props) {
    super(props);
  }


  renderList() {
    if(this.props.tab == 'past_index'){
      return this.props.events.map((event) => {
        return <PastEventItem
                  key={event.id}
                  event={event}
                  google_map={this.props.google_map}
                  tab={this.props.tab} />;
      });
    } else if (this.props.tab == 'index') {
      return this.props.events.map((event) => {
        return <EventItem
                  key={event.id}
                  event={event}
                  google_map={this.props.google_map}
                  tab={this.props.tab} />;
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
  tab: PropTypes.string.isRequired,
  google_map: PropTypes.object
};

// export default EventList;
