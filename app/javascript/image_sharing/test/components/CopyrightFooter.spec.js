/* eslint-env mocha */

import { shallow } from 'enzyme/build';
import assert from 'assert';
import React from 'react';
import CopyrightFooter from '../../components/CopyrightFooter';

describe('<CopyrightFooter />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<CopyrightFooter />);
    assert(wrapper.contains('Copyright: Appfolio Inc. Onboarding'));
  });
});
