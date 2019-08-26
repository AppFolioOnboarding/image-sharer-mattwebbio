/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import Header from '../../components/Header';

describe('<Header />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<Header title="Title" />);
    const title = wrapper.find('header');

    assert.strictEqual(title.length, 1);
    assert.strictEqual(title.text(), 'Title');
  });
});
