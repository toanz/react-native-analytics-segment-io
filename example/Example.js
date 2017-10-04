import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import Analytics from 'react-native-analytics-segment-io';

export default class example extends Component {
  componentDidMount() {
    Analytics.setup('add-segment-key-here', { enableAdvertisingTracking: true })
    Analytics.track('test', {})
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native Analytics Segment IO
        </Text>
        <Text style={styles.instructions}>
          Looks like everything went well. No huge errors at least.
          You might want to check the console to be sure.
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
    marginBottom: 5,
  },
})