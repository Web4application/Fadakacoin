import axios from 'axios';

const API_URL = 'https://api.example.com/items';

export const fetchItems = async () => {
    const response = await axios.get(API_URL);
    return response.data;
};

