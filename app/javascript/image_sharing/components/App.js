import React from 'react';
import Header from './Header';
import CommentForm from './CommentForm';
import CopyrightFooter from './CopyrightFooter';

export default function App() {
  return (
    <div>
      <Header title="Tell us what you think" />
      <CommentForm />
      <CopyrightFooter />
    </div>
  );
}

/* TODO: Add Prop Types check*/
