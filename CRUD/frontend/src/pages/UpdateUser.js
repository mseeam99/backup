import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Button, Form } from 'react-bootstrap';
import { useNavigate, useParams } from 'react-router-dom';

function UpdateUser() {
  const { id } = useParams();
  const [Name, setName] = useState();
  const [Age, setAge] = useState();
  const [Sex, setSex] = useState();
  const [Occupation, setOccupation] = useState();
  const [Education, setEducation] = useState();
  const [Email, setEmail] = useState();
  
  const navigate = useNavigate();

  useEffect(() => {
    axios
      .get('http://localhost:3001/getUser/' + id)
      .then((result) => {
        console.log(result);
      })
      .catch((err) => console.log(err));
  }, ); 
  

  function handleSubmit(e) {
    e.preventDefault();
    axios
      .put('http://localhost:3001/updateUser/' + id, { Name, Age, Sex, Occupation, Education, Email })
      .then((result) => {
        console.log(result);
        navigate('/');
      })
      .catch((err) => console.log(err));
  }

  return (
    <div className='d-flex vh-100 bg-primary justify-content-center align-items-center'>
      <div className='w-50 bg-white rounded p-3'>
      <Form onSubmit={handleSubmit}>

<h2 style={{color:'green',fontWeight:'bold',marginBottom:'15px'}}>UPDATE USER</h2>

<Form.Group className="mb-3" controlId="formBasicName">
  <Form.Control type="text" placeholder="Your Name"   onChange={(e)=>{setName(e.target.value)}}/>
</Form.Group>

<Form.Group className="mb-3" controlId="formBasicAge">
  <Form.Control type="text" placeholder="Enter Age"   onChange={(e)=>{setAge(e.target.value)}}/>
</Form.Group>

<Form.Group className="mb-3" controlId="formBasicSex">
  <Form.Control type="text" placeholder="Enter Sex"  onChange={(e)=>{setSex(e.target.value)}}/>
</Form.Group>

<Form.Group className="mb-3" controlId="formBasicOccupation">
  <Form.Label></Form.Label>
  <Form.Control type="text" placeholder="Your Occupation"  onChange={(e)=>{setOccupation(e.target.value)}}/>
</Form.Group>

<Form.Group className="mb-3" controlId="formBasicUniversity">
  <Form.Control type="text" placeholder="Enter University"   onChange={(e)=>{setEducation(e.target.value)}}/>
</Form.Group>

<Form.Group className="mb-3" controlId="formBasicEmail">
  <Form.Control type="email" placeholder="Enter email"  onChange={(e)=>{setEmail(e.target.value)}}/>
</Form.Group>

<Button variant="primary" type="submit">
  UPDATE
</Button>

</Form>
      </div>
    </div>
  );
}

export default UpdateUser;
