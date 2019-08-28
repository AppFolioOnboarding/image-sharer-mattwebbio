import { Button, Form, FormGroup, Label, Input, Alert } from 'reactstrap';
import React from 'react';
import { formEventToValues, post } from '../utils/helper';


export default class CommentForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      message: {
        text: '',
        color: ''
      }
    };
  }

  handleSubmit = (event) => {
    event.preventDefault();

    return post('/api/feedbacks', formEventToValues(event)).catch(() => {
      this.setState({
        message: {
          text: 'There was an error submitting your feedback :(',
          color: 'danger'
        }
      });
    });
  };

  render() {
    return (
      <div>
        <Form onSubmit={this.handleSubmit}>
          <FormGroup>
            <Label for="name">Your name:</Label>
            <Input type="text" name="name" />
          </FormGroup>
          <FormGroup>
            <Label for="comment">Comments:</Label>
            <Input type="textarea" name="comment" />
          </FormGroup>
          <Button color="primary" type="submit">Submit</Button>
        </Form>

        {this.state.message.text &&
          <div className="pt-5">
            <Alert color={this.state.message.color}>
              {this.state.message.text}
            </Alert>
          </div>
        }
      </div>
    );
  }
}
