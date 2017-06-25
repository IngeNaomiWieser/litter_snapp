import React, {Component} from 'react';

export default class NavBar extends Component {
  render() {
    return (
      <nav className="container-fluid navbar navbar-custom">
        <ul className="nav navbar-nav">
          <li className="active"><a href="#">Home</a></li>
          <li className="pull-right"><a href="#">Sign In</a></li>
        </ul>
      </nav>
    );
  }
}
