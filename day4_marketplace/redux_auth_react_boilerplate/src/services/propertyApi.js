import Cookies from "js-cookie";

// GET PROPERTIES FETCH
export const getPropertiesFetch = async () => {
  try {
    const response = await fetch('http://localhost:3000/api/v1/properties', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    });

    if (!response.ok) {
      throw new Error('Get Properties failed. Please check your credentials and try again.');
    }

    return response.json()
  } catch (error) {
    return error;
  }
}

// POST NEW PROPERTY FETCH
export const createPropertyFetch = async (title, price, description) => {
  console.log("Attempting to get auth_token from cookies...");
  try {
    console.log("Attempting to get auth_token from cookies...");
    const authToken = JSON.parse(Cookies.get("auth_token"));

    const data = {
      property: {
        title: title,
        price: price,
        description: description,
        user_id: authToken.user_id
      }
    };
    const response = await fetch('http://localhost:3000/api/v1/properties', {
      method: 'POST',
      headers: {
        'Authorization': authToken.token,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });
    //console.log("Response Headers:", [...response.headers.entries()]);
    //console.log(data)
    if (!response.ok) {
      throw new Error('Create Properties failed. Please check your credentials and try again.');
    }

    return response
  } catch (error) {
    console.error("Error during create property:", error.message);
    return error;

  }
}

// GET PROPERTY FETCH
export const getPropertyFetch = async (id) => {
  try {
    const response = await fetch('http://localhost:3000/api/v1/properties/' + id, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    });

    if (!response.ok) {
      throw new Error('Get Property failed. Please check your credentials and try again.');
    }

    return response.json()
  } catch (error) {
    return error;
  }
}

// UPDATE PROPERTY FETCH
export const updatePropertyFetch = async (title, price, description, id) => {
  try {
    const authToken = JSON.parse(Cookies.get("auth_token"));

    const data = {
      property: {
        title: title,
        price: price,
        description: description,
        user_id: authToken.user_id
      }
    };
    const response = await fetch('http://localhost:3000/api/v1/properties/' + id, {
      method: 'PATCH',
      headers: {
        'Authorization': authToken.token,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    });
    //console.log("Response Headers:", [...response.headers.entries()]);
    //console.log(data)
    if (!response.ok) {
      throw new Error('Update Properties failed. Please check your credentials and try again.');
    }

    return response
  } catch (error) {
    console.error("Error during update property:", error.message);
    return error;

  }
}

// DELETE PROPERTY FETCH
export const deletePropertyFetch = async (id) => {
  try {
    const authToken = JSON.parse(Cookies.get("auth_token"));

    const response = await fetch('http://localhost:3000/api/v1/properties/' + id, {
      method: 'DELETE',
      headers: {
        'Authorization': authToken.token,
        'Content-Type': 'application/json'
      }
    });

    if (!response.ok) {
      throw new Error('Delete Properties failed. Please check your credentials and try again.');
    }

    return response
  } catch (error) {
    console.error("Error during delete property:", error.message);
    return error;

  }
}