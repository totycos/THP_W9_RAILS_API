// REGISTER FETCH
export const registerFetch = async (email, password) => {
    try {
        const data = {
            user: {
                email: email,
                password: password
            }
        };
        const response = await fetch('http://localhost:3000/api/v1/users', { // SET APPROPRIATE URL
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            throw new Error('Register failed. Please check your credentials and try again.');
        }

        return response
    } catch (error) {
        return error;
    }
}

// LOGIN FETCH 
export const loginFetch = async (email, password) => {
    try {
        const data = { // ADAPTER LES BODY A TRANSMETTRE A L'API
            user: {
                email: email,
                password: password
            }
        };

        const response = await fetch('http://localhost:3000/api/v1/users/sign_in', { // SET APPROPRIATE URL
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            throw new Error('Login failed. Please check your credentials and try again.');
        }

        return response
    } catch (error) {
        return error
    }
}
