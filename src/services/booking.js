import config from '../config'
import {
    authHeader
} from '../helpers'
import {
    authHost
} from '../helpers'
import {
    responseService
} from './response'
//const qs = require('qs');
export const booking = {
    bookingRoom,
    getAllBookingHotel
}

function bookingRoom(userId,roomId,body) {
    return responseService.fetchRetry(`${config.apiUrl}user/${userId}/room/${roomId}/booking`, {
        method: 'POST',
        headers: authHeader(),
        mode: 'cors', 
        body: JSON.stringify(body),
    }, 4)
}
function getAllBookingHotel(userId) {
    return responseService.fetchRetry(`${config.apiUrl}host/${userId}/booking`, {
        method: 'GET',
        headers: authHost(),
        mode: 'cors', 
    }, 4)
}