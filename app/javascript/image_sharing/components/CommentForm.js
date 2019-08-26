import { Button, Form, FormGroup, Label, Input } from 'reactstrap';
import React from 'react';

export default function CommentForm() {
  return (
    <Form>
      <FormGroup>
        <Label for="name">Your name:</Label>
        <Input type="text" name="name" />
      </FormGroup>
      <FormGroup>
        <Label for="comment">Comments:</Label>
        <Input type="textarea" name="comment" />
      </FormGroup>
      <Button color="primary">Submit</Button>
    </Form>
  );
}
