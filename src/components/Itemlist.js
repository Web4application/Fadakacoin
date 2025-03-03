import React from 'react';
import PropTypes from 'prop-types';

const ItemList = ({ items }) => {
    return (
        <ul>
            {items.map(item => (
                <li key={item.id}>{item.name}</li>
            ))}
        </ul>
    );
};

ItemList.propTypes = {
    items: PropTypes.array.isRequired
};

export default ItemList;
