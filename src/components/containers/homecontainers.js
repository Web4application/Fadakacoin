import React, { useEffect, useState } from 'react';
import HomeComponent from '../components/HomeComponent';
import { fetchData } from '../services/apiService';

const HomeContainer = () => {
    const [data, setData] = useState([]);

    useEffect(() => {
        const getData = async () => {
            const response = await fetchData();
            setData(response);
        };
        getData();
    }, []);

    return <HomeComponent data={data} />;
};

export default HomeContainer;
