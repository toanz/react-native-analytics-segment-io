import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import Analytics, { Constants } from 'react-native-analytics-segment-io';

export default class example extends Component {
  componentDidMount() {
    Analytics.setup('add-segment-key-here', { [Constants.enableAdvertisingTracking]: true })
      .then(() => {
        Analytics.track('test', {})
      })
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          {`React Native Analytics Segment IO`}
        </Text>
        <Text style={styles.instructions}>
          {`Remember to add your own segment key, before running this example.`}
        </Text>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    margin: 10,
  },
})
