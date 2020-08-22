import { NativeModules } from 'react-native';

type AvatarHexagonType = {
  multiply(a: number, b: number): Promise<number>;
};

const { AvatarHexagon } = NativeModules;

export default AvatarHexagon as AvatarHexagonType;
