import PropTypes from 'prop-types';
import React, { Component } from 'react';

export default class EventItem extends Component {
  constructor(props) {
    super(props)

  }

  componentWillReceiveProps(nextProps) {
    // console.log(nextProps);

    if(nextProps.google_map.hasOwnProperty('mapTypes')){
      const home_icon = {
        url: "http://localhost:3000/images/bluehome.png",
        size: new google.maps.Size(32,32),
        origin: new google.maps.Point(0,0)
      };

      // Add markers
      // if(this.marker){
      //   this.marker.setMap(nextProps.google_map);
      // } else {
        this.marker = new google.maps.Marker({
          position: {lat: nextProps.event.lat, lng: nextProps.event.lng},
          map: nextProps.google_map,
        });
      // }
    }

  }


  animateMarker = () => {
    if(this.marker) {
      this.marker.setAnimation(google.maps.Animation.BOUNCE);
      setTimeout(() => {
        this.marker.setAnimation(null);
      }, 2200);
    } else {
      // Deal with case where marker is not available
    }
  }

  render() {
    return (
      <li
        key={this.props.event.id}
        className='event-list-item'
        onMouseEnter={(e) => this.animateMarker()}
      >
        <p>{this.props.event.planned_date}</p>
        <p>{this.props.event.planned_time}</p>
        <p>Joined: {this.props.event.joined}</p>
        <a href={this.props.event.url}>Details</a>
        <hr/>
      </li>
    )
  }
}

EventItem.propTypes = {
  event: PropTypes.object.isRequired,
  google_map: PropTypes.object,
  tab: PropTypes.string
};
