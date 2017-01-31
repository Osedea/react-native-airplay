import { requireNativeComponent } from 'react-native';
import React, { Component, PropTypes } from 'react';

let AirPlayButton = requireNativeComponent('AirPlayButton', AirPlayButton);

class AirPlayButton extends Component {
  render() {
    return (<AirPlayButton {...this.props} />);
  } 
}

module.exports = AirPlayButton;