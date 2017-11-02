import { configureChannel } from './channel';

let channel = configureChannel();
console.log(channel)

// -------- Action Types ------------

export const FETCH_TASKS_REQUEST = 'FETCH_TASKS_REQUEST';
export const FETCH_TASKS_SUCCESS = 'FETCH_TASKS_SUCCESS';
export const FETCH_TASKS_FAILURE = 'FETCH_TASKS_FAILURE';

export const ADD_TASK_REQUEST = 'ADD_TASK_REQUEST';
export const ADD_TASK_SUCCESS = 'ADD_TASK_SUCCESS';
export const ADD_TASK_FAILURE = 'ADD_TASK_FAILURE';

export const DELETE_TASK_SUCCESS = 'DELETE_TASK_SUCCESS';

// -------- Action Creators ------------

function fetchTasksRequest() {
  return { type: FETCH_TASKS_REQUEST };
}

function fetchTasksSuccess(tasks) {
  return { type: FETCH_TASKS_SUCCESS, tasks };
}

function fetchTasksFailure(error) {
  return { type: FETCH_TASKS_FAILURE, error };
}

function addTaskRequest(text) {
  return { type: ADD_TASK_REQUEST, text };
}

function addTaskSuccess(task) {
  return { type: ADD_TASK_SUCCESS, task };
}

function addTaskFailure(text, error) {
  return { type: ADD_TASK_FAILURE, text, error };
}

function deleteTaskSuccess(task) {
  return { type: DELETE_TASK_SUCCESS, task };
}

export function addTask(text) {
  return dispatch => {
    dispatch(addTaskRequest(text));

    let payload = {
      label: text,
      completed: false
    };

    channel.push('new:task', payload)
      .receive('ok', response => {
        console.log('created Task', response);
      })
      .receive('error', error => {
        console.error(error);
        dispatch(addTaskFailure(text, error));
      });
  };
}

export function fetchTasks() {
  return dispatch => {
    dispatch(fetchTasksRequest());

    channel.join()
      .receive('ok', messages => {
        console.log('catching up', messages);
        dispatch(fetchTasksSuccess(messages.tasks.data));
      })
      .receive('error', reason => {
        console.log('failed join', reason);
        dispatch(fetchTasksFailure(reason));
      })

    channel.on('new:task', task => {
      console.log('new:task', task);
      dispatch(addTaskSuccess(task));
    });

    channel.on('delete:task', task => {
      console.log('delete:task', task);
      dispatch(deleteTaskSuccess(task));
    });
  };
}

export function deleteTask(task) {
  return dispatch => {

    const payload = { id: task.id}

    channel.push('delete:task', payload)
      .receive('ok', response => {
        console.log('deleted task', response);
      })
      .receive('error', error => {
        console.error(error);
      });
  }
}