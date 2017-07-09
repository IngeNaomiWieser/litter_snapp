import PropTypes from 'prop-types';
import React, { Component } from 'react';
import EventForm from './EventForm';
import EventList from './EventList';

export default class MapSideBar extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div className='mapsidebar'>
        <ul className='mapsidebar-tabs'>
          <li
            className={this.props.tab == 'index' ? 'active-item' : ''}
            onClick={(e) => this.props.updateTab('index')}
          >Planned</li>
          <li
            className={this.props.tab == 'create' ? 'active-item' : ''}
            onClick={(e) => this.props.updateTab('create')}
          >Organize</li>
          <li
            className={this.props.tab == 'past_index' ? 'active-item' : ''}
            onClick={(e) => this.props.updateTab('past_index')}
          >Past</li>
        </ul>
        { this.props.tab == 'past_index' &&
          <EventList events={this.props.past_events} tab={this.props.tab} google_map={this.props.google_map} />
        }
        { this.props.tab == 'create' &&
          <EventForm google_map={this.props.google_map} />
        }
        { this.props.tab == 'index' &&
          <EventList events={this.props.planned_events} tab={this.props.tab} google_map={this.props.google_map} />
        }
      </div>
    )
  }
}

MapSideBar.propTypes = {
  tab: PropTypes.string.isRequired,
  updateTab: PropTypes.func.isRequired,
  planned_events: PropTypes.array.isRequired,
  past_events: PropTypes.array.isRequired,
  google_map: PropTypes.object
};

// export default MapSideBar;
