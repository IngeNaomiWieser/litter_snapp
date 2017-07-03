import PropTypes from 'prop-types';
import React from 'react';
import EventForm from './EventForm';
import EventList from './EventList';

const MapSideBar = ({tab, updateTab, planned_events, past_events}) => (
  <div className='mapsidebar'>
    <ul className='mapsidebar-tabs'>
      <li
        className={tab == 'index' ? 'active-item' : ''}
        onClick={(e) => updateTab('index')}
      >Planned</li>
      <li
        className={tab == 'create' ? 'active-item' : ''}
        onClick={(e) => updateTab('create')}
      >Organize</li>
      <li
        className={tab == 'past_index' ? 'active-item' : ''}
        onClick={(e) => updateTab('past_index')}
      >Past</li>
    </ul>
    { tab == 'past_index' &&
      <EventList events={past_events} tab={tab}/>
    }
    { tab == 'create' &&
      <EventForm/>
    }
    { tab == 'index' &&
      <EventList events={planned_events} tab={tab}/>
    }
  </div>
);

MapSideBar.propTypes = {
  tab: PropTypes.string.isRequired,
  updateTab: PropTypes.func.isRequired,
  planned_events: PropTypes.array.isRequired,
  past_events: PropTypes.array.isRequired,
};

export default MapSideBar;
