import { combineReducers } from 'redux';
import {
  FETCH_TASKS_REQUEST, FETCH_TASKS_SUCCESS, FETCH_TASKS_FAILURE,
  ADD_TASK_REQUEST, ADD_TASK_SUCCESS, ADD_TASK_FAILURE,
  DELETE_TASK_SUCCESS } from '../actions';

function tasks(state = [], action) {
  switch (action.type) {
    case FETCH_TASKS_SUCCESS:
      return [].concat(action.tasks);

    case ADD_TASK_REQUEST:
      return state;

    case ADD_TASK_SUCCESS:
      console.log(action)
      return [
        ...state,
        action.task
      ];

    case ADD_TASK_FAILURE:
      console.error('ADD_TASK_FAILURE');
      return state;

    case DELETE_TASK_SUCCESS:
      return state.filter(task => task.id !== action.task.id)

    default:
      return state;
  }
}

function isLoading(state = false, action) {
  switch (action.type) {
    case FETCH_TASKS_REQUEST:
      return true;

    case FETCH_TASKS_SUCCESS:
    case FETCH_TASKS_FAILURE:
      return false;

    default:
      return state;
  }
}

const taskApp = combineReducers({
  tasks,
  isLoading
});

export default taskApp;