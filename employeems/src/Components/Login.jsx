import React, { useState } from 'react'
import './style.css'
import axios from 'axios'
import { useNavigate } from 'react-router-dom';
import { FaLock } from 'react-icons/fa';

const Login = () => {
    const [values, setValues] = useState({
        email: '',
        password: ''
    })
    const [isChecked, setIsChecked] = useState(false); 
    const [error, setError] = useState(null)
    const navigate = useNavigate()
    axios.defaults.withCredentials = true;
    const handleSubmit = (event) => {
        event.preventDefault()
          for (const key in values) {
            if ( values.hasOwnProperty(key) &&values[key] === "") {
                setError(`Please fill in the ${key} field`);
              return;
            }
          }
          if (!isChecked) {
            setError('Please agree to the terms & conditions.');
            return;
        }
          
        axios.post('http://localhost:3000/auth/adminlogin', values)
        .then(result => {
            if(result.data.loginStatus) {
                localStorage.setItem("valid", true)
                navigate('/dashboard')
            } else {
                setError(result.data.Error)
            }
        })
        .catch(err => console.log(err))
    }

  return (
    <div className='d-flex justify-content-center align-items-center vh-100 loginPage'>
        <div className='p-3 rounded w-25 border loginForm'>
            <div className='text-warning'>
                {error && error}
            </div>
            <div className='d-flex justify-content-center align-items'>
            <FaLock size={50} className='mx-2' />
            </div>
            

            
            <form onSubmit={handleSubmit}>
                <div className='mb-3'>
                    <label htmlFor="email"><strong>Email:</strong></label>
                    <input type="email" name='email' autoComplete='off' placeholder='Enter Email'
                     onChange={(e) => setValues({...values, email : e.target.value})} className='form-control rounded-0'/>
                </div>
                <div className='mb-3'> 
                    <label htmlFor="password"><strong>Password:</strong></label>
                    <input type="password" name='password' placeholder='Enter Password'
                     onChange={(e) => setValues({...values, password : e.target.value})} className='form-control rounded-0'/>
                </div>
                <button className='btn btn-success w-100 rounded-0 mb-2'>Log in</button>
                <div className='mb-1'> 
                <input
                type="checkbox"
                    name="tick"
                     id="tick"
                     className='me-2'
                    checked={isChecked} // Bind checkbox status to the state
                    onChange={() => setIsChecked(!isChecked)}
                        />
                    <label htmlFor="password">You are Agree with terms & conditions</label>
                </div>
            </form>
        </div>
    </div>
  )
}

export default Login