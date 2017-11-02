import React, { Component } from 'react';
import { connect } from 'react-redux';
import { deleteTask, fetchTasks, addTask} from '../actions';
import AddTask from '../components/AddTask';
import TaskList from '../components/TaskList';

class App extends Component {
  componentDidMount() {
    let { dispatch } = this.props;
    dispatch(fetchTasks());
  }

  render() {
    const { dispatch, tasks, isLoading} = this.props;

    return (
      <div>
        <AddTask
          onAddClick={text =>
            dispatch(addTask(text))
          } />
        <TaskList
          tasks={tasks}
          isLoading={isLoading}
          onTaskClickDelete={task =>
            dispatch(deleteTask(task))
          } />
      </div>
    );
  }
}

function select(state) {
  return {
    tasks: state.tasks,
    isLoading: state.isLoading
  };
}

// Wrap the component to inject dispatch and state into it
export default connect(select)(App);