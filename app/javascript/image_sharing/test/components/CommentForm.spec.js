/* eslint-env mocha */

import { shallow } from 'enzyme/build';
import assert from 'assert';
import React from 'react';
import CommentForm from '../../components/CommentForm';

describe('<CommentForm />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<CommentForm />);
    assert(wrapper.contains('Your name:'));
    assert(wrapper.contains('Comments:'));
  });
});
