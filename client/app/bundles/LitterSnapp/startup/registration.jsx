import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';
import MapSideBar from '../components/MapSideBar';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  MapSideBar,
});
