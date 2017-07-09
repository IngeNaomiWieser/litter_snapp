import PropTypes from 'prop-types';
import React, { Component } from 'react';

export default class Map extends Component {
  constructor(props) {
    super(props);
    console.log(this.props);
  }


  componentDidMount() {
    this.map = new google.maps.Map(this.refs.map, {
      center: {lat: 49.2700, lng: -123.110000},
      zoom: 12
    });

    const litter_icon = {
      url: "http://localhost:3000/images/blue_pin.png",
      size: new google.maps.Size(28,28),
      origin: new google.maps.Point(0,0)
    };

    const home_icon = {
      url: "http://localhost:3000/images/bluehome.png",
      size: new google.maps.Size(32,32),
      origin: new google.maps.Point(0,0)
    };

    // Add markers
    this.markers = this.props.litters.map((litter) => {
      new google.maps.Marker({
        position: {lat: litter.lat, lng: litter.lng},
        map: this.map,
        icon: litter_icon,
        zIndex: 5
      });
    });

    this.homeMarker = new google.maps.Marker({
      position: {lat: this.props.user_location.latitude, lng: this.props.user_location.longitude},
      map: this.map,
      icon: home_icon,
      zIndex: 10
    });
  }

  render() {
    const style = {
      maxWidth: 'calc(100vw - 200px)',
      width: '75%',
      minWidth: 'calc(100vw - 300px)',
      height: 'calc(100vh - 50px)'
    }

    return (
      <div className="map-container" ref='map' style={style}>
      </div>
    );
  }
}

Map.propTypes = {
  litters: PropTypes.array,
  tab: PropTypes.string.isRequired,
  user_location: PropTypes.object
};
