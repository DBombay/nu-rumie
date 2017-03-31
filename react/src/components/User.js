import React, { Component } from 'react';

class User extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let classNames = require('classnames');

    let gridClasses = classNames({
      'card': true,
      'medium-4': true,
      'columns': true
    })

    let viewClasses = classNames({
      'hollow': true,
      'button': true,
      'white': true,
      'view': true
    })

    let avatarUrl= ''
    if (this.props.avatar.url == null) {this.props.avatar.url = avatarUrl}

    return (
      <div className={gridClasses}>
        <div className="card-divider">
          <div className="image-container">
            <img src={avatarUrl} className="image" />
          </div>
          <div className="card-section">
            <div className="info">
              <h4> {this.props.first_name.toLowerCase()} {this.props.last_name.toLowerCase()} </h4>
              <h5> age: {this.props.age}</h5>
              <h5> gender: {this.props.gender.toLowerCase()}</h5>
            </div>
            <div className="viewContainer">
              <a href={`/users/${this.props.id}`} className={viewClasses}>see profile</a>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default User;
