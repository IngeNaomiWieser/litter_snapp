import PropTypes from 'prop-types';
import React, { Component } from 'react';
import MapSideBar from './MapSideBar'

export default class Map extends Component {
  constructor(props) {
    super(props);

    this.state = {
      google_map: {},
      clickLatLng: {}
    };
  }

  componentDidMount() {
    this.googleMap = new google.maps.Map(this.refs.map, {
      center: {lat: 49.2700, lng: -123.110000},
      zoom: 12
    });

    google.maps.event.addListener(this.googleMap, 'click', (e) => {
      this.setState({clickLatLng: e.latLng});
    })

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

      // Set content for infobox
      const infoContent = `<div><img src=${litter.img_url}/></div`;

      // Create actual infobox
      const infowindow = new google.maps.InfoWindow({
        content: infoContent
      });

      // Create marker
      const marker = new google.maps.Marker({
        position: {lat: litter.lat, lng: litter.lng},
        map: this.googleMap,
        icon: litter_icon,
        zIndex: 5
      });

      // Add click event to open infobox
      marker.addListener('click', function() {
        infowindow.open(this.googleMap, marker);
      });
    });

    this.homeMarker = new google.maps.Marker({
      position: {lat: this.props.user_location.latitude, lng: this.props.user_location.longitude},
      map: this.googleMap,
      icon: home_icon,
      zIndex: 10
    });

    this.setState({ google_map: this.googleMap });
  }

  render() {
    const style = {
      maxWidth: 'calc(100vw - 200px)',
      width: '75%',
      minWidth: 'calc(100vw - 300px)',
      height: 'calc(100vh - 50px)'
    }

    return (
      <div>
        <div className="map-container" ref='map' style={style}>
        </div>
        <MapSideBar
          tab={this.props.tab}
          planned_events={this.props.planned_events}
          past_events={this.props.past_events}
          updateTab={this.props.updateTab}
          google_map={this.state.google_map}
          clickLatLng={this.state.clickLatLng}
        />
      </div>
    );
  }
}

Map.propTypes = {
  litters: PropTypes.array,
  tab: PropTypes.string.isRequired,
  user_location: PropTypes.object,
  updateTab: PropTypes.func.isRequired,
  planned_events: PropTypes.array.isRequired,
  past_events: PropTypes.array.isRequired,
};
