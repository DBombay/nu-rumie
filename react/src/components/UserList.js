import React, { Component } from 'react';
import User from './User';

class UserList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      users: [],
      group: 1
    };
    this.getUsers = this.getUsers.bind(this);
    this.setUsers = this.setUsers.bind(this);
  }

  getUsers() {
    fetch('https://nu-rumie.herokuapp.com/api/v1/users.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ users: body });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`)
    );
  }

  setUsers(page) {
    this.setState({ group: page })
  }

  componentDidMount() {
    this.getUsers();
  }

  render() {
    if (this.state.users.length > 0) {
      let groupSize = 3;
      let pageSize = 4;
      let users = this.state.users.map((user, index) => {
        return (
          <User
            id={user.id}
            key={index + 1}
            first_name={user.first_name}
            last_name={user.last_name}
            age={user.age}
            gender={user.gender}
            avatar={user.avatar}
          />
        );
      })

      return(
        <div>
        {users}
        </div>
      );

    } else {
      return (
        <div>
          looks like we need more users!
        </div>
      );
    }
  }
}

export default UserList;
