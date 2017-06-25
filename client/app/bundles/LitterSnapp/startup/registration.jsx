import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';
import NavBar from '../components/NavBar';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
  NavBar,
});
