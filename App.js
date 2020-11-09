/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  Button,
  StatusBar,
  NativeModules
} from 'react-native';
// import ImagePicker from 'react-native-image-crop-picker';
const {RNImagePicker}= NativeModules;
const App = () => {
  const onPress = () => {
    RNImagePicker.openImagePicker()
  }
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
          <Button title="open" onPress={onPress} />
      </SafeAreaView>
    </>
  );
};

export default App;
