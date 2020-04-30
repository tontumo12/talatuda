export function authHeader() {
	// return Authorization header with jwt token
	let user = JSON.parse(localStorage.getItem('user'));
	
	if(user && user.accessToken) return {
		'Accept': 'application/json',
        'Content-Type': 'application/json',
        'x-access-token': user.accessToken
	};
	return {
		'Accept': 'application/json',
        'Content-Type': 'application/json',
	};
}
