import { requireNativeComponent } from 'react-native';
import React, { Component, PropTypes } from 'react';

const RCTAirPlayButton = requireNativeComponent('RCTAirPlayButton', AirPlayButton);

class AirPlayButton extends Component {
  render() {
    return (<RCTAirPlayButton {...this.props} />);
  }
}

module.exports = AirPlayButton;
