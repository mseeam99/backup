import 'bootstrap/dist/css/bootstrap.min.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
import CreateUser from './pages/CreateUser';
import UpdateUser from './pages/UpdateUser';
import Users from './pages/Users';

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Users />} ></Route>
        <Route path='/create' element={<CreateUser />} ></Route>
        <Route path='/update/:id' element={<UpdateUser />} ></Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;



