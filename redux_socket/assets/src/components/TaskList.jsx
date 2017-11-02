import React, { Component } from 'react';
import Task from './Task';

export default class TaskList extends Component {
  render() {
    if (this.props.isLoading) {
      return (
        <p><em>Loading ...</em></p>
      );
    }

    return (
      <ul>
        {this.props.tasks.map((task, index) =>
          <Task {...task}
                key={index}
                onClickDelete={() => this.props.onTaskClickDelete(task)}
                onClick={() => this.props.onTaskClick(task)} />
        )}
      </ul>
    );
  }
}
