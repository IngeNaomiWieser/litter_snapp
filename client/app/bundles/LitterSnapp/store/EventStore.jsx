import { createStore } from 'redux';
import eventReducer from '../reducers/eventReducer';

const configureStore = (railsProps) => (
  createStore(eventReducer, railsProps)
);

export default configureStore;
