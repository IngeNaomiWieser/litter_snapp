// Simple example of a React "smart" component

import { connect } from 'react-redux';
import MapSideBar from '../components/MapSideBar';
import * as actions from '../actions/eventActionCreators';

// Which part of the Redux global state does our component want to receive as props?
const mapStateToProps = (state) => ({
  tab: state.tab,
  planned_events: state.planned_events,
  past_events: state.past_events
});

// Don't forget to actually use connect!
// Note that we don't export HelloWorld, but the redux "connected" version of it.
// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(mapStateToProps, actions)(MapSideBar);
