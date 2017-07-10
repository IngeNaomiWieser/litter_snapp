import ReactOnRails from 'react-on-rails';

import HelloWorldApp from './HelloWorldApp';
// import MapSideBarApp from './MapSideBarApp';
// import Map from '../components/Map';
import MapApp from './MapApp';


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  MapApp,
});
