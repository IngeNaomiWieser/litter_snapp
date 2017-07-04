import PropTypes from 'prop-types';
import React, { Component } from 'react';

export default class Map extends Component {

  componentDidMount() {
    new google.maps.Map(this.refs.map, {
      center: {lat: 49.2700, lng: -123.110000},
      zoom: 12
    });
  }

  render() {
    const style = {
      width: '80%',
      height: 'calc(100vh - 50px)'
    }

    return (
      <div ref='map' style={style}>
      </div>
    );
  }
}
