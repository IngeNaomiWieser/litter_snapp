import ReactOnRails from 'react-on-rails';

import HelloWorldApp from './HelloWorldApp';
import MapSideBarApp from './MapSideBarApp';
import Map from '../components/Map';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Map,
  MapSideBarApp,
});
