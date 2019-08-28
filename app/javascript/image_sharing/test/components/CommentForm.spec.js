/* eslint-env mocha */

import sinon from 'sinon';
import { shallow, mount } from 'enzyme/build';
import { expect, assert } from 'chai';
import React from 'react';
import CommentForm from '../../components/CommentForm';
import * as Helper from '../../utils/helper';

describe('<CommentForm />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<CommentForm />);
    assert(wrapper.contains('Your name:'));
    assert(wrapper.contains('Comments:'));
  });

  it('should show alert when message state is set', () => {
    const wrapper = shallow(<CommentForm />);
    wrapper.setState({
      message: {
        text: 'There was an error submitting your feedback :(',
        color: 'danger'
      }
    });

    assert(wrapper.contains('There was an error submitting your feedback :('));
  });

  describe('onSubmit', () => {
    let sandbox;
    let formSubmit;

    beforeEach(() => {
      sandbox = sinon.createSandbox();
      formSubmit = {
        target: { elements: [] },
        preventDefault: () => {}
      };
    });

    afterEach(() => {
      sandbox.restore();
    });

    it('sets results when API request succeeds', () => {
      const wrapper = mount(<CommentForm />);
      const stub = sandbox.stub(Helper, 'post').returns(Promise.resolve());
      sandbox.stub(Helper, 'formEventToValues').returns('formValues');

      return wrapper.instance().handleSubmit(formSubmit).then(() => {
        expect(stub.getCall(0).args[0]).to.equal('/api/feedbacks');
        expect(stub.getCall(0).args[1]).to.equal('formValues');

        assert.isEmpty(wrapper.state().message.text);
        assert.isEmpty(wrapper.state().message.color);
      });
    });

    it('sets error when API request fails', () => {
      const wrapper = mount(<CommentForm />);
      const stub = sandbox.stub(Helper, 'post').returns(Promise.reject());
      sandbox.stub(Helper, 'formEventToValues').returns('formValues');

      return wrapper.instance().handleSubmit(formSubmit).then(() => {
        expect(stub.getCall(0).args[0]).to.equal('/api/feedbacks');
        expect(stub.getCall(0).args[1]).to.equal('formValues');

        expect(wrapper.state().message.text)
          .to.equal('There was an error submitting your feedback :(');
        expect(wrapper.state().message.color).to.equal('danger');
      });
    });
  });
});
