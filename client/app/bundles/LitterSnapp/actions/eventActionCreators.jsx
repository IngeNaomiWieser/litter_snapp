/* eslint-disable import/prefer-default-export */

import { EVENT_TAB_CLICK } from '../constants/eventConstants';

export const updateTab = (tab) => ({
  type: EVENT_TAB_CLICK,
  show: tab
});
