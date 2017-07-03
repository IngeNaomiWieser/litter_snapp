import PropTypes from 'prop-types';
import React, { Component } from 'react';

export default class MapSideBar extends Component {
  render() {
    return (
      <div className='mapsidebar'>
        <ul className='mapsidebar-tabs'>
          <li>Events</li>
          <li>Organize</li>
          <li>Past</li>
        </ul>
        <p>Just some sidebar for now...</p>

      </div>
    );
  }
}
