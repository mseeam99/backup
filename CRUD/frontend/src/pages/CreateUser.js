import axios from 'axios';
import React, { useState } from 'react';
import { Button, Form } from 'react-bootstrap';
import { useNavigate } from 'react-router-dom';
function CreateUser() {

  const [Name,setName] = useState();
  const [Age,setAge] = useState();
  const [Sex,setSex] = useState();
  const [Occupation,setOccupation] = useState();
  const [Education,setEducation] = useState();
  const [Email,setEmail] = useState();

  const navigate = useNavigate();

  function handleSubmit(e){
    e.preventDefault();
    axios.post("http://localhost:3001/createUser",{Name,Age,Sex,Occupation,Education,Email})
    .then(result=>{
      console.log(result)
      navigate('/')
    })
    .catch(err=>console.log(err))
  }

  return (
    <div className='d-flex vh-100 bg-primary justify-content-center align-items-center'>
      <div className='w-50 bg-white rounded p-3'>

      <Form onSubmit={handleSubmit}>

      <h2 style={{color:'green',fontWeight:'bold',marginBottom:'15px'}}>CREATE USER</h2>

      <Form.Group className="mb-3" controlId="formBasicName">
        <Form.Control type="text" placeholder="Your Name" onChange={(e)=>{setName(e.target.value)}}/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicAge">
        <Form.Control type="text" placeholder="Enter Age"  onChange={(e)=>{setAge(e.target.value)}}/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicSex">
        <Form.Control type="text" placeholder="Enter Sex"  onChange={(e)=>{setSex(e.target.value)}}/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicOccupation">
        <Form.Label></Form.Label>
        <Form.Control type="text" placeholder="Your Occupation"  onChange={(e)=>{setOccupation(e.target.value)}}/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicUniversity">
        <Form.Control type="text" placeholder="Enter University"  onChange={(e)=>{setEducation(e.target.value)}}/>
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicEmail">
        <Form.Control type="text" placeholder="Enter email"  onChange={(e)=>{setEmail(e.target.value)}}/>
      </Form.Group>
   
      <Button variant="primary" type="submit">
        Submit
      </Button>

    </Form>

     


      </div>
    </div>
  )
}

export default CreateUser