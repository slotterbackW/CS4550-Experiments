import React, { Component } from 'react';

export default class Task extends Component {
  render() {
    return (
      <li onClick={this.props.onClick}>
        {this.props.label}
        <span onClick={e => {e.stopPropagation(); this.props.onClickDelete()}} style={{float: 'right'}}>✘</span>
      </li>
    )
  }
}
