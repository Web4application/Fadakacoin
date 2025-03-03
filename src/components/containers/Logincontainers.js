import React, { useState } from 'react';
import LoginComponent from '../components/LoginComponent';
import { login } from '../services/authService';

const LoginContainer = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const handleLogin = async () => {
        try {
            await login(username, password);
        } catch (err) {
            setError('Login failed. Please try again.');
        }
    };

    return (
        <LoginComponent
            username={username}
            password={password}
            onUsernameChange={setUsername}
            onPasswordChange={setPassword}
            onLogin={handleLogin}
            error={error}
        />
    );
};

export default LoginContainer;
