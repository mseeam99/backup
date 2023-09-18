import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import { Link } from 'react-router-dom';

function Users() {

  const [users, setUsers] = useState([]);

  useEffect(() => {
    axios
      .get('http://localhost:3001')
      .then(result => setUsers(result.data))
      .catch(err => console.log(err));
  }, []);

  function handleDelete(id){
    axios.delete('http://localhost:3001/deleteUser/'+id)
    .then(res=>{console.log(res)
      window.location.reload()
    })
    .catch(err=>console.log(err))

  }

  return (
    <div className='d-flex vh-100 bg-primary justify-content-center align-items-center'>
      <div className='w-55 bg-white rounded p-3'>
        <Link to='/create' className='btn btn-success'>
          Add +
        </Link>
        <table className='table'>
          <thead>
            <tr>
              <th>Name</th>
              <th>Age</th>
              <th>Sex</th>
              <th>Occupation</th>
              <th>University</th>
              <th>Email</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {users.map((user) => (
              <tr key={user._id}>
                <td>{user.Name}</td>
                <td>{user.Age}</td>
                <td>{user.Sex}</td>
                <td>{user.Occupation}</td>
                <td>{user.Education}</td>
                <td>{user.Email}</td>
                <td>
                  <Link to={`/update/${user._id}`} className='btn btn-success'>
                    UPDATE
                  </Link>
                  <Button variant='danger' onClick={(e)=>handleDelete(user._id)}>Delete</Button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default Users;
