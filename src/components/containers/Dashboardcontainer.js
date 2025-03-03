import React, { useEffect, useState } from 'react';
import DashboardComponent from '../components/DashboardComponent';
import { getUserData } from '../services/userService';

const DashboardContainer = () => {
    const [userData, setUserData] = useState(null);

    useEffect(() => {
        const fetchUserData = async () => {
            const data = await getUserData();
            setUserData(data);
        };
        fetchUserData();
    }, []);

    return <DashboardComponent userData={userData} />;
};

export default DashboardContainer;
